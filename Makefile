
ROOT		= c:\\tmp\\opt\\emacs-23.3\\bin
RUNEMACS 	= $(ROOT)\\runemacs.exe
EMACSCLIENTW 	= $(ROOT)\\emacsclientw.exe
CFLAGS   	= --ansi --pedantic -Wall -g
BIN	 	= eclient.exe

all: $(BIN)

$(BIN): eclient.c 
	gcc $(CFLAGSUSER) \
		-DRUNEMACS='"$(RUNEMACS)"' \
		-DEMACSCLIENTW='"$(EMACSCLIENTW)"' \
		$(CFLAGS) -o $(BIN) $<

install: all
	dir=$$(dirname $$(cygpath -u $(RUNEMACS))); \
	install -m 755 $(BIN) $$dir/$(BIN)

# End of file
