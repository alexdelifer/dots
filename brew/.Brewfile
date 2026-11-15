# macOS packages (stow package `brew` → ~/.Brewfile). The Arch side is aconfmgr.
#   brew bundle --global            install everything listed here
#   brew bundle check --global      what's missing
#   brew bundle cleanup --global    what's installed but not listed (add --force to remove)
#   brew bundle dump --global --force   overwrite this file from what's installed (loses grouping)

# Taps
tap "charmbracelet/tap"
tap "esolitos/ipa"
tap "messense/macos-cross-toolchains"
tap "openclaw/tap"

# Shell + modern CLI
brew "stow"
brew "starship"
brew "fzf"
brew "atuin"
brew "zoxide"
brew "direnv"
brew "eza"
brew "bat"
brew "fd"
brew "ripgrep"
brew "the_silver_searcher"
brew "git-delta"
brew "lazygit"
brew "gh"
brew "yazi"
brew "btop"
brew "tlrc"
brew "tmux"
brew "neovim"
brew "tree-sitter-cli"
brew "coreutils"
brew "asciinema"
brew "charmbracelet/tap/freeze", trusted: true

# Languages / toolchains
brew "mise"
brew "go"
brew "node@24", link: true
brew "uv"
brew "zig"
brew "powershell"
brew "mingw-w64"
brew "arm-linux-gnueabihf-binutils"
brew "messense/macos-cross-toolchains/armv7-unknown-linux-gnueabihf", trusted: true
brew "upx"
brew "librsvg"

# Network / pentest
brew "nmap"
brew "rustscan"
brew "hashcat"
brew "ghidra"
brew "semgrep"
brew "wireshark"
brew "socat"
brew "sshuttle"
brew "autossh"
brew "esolitos/ipa/sshpass", trusted: true
brew "mtr"
brew "dnsmasq"
brew "lftp"
brew "freerdp"
brew "tiger-vnc"
brew "flashrom"

# AI tooling
brew "ollama"
brew "opencode"
brew "block-goose-cli"
brew "openclaw/tap/peekaboo", trusted: true

# Media
brew "mpv"

# Apps
cask "font-iosevka-nerd-font"
cask "opencode-desktop"
cask "realvnc-connect-viewer"
cask "wireshark-app"

# Editor extensions
vscode "anthropic.claude-code"
vscode "eamodio.gitlens"
vscode "parallelsdesktop.parallels-desktop"
vscode "sdras.night-owl"

# Go / npm / uv tools
go "github.com/zsrv/supermicro-product-key"
npm "corepack"
npm "opencode-ai"

# Private / machine-local entries (work tools etc.) live in an untracked
# ~/.Brewfile.local, pulled in here when it exists. This repo is public.
local_brewfile = File.expand_path("~/.Brewfile.local")
instance_eval(File.read(local_brewfile), local_brewfile) if File.exist?(local_brewfile)
