CheckConfig ai || return 0

# Ollama - local LLM server (custom service, binary in /usr/local/bin)
CopyFile /etc/systemd/system/ollama.service

# AI coding tools
AddPackage --foreign claude-code # Anthropic Claude CLI coding agent
AddPackage opencode # OpenCode coding agent

# synced from mele 2026-11-17
AddPackage claude-code # An agentic coding tool that lives in your terminal
AddPackage claude-desktop # Official Claude AI desktop app from Anthropic — Chat, Cowork, and Claude Code
AddPackage ollama # Create, run and share large language models (LLMs)
AddPackage openai-codex # OpenAIs lightweight coding agent that runs in your terminal
AddPackage opencode-desktop-bin # OpenCode desktop client
