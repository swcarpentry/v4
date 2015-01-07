all : commands

## commands   : show all commands
commands :
	@grep -E '^##' Makefile | sed -e 's/## //g'

## site       : build locally into _site directory for checking
site :
	jekyll build -t -d _site

$(DST) : $(SRC)

## clean      : clean up
clean :
	rm -rf _site $$(find . -name '*~' -print)
