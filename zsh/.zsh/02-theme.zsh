#  Prompt: Starship (config: ~/.config/starship.toml, stow package `starship`).
#  Falls back to a plain Δ prompt if starship isn't installed yet.

if (( $+commands[starship] )); then
	eval "$(starship init zsh)"
else
	PROMPT='%F{blue}%~%f
%(?.%F{magenta}.%F{red})Δ%f '
fi
