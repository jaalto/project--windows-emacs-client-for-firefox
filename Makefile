
RUNEMACS = c:\\tmp\\opt\\emacs-23.3\\bin\\runemacs.exe
CFLAGS = --ansi --pedantic -Wall -g

all: eclient

eclient: eclient.c 
	gcc $(CFLAGSUSER) -DRUNEMACS='"$(RUNEMACS)"' $(CFLAGS) -o $@ $<
