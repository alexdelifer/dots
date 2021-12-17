DOTFILES := $(shell pwd)

.PHONY: install

default: install

# Runtime Dependencies for makefile here.
# https://stackoverflow.com/questions/5618615/check-if-a-program-exists-from-a-makefile
EXECUTABLES = stow git
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))


install: 
	$(DOTFILES)/install.sh