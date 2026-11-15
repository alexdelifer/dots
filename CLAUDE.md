# CLAUDE.md — dots repo

This is the canonical dotfiles repo for Alex Delifer's Arch Linux / Hyprland workstation and macOS laptop.
Path: `~/dots` — path-stable, do not relocate.

## Portability (macOS + Linux)

Shared config must work on both. Gate anything OS-specific:

- zsh: OS-only env/aliases/functions go in `zsh/.zsh/05-darwin.zsh` or `zsh/.zsh/05-linux.zsh`; each starts with an `$OSTYPE` check and `return 0` elsewhere. They export `IS_MAC` / `IS_LINUX` and `CLIP_COPY` / `CLIP_PASTE` (pbcopy vs wl-copy) for use in shared fragments.
- `zsh/.zprofile`: OS bits in a `case "$OSTYPE"` block (Homebrew `shellenv` on darwin).
- Guard tool use with `(( $+commands[tool] ))` rather than assuming it is installed.
- Machine-local, untracked overrides: `~/.zshrc.local`.
- System packages: aconfmgr on Arch; Homebrew on macOS (not tracked yet).

## Shell Stack

- Plugin manager: zinit (`zsh/.zsh/00-zinit.zsh`). `compinit` runs exactly once, in `93-style.zsh`, followed by `fzf-tab`; autosuggestions and fast-syntax-highlighting load in turbo mode after it.
- Prompt: Starship, config in the `starship` stow package (`~/.config/starship.toml`), Night Owl palette, `Δ` prompt char. `.p10k.zsh` is legacy and no longer sourced.
- fzf: `zsh/.zsh/15-fzf.zsh` (`fzf --zsh` bindings, fd sources, bat/eza previews, Night Owl colors). Owns Ctrl-T and Alt-C.
- atuin: `zsh/.zsh/16-atuin.zsh` owns Ctrl-R (Up arrow stays zsh prefix search). Config in the `atuin` stow package; `ATUIN_CONFIG_DIR` points there because newer atuin defaults to `~/.atuin`. History DB stays in `~/.atuin/data` (untracked). Sync is off until `atuin login`.
- yazi: `y` wrapper in `90-alias.zsh` (cd to last dir on quit).

## Editor + Multiplexer

- **nvim** (`nvim/.config/nvim/`): Lua, lazy.nvim, Night Owl (`oxfist/night-owl.nvim`, transparent bg). Layout: `lua/config/{options,keymaps,autocmds,lazy}.lua`, `lua/plugins/{ui,editor,coding,hacker}.lua`. `lazy-lock.json` is committed (pinned plugin versions; update with `:Lazy update` then commit the lockfile). LSP: mason + nvim-lspconfig with `vim.lsp.config`/automatic enable; servers listed in `coding.lua`. Treesitter is the `main` branch and needs `tree-sitter-cli`. Finder is fzf-lua (shares FZF_DEFAULT_OPTS colours). Use `\u{XXXX}` escapes for Nerd Font icons in Lua files (raw private-use glyphs get stripped by some editors/tools).
- **tmux** (`tmux/.config/tmux/`): XDG config, prefix `C-a`, Night Owl status bar at top, helper scripts in `scripts/` (`session-picker`, `vpn-ip`). tpm + plugins live in `~/.local/share/tmux/plugins` (outside the repo, bootstrapped by the config or `tmux/install.sh`). Pane logs go to `~/tmux-logs`.
- zsh glue: `t` (tmux attach/picker), `v` (nvim); inside tmux, fzf widgets and fzf-tab open as popups (`15-fzf.zsh`).
- Stow these with `--ignore=install.sh` when stowing by hand (the Makefile/installer already does).

## Other Stow Packages (cross-platform)

| Package | Target | Notes |
|---------|--------|-------|
| `starship` | `~/.config/starship.toml` | prompt |
| `atuin` | `~/.config/atuin/` | history search + Night Owl theme |
| `delta` | `~/.config/git/config` | git pager; XDG git config so per-machine `~/.gitconfig` (identity, creds) still wins. On macOS the `git` package is not stowed. |
| `ghostty` | `~/.config/ghostty/config.ghostty` | macOS terminal; the `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` file must stay empty (it loads last and overrides) |
| `brew` | `~/.Brewfile` | macOS packages, `brew bundle --global` |

## Repo Layout

- **Stow packages**: each top-level directory (e.g. `zsh/`, `hyprland/`, `nvim/`) is a GNU Stow package symlinked into `~/`.
- `opencode/` — OpenCode user-level customizations (skills, agents, commands, tools); stow with `--no-folding` because live `~/.config/opencode` also contains unmanaged runtime files.
- **aconfmgr**: `aconfmgr/.config/aconfmgr/` — declarative system-level package and config management.
- `Makefile` / `bootstrap.sh` / `install.sh` / `post-install.sh` — provisioning entrypoints.

