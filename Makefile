# Build directory locally.
SITE=_site

# Installation directory on server.
INSTALL = $(HOME)/sites/software-carpentry.org/v4

all : commands

## commands   : show all commands
commands :
	@grep -E '^##' Makefile | sed -e 's/## //g'

## site       : build locally into _site directory for checking
site :
	jekyll build -t -d $(SITE)

## install    : install on server
install :
	rm -rf $(INSTALL)
	mkdir -p $(INSTALL)
	cp -r $(SITE)/* $(INSTALL)

## clean      : clean up
clean :
	rm -rf $(SITE) $$(find . -name '*~' -print)
