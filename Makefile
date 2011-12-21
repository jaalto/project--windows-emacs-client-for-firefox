
ROOT		= c:/tmp/opt/emacs-23.3/bin
RUNEMACS 	= $(ROOT)/runemacs.exe
EMACSCLIENTW 	= $(ROOT)/emacsclientw.exe
CFLAGS   	= --ansi --pedantic -Wall -g

# According to the gnu-win32 faq it is possible to prevent the console
# window from showing up by adding "-Wl,-subsystem,windows"

CYGFLAGS	= -Wl,-subsystem,windows

BIN	 	= eclient.exe

all: $(BIN)

$(BIN): eclient.c 
	gcc $(CFLAGSUSER) \
		$(CYGFLAGS) \
		-DRUNEMACS='"$(RUNEMACS)"' \
		-DEMACSCLIENTW='"$(EMACSCLIENTW)"' \
		$(CFLAGS) -o $(BIN) $<

install: all
	dir=$$(dirname $$(cygpath -u $(RUNEMACS))); \
	install -m 755 $(BIN) $$dir/$(BIN)

# End of file
