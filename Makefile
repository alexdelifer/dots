DOTFILES := $(shell pwd)
ALLPKGS := $(shell find $$DOTFILES -maxdepth 1 -not -path '*/\.*' -not -path '.' -type d -printf '%f\n' )

.PHONY: install save diff apply check status add commit push

default: help

# Runtime Dependencies for makefile here.
# https://stackoverflow.com/questions/5618615/check-if-a-program-exists-from-a-makefile
EXECUTABLES = stow git aconfmgr nohup
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

help:
	@echo "$$(tput setaf 4)$$(tput bold)delifer dotfiles$$(tput sgr0)"
	@echo "$$(tput bold)Commands:$$(tput sgr0)"
	@echo "  $$(tput setaf 2)$$(tput bold)aconfmgr$$(tput sgr0)"
	@echo "    install, save, diff, apply, check"
	@echo "  $$(tput setaf 2)$$(tput bold)git$$(tput sgr0)"
	@echo "    status, add, commit, push"

install: 
	$(DOTFILES)/install.sh $(ALLPKGS)

save:
	aconfmgr save

diff:
	aconfmgr --skip-checksums diff /

apply:
	aconfmgr --skip-checksums apply

check:
	aconfmgr check

status:
	git status

add:
	git add -i .

commit:
	git commit -m "Auto: $$(date)"

push:
	git push