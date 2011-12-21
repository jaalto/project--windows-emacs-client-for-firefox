
RUNEMACS = c:\\tmp\\opt\\emacs-23.3\\bin\\runemacs.exe
CFLAGS   = --ansi --pedantic -Wall -g
BIN	 = eclient.exe

all: $(BIN)

$(BIN): eclient.c 
	gcc $(CFLAGSUSER) -DRUNEMACS='"$(RUNEMACS)"' $(CFLAGS) -o $(BIN) $<

install: all
	dir=$$(dirname $$(cygpath -u $(RUNEMACS))); \
	install -m 755 $(Bin) $$dir/$(BIN)

# End of file
