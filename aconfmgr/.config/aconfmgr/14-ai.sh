CheckConfig ai || return 0

# Ollama - local LLM server (custom service, binary in /usr/local/bin)
CopyFile /etc/systemd/system/ollama.service
CreateLink /etc/systemd/system/default.target.wants/ollama.service /etc/systemd/system/ollama.service

# AI coding tools
AddPackage --foreign claude-code # Anthropic Claude CLI coding agent
AddPackage opencode-desktop-bin # OpenCode desktop client
