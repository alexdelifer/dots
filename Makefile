DOTFILES := $(shell pwd)
ALLPKGS := $(shell find $$DOTFILES -maxdepth 1 -not -path '*/\.*' -not -path '.' -type d -printf '%f\n' )

.PHONY: install save diff apply check status

default: install

# Runtime Dependencies for makefile here.
# https://stackoverflow.com/questions/5618615/check-if-a-program-exists-from-a-makefile
EXECUTABLES = stow git aconfmgr nohup
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

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
	git commit -m "Auto: $(date)"

push:
	git push