## Rule: Check Here Before Editing Live Config

If a live config file under `~/.config/`, `/etc/`, etc. is tracked here, edit it in `~/dots` and re-stow. Do not patch the live file directly and skip the repo.

## aconfmgr

Config lives at `~/dots/aconfmgr/.config/aconfmgr/`.

Modules and what they own:

| File | Module |
|------|--------|
| `01-config.sh` | enabled module list |
| `10-ignores.sh` | ignored paths |
| `11-cli.sh` | CLI tools and shell packages |
| `12-system.sh` | core system packages and config |
| `14-ai.sh` | AI/LLM tooling (ollama, claude-code, opencode) |
| `15-hardware.sh` | GPU/CPU/bluetooth/wifi, auto-detects desktop vs laptop |
| `16-pipewire.sh` | audio stack |
| `19-dev.sh` | dev tooling |
| `20-hacker.sh` | pentest tools |
| `30-xorg.sh` | XWayland/X11 base (no i3/sway/X11-only tools) |
| `31-fonts.sh` | fonts |
| `40-hyprland.sh` | Hyprland WM, Wayland tools, desktop apps |
| `41-gui.sh` | GUI apps |
| `60-game.sh` | gaming |
| `90-harden.sh` | hardening |

**When to update aconfmgr**: any time you add/remove a system package or change a system-level config file (under `/etc/`), accompany it with the corresponding aconfmgr module edit.

## Legacy Packages

`legacy/` contains stow packages that are no longer active but kept for reference:
- `i3/`, `sway/` — replaced by Hyprland
- `picom/`, `autorandr/`, `xob/` — X11-era tools, dead on Wayland
- `dunst/` — replaced by mako
- `flashfocus/` — replaced by hyprfocus plugin
- `neomutt/` — not in use

Do not stow from `legacy/`. Archive only.

## Stow Usage

```bash
# Apply a package
stow -d ~/dots -t ~ <package>

# Remove a package
stow -d ~/dots -t ~ -D <package>

# Dry run
stow -d ~/dots -t ~ -n -v <package>
```

## User Profile

- Alex Delifer, penetration tester, Montreal
- Preferred style: concise, technical, bullets. No over-explaining.

## CLI Tool Preferences

- search: `rg` over `grep`, `fd` over `find`, `rga` for non-plain-text search
- viewing: `bat` over `cat`, `eza` over `ls`, `tree` for small recursive overviews
- interactive narrowing: `fzf`
- structured data: `jq` for JSON, `yq` for YAML/TOML/XML
- HTTP: `xh` for exploratory, `curl` for scripted
- disk/system: `duf`, `dust`, `ncdu`, `btop`, `procs`, `lnav`
- code/migration: `sd`, `difft` (difftastic), `just`, `watchexec`, `hyperfine`
- shell workflow: `direnv`, `zoxide`
- git TUI: `lazygit`
- markdown/Obsidian: `zk`

Notes: `difftastic` is invoked as `difft`; `ripgrep-all` as `rga`.

## Key Working Paths

- `~/src -> /mnt/DEV/src`
- `~/lab -> /mnt/DEV/lab/ansible`
- `~/ansible -> /mnt/DEV/work/ansible`
- `~/Obsidian/DELIFER` — canonical Obsidian knowledge base
- `~/Obsidian/DELIFER/skills` — canonical shared custom skills (source of truth for Claude and Codex)
- `/mnt/HACK` — canonical pentest root

## Storage Context (relevant to this repo)

- `/` — system config and packages (tracked by aconfmgr)
- `~/dots` — user config (tracked by Stow in this repo)
- `/mnt/DEV` — active work, repos, build trees
- `/mnt/STORAGE` — archive, ISOs, firmware, bulk (also `/data`)
- `/mnt/HACK` — pentest artifacts, loot, reports
- When adding a config: user-space → new Stow package here; system-space → aconfmgr module
- When unsure: active and edited soon → DEV; archival → STORAGE; pentest artifacts → HACK

## Hardware Notes

- `aconfmgr` `15-hardware.sh` module auto-detects GPU/CPU/bluetooth/wifi and desktop vs laptop — keep conditionals in that module rather than hardcoding per-machine values elsewhere.

## Change Rule

If a task changes how this repo works (new module, new Stow package, provisioning change), update this file and the relevant `🤖 AI/SYSTEM_MAP.md` note in `~/Obsidian/DELIFER` in the same task.
