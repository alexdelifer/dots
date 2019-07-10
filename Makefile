DOTFILES := $(shell pwd)
HOMEDOTDEPENDENCIES := $(shell cat $(DOTFILES)/home-deps.txt)
ROOTDOTDEPENDENCIES := $(shell cat $(DOTFILES)/root-deps.txt)

default: stow-home

.PHONY: stow-home stow-root

# Runtime Dependencies for makefile here.
# https://stackoverflow.com/questions/5618615/check-if-a-program-exists-from-a-makefile
EXECUTABLES = stow git
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

# Config dependencies go here.
deps-home:
	yay -Syyu -q --needed $(HOMEDOTDEPENDENCIES)

deps-root:
	yay -Syyu -q --needed $(ROOTDOTDEPENDENCIES)

stow-home: deps-home
	mkdir -p \
			$(HOME)/.local/share/ \
			$(HOME)/.config/
	cd $(DOTFILES)/home && for i in */; do \
			if [ -d $$i ]; then \
			echo "PACKAGE: $$i"; \
				stow -R -v -t "$(HOME)" "$$i"; \
			fi \
	done


stow-root: deps-root
	cd $(DOTFILES)/root && for i in */; do \
			if [ -d $$i ]; then \
			echo "PACKAGE: $$i"; \
				sudo stow -R -v -t "/" "$$i"; \
			fi \
	done

nvim:
	nvim +PlugUpdate +q +q && echo "PACKAGE: nvim config installed."

zsh:
	echo "source $(HOME)/.zgen/zgen.zsh && source $(HOME)/.zshrc && zgen update && source $(HOME)/.zshrc && echo \"PACKAGE: zsh config installed\" && exit" | zsh

tmux:
	tmux new-session "tmux run-shell $(HOME)/.tmux/plugins/tpm/bindings/install_plugins" && echo "PACKAGE: tmux config installed"

spacemacs: 
		if [ ! -d $(HOME)/.emacs.d ]; then \
				git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d; \
		else \
				cd $(HOME)/.emacs.d && git pull; \
				fi && echo "PACKAGE: spacemacs installed"

doom-emacs: 
		if [ ! -d $(HOME)/.emacs.d ]; then \
				git clone -b develop https://github.com/hlissner/doom-emacs ~/.emacs.d; \
		else \
				cd $(HOME)/.emacs.d && git pull; \
				fi && echo "PACKAGE: doom-emacs installed"
