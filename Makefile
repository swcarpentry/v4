# Installation directory on server.
INSTALL = $(HOME)/sites/software-carpentry.org/v4

.phony : site

## all        : make everything
all : _site/index.html

## commands   : show all commands
commands :
	@grep -E '^##' Makefile | sed -e 's/## //g'

_site/index.html : index.html
	jekyll build -t -d _site

## install    : install on server
install :
	rm -rf $(INSTALL)
	mkdir -p $(INSTALL)
	cp -r _site/* $(INSTALL)

## clean      : clean up
clean :
	rm -rf _site $$(find . -name '*~' -print)
