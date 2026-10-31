import { tool } from "@opencode-ai/plugin"
import { join } from "path"

const HELPER = join(
  process.env.HOME ?? "/home/alex",
  ".config/opencode/skills/claude-code-delegate/scripts/claude_task.py",
)

export default tool({
  description:
    "Delegate a bounded coding or research task to Claude Code headless (`claude -p`) and return its result. Use this instead of Bash when the user asks for Claude Code, Claude as a subagent, an independent Claude review/implementation, or `claude -p`. Defaults to read-only planning unless execute=true or permissionMode is set.",
  args: {
    task: tool.schema.string().min(1).describe("Bounded work order for Claude Code"),
    cwd: tool.schema.string().optional().describe("Working directory; defaults to the current OpenCode directory"),
    model: tool.schema.string().optional().describe("Claude model alias or full model ID, e.g. haiku, sonnet, opus, fable, claude-mythos-5-1"),
    execute: tool.schema.boolean().optional().describe("Allow edits/commands via Claude acceptEdits mode. Default false = read-only plan mode"),
    permissionMode: tool.schema
      .enum(["acceptEdits", "auto", "bypassPermissions", "manual", "dontAsk", "plan"])
      .optional()
      .describe("Explicit Claude permission mode; overrides execute"),
    allowedTools: tool.schema.string().optional().describe("Claude tool allowlist, comma/space separated"),
    disallowedTools: tool.schema.string().optional().describe("Claude tool denylist, comma/space separated"),
    addDirs: tool.schema.array(tool.schema.string()).optional().describe("Extra directories Claude Code may access"),
    json: tool.schema.boolean().optional().describe("Return Claude Code JSON output instead of plain text"),
    maxBudgetUsd: tool.schema.number().positive().optional().describe("Maximum Claude API budget in USD"),
    timeoutSeconds: tool.schema.number().int().positive().max(3600).optional().describe("Timeout in seconds, default 900"),
    name: tool.schema.string().optional().describe("Claude session display name"),
    resume: tool.schema.string().optional().describe("Resume an existing Claude Code session ID"),
  },
  async execute(args, context) {
    const cwd = args.cwd || context.directory || context.worktree
    const title = `Claude Code${args.model ? ` (${args.model})` : ""}`
    context.metadata({
      title,
      metadata: {
        cwd,
        model: args.model ?? null,
        execute: Boolean(args.execute),
        permissionMode: args.permissionMode ?? null,
        json: Boolean(args.json),
      },
    })

    const cmd = ["python3", HELPER, "--cwd", cwd]

    if (args.model) cmd.push("--model", args.model)
    if (args.permissionMode) cmd.push("--permission-mode", args.permissionMode)
    if (args.execute) cmd.push("--execute")
    if (args.allowedTools) cmd.push("--allowed-tools", args.allowedTools)
    if (args.disallowedTools) cmd.push("--disallowed-tools", args.disallowedTools)
    for (const dir of args.addDirs ?? []) cmd.push("--add-dir", dir)
    if (args.json) cmd.push("--json")
    if (args.maxBudgetUsd) cmd.push("--max-budget-usd", String(args.maxBudgetUsd))
    if (args.timeoutSeconds) cmd.push("--timeout", String(args.timeoutSeconds))
    if (args.name) cmd.push("--name", args.name)
    if (args.resume) cmd.push("--resume", args.resume)

    cmd.push("--task", args.task)

    try {
      const proc = Bun.spawn(cmd, {
        cwd,
        stdout: "pipe",
        stderr: "pipe",
      })

      const [stdout, stderr] = await Promise.all([
        new Response(proc.stdout).text(),
        new Response(proc.stderr).text(),
      ])
      const exitCode = await proc.exited

      const out = stdout.trim()
      const err = stderr.trim()
      const body = [out || "(no stdout)", err ? `stderr:\n${err}` : null]
        .filter(Boolean)
        .join("\n\n")

      return {
        output: exitCode === 0 ? body : `Claude Code failed with exit ${exitCode}.\n\n${body}`,
        metadata: {
          exitCode,
          model: args.model ?? null,
          cwd,
        },
      }
    } catch (error) {
      return {
        output: `Failed to start Claude Code delegation helper: ${error instanceof Error ? error.message : String(error)}`,
        metadata: { exitCode: 127, cwd },
      }
    }
  },
})
