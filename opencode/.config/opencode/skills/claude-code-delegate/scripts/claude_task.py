#!/usr/bin/env python3
"""Run a bounded Claude Code headless task from OpenCode.

This wrapper keeps `claude -p` invocations consistent: prompt via argv/stdin,
non-interactive permission prompts denied, sane read-only default, optional
edit-capable mode, optional live stdout streaming, and machine-readable output
when requested.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import selectors
import shlex
import shutil
import subprocess
import sys
import time

DEFAULT_APPEND = """You are running as a delegated Claude Code task from OpenCode.
Be concise and technical. Stay inside the working directory and explicit --add-dir roots unless the prompt names another path.
Do not make git mutations: no commit, push, reset, rebase, checkout, tag, or branch changes.
Do not modify OpenCode, Claude Code, Hermes, dotfiles, or credential configuration unless the prompt explicitly asks for that exact change.
Return exactly:
RESULT: <answer or summary>
CHANGED_FILES: <comma-separated paths or none>
NOTES: <assumptions, failures, follow-ups, or none>"""


def split_tools(value: str | None) -> list[str]:
    if not value:
        return []
    parts = re.split(r",", value) if "," in value else re.split(r"\s+", value)
    return [part.strip() for part in parts if part.strip()]


def prompt_from_args(args: argparse.Namespace) -> str:
    if args.task:
        return args.task
    if args.prompt:
        return " ".join(args.prompt).strip()
    if not sys.stdin.isatty():
        return sys.stdin.read().strip()
    raise SystemExit("task is required: use --task, positional prompt, or stdin")


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        description="Run Claude Code headless (`claude -p`) with OpenCode-friendly defaults."
    )
    p.add_argument("prompt", nargs="*", help="Task prompt if --task/stdin is not used")
    p.add_argument("--task", "-t", help="Task prompt")
    p.add_argument("--cwd", default=os.getcwd(), help="Working directory for Claude Code")
    p.add_argument("--add-dir", action="append", default=[], help="Additional directory Claude may access")
    p.add_argument("--model", help="Claude model alias or full model name")
    p.add_argument("--agent", help="Claude Code agent to use")
    p.add_argument("--agents", help="Claude Code custom agents JSON string or file path")
    p.add_argument("--permission-mode", choices=["acceptEdits", "auto", "bypassPermissions", "manual", "dontAsk", "plan"], help="Claude permission mode")
    p.add_argument("--execute", action="store_true", help="Allow edits/commands by default (sets permission mode acceptEdits unless --permission-mode is supplied)")
    p.add_argument("--restricted", action="store_true", help="Use Claude Code restricted mode")
    p.add_argument("--safe-mode", action="store_true", help="Disable Claude Code customizations for troubleshooting")
    p.add_argument("--tools", help="Exact built-in tool list for --tools (comma/space separated)")
    p.add_argument("--allowed-tools", help="Tool allowlist for --allowedTools (comma/space separated)")
    p.add_argument("--disallowed-tools", help="Tool denylist for --disallowedTools (comma/space separated)")
    p.add_argument("--max-budget-usd", help="Maximum Claude API budget for this run")
    p.add_argument("--timeout", type=int, default=900, help="Subprocess timeout in seconds (default: 900)")
    p.add_argument("--output-format", choices=["text", "json", "stream-json"], default="text", help="Claude output format")
    p.add_argument("--json", action="store_true", help="Shortcut for --output-format json")
    p.add_argument("--stream", action="store_true", help="Stream assistant text gradually (default for normal text output)")
    p.add_argument("--no-stream", action="store_true", help="Wait for the final response instead of streaming text")
    p.add_argument("--name", help="Claude session display name")
    p.add_argument("--resume", help="Resume a Claude session ID")
    p.add_argument("--session-id", help="Use a specific Claude session UUID")
    p.add_argument("--append-system-prompt", default=DEFAULT_APPEND, help="System prompt appended to Claude Code")
    p.add_argument("--no-default-append", action="store_true", help="Do not append the OpenCode delegation system prompt")
    p.add_argument("--extra-args", action="append", default=[], help="Extra raw claude CLI args as one shell-like string; repeatable")
    p.add_argument("--dry-run", action="store_true", help="Print the command without running it")
    return p


def run_streaming(cmd: list[str], cwd: str, timeout: int, parse_text: bool) -> int:
    """Stream stdout/stderr while the process runs.

    parse_text=True converts Claude's stream-json JSONL into readable text deltas.
    parse_text=False relays raw stdout bytes, useful for stream-json consumers.
    """
    proc = subprocess.Popen(
        cmd,
        cwd=cwd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        bufsize=0,
    )
    sel = selectors.DefaultSelector()
    sel.register(proc.stdout, selectors.EVENT_READ, "stdout")
    sel.register(proc.stderr, selectors.EVENT_READ, "stderr")

    state = {"pending_stdout": b"", "saw_text": False, "result": None, "result_is_error": False}
    started = time.monotonic()
    deadline = started + timeout
    timed_out = False

    def emit_jsonl(line: bytes) -> None:
        try:
            obj = json.loads(line)
        except Exception:
            return

        if obj.get("type") == "stream_event":
            event = obj.get("event") or {}
            if event.get("type") == "content_block_delta":
                delta = event.get("delta") or {}
                if delta.get("type") == "text_delta":
                    text = delta.get("text") or ""
                    if text:
                        sys.stdout.write(text)
                        sys.stdout.flush()
                        state["saw_text"] = True
        elif obj.get("type") == "result":
            state["result"] = obj.get("result")
            state["result_is_error"] = bool(obj.get("is_error"))

    def handle_stdout(data: bytes, final: bool = False) -> None:
        pending = state["pending_stdout"] + data
        while True:
            idx = pending.find(b"\n")
            if idx < 0:
                break
            line = pending[:idx]
            pending = pending[idx + 1 :]
            if parse_text:
                emit_jsonl(line)
            else:
                sys.stdout.buffer.write(line + b"\n")
                sys.stdout.buffer.flush()
        state["pending_stdout"] = pending
        if final and pending:
            line = pending
            state["pending_stdout"] = b""
            if parse_text:
                emit_jsonl(line)
            else:
                sys.stdout.buffer.write(line)
                sys.stdout.buffer.flush()

    while sel.get_map():
        if not timed_out and time.monotonic() > deadline:
            timed_out = True
            proc.kill()

        for key, _ in sel.select(timeout=0.1):
            try:
                data = os.read(key.fileobj.fileno(), 65536)
            except OSError:
                data = b""

            if not data:
                if key.data == "stdout":
                    handle_stdout(b"", final=True)
                try:
                    sel.unregister(key.fileobj)
                except Exception:
                    pass
                continue

            if key.data == "stdout":
                handle_stdout(data)
            else:
                sys.stderr.buffer.write(data)
                sys.stderr.buffer.flush()

        if proc.poll() is not None and not sel.get_map():
            break

    rc = proc.wait()

    if parse_text:
        result = state["result"]
        if not state["saw_text"] and isinstance(result, str) and result:
            sys.stdout.write(result)
            if not result.endswith("\n"):
                sys.stdout.write("\n")
            sys.stdout.flush()
        elif state["saw_text"]:
            # Text deltas often do not end with a terminal newline.
            sys.stdout.flush()

    if timed_out:
        print(f"error: claude timed out after {timeout}s", file=sys.stderr)
        return 124
    return rc


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    prompt = prompt_from_args(args)
    cwd = os.path.abspath(os.path.expanduser(args.cwd))
    claude = shutil.which("claude")
    if not claude:
        print("error: claude CLI not found in PATH", file=sys.stderr)
        return 127

    if args.stream and args.no_stream:
        parser.error("--stream and --no-stream are mutually exclusive")
    if args.stream and (args.json or args.output_format != "text"):
        parser.error("--stream cannot be combined with --json or --output-format")
    if args.no_stream and args.output_format == "stream-json":
        parser.error("--no-stream cannot be combined with --output-format stream-json")

    mode = args.permission_mode or ("acceptEdits" if args.execute else "plan")
    requested_format = "json" if args.json else args.output_format
    if requested_format == "text" and not args.no_stream:
        output_format = "stream-json"
        stream_parse_text = True
    elif requested_format == "stream-json":
        output_format = "stream-json"
        stream_parse_text = False
    else:
        output_format = requested_format
        stream_parse_text = False
    stream_json = output_format == "stream-json"

    cmd = [
        claude,
        "-p",
        "--permission-mode",
        mode,
        "--permission-prompts",
        "none",
        "--output-format",
        output_format,
    ]

    if stream_json:
        cmd += ["--verbose", "--include-partial-messages"]

    for directory in args.add_dir:
        cmd += ["--add-dir", directory]
    if args.model:
        cmd += ["--model", args.model]
    if args.agent:
        cmd += ["--agent", args.agent]
    if args.agents:
        cmd += ["--agents", args.agents]
    if args.restricted:
        cmd += ["--restricted"]
    if args.safe_mode:
        cmd += ["--safe-mode"]
    if tools := split_tools(args.tools):
        cmd += ["--tools", *tools]
    if allowed := split_tools(args.allowed_tools):
        cmd += ["--allowedTools", *allowed]
    if disallowed := split_tools(args.disallowed_tools):
        cmd += ["--disallowedTools", *disallowed]
    if args.max_budget_usd:
        cmd += ["--max-budget-usd", args.max_budget_usd]
    if args.name:
        cmd += ["--name", args.name]
    if args.resume:
        cmd += ["--resume", args.resume]
    if args.session_id:
        cmd += ["--session-id", args.session_id]
    if args.append_system_prompt and not args.no_default_append:
        cmd += ["--append-system-prompt", args.append_system_prompt]
    for extra in args.extra_args:
        cmd += shlex.split(extra)

    cmd.append(prompt)

    if args.dry_run:
        print(shlex.join(cmd))
        return 0

    if stream_json:
        return run_streaming(cmd, cwd, args.timeout, parse_text=stream_parse_text)

    try:
        proc = subprocess.run(
            cmd,
            cwd=cwd,
            capture_output=True,
            text=True,
            timeout=args.timeout,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        if exc.stdout:
            print(exc.stdout, end="")
        if exc.stderr:
            print(exc.stderr, end="", file=sys.stderr)
        print(f"error: claude timed out after {args.timeout}s", file=sys.stderr)
        return 124

    if proc.stdout:
        print(proc.stdout, end="")
    if proc.stderr:
        print(proc.stderr, end="", file=sys.stderr)
    return proc.returncode


if __name__ == "__main__":
    raise SystemExit(main())
