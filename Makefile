#   Copyright
#
#	Copyright (C) 2011-2012 Jari Aalto <jari.aalto@cante.net>
#
#   License
#
#	This program is free software; you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation; either version 2 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   Description
#
#	Compile a small wrapper script "eclient" that acts as a glue
#	to Native Windows Emacs emacsclient.exe. The "eclient" will
#	pass all the appropriate options to emacsclient.exe. The
#	"eclient" call is therefore all that is needed, whereas
#	"emacsclient" would have to be called with varíous options.
#
#   Usage
#
#	make help
#	make ROOT="c:/path/to/emacs-23.2/bin" all install

ROOT := $(wildcard \
 C:/Program Files (x86)/emacs*/bin\
 C:/Program Files/emacs*/bin\
 D:/Program Files/emacs*/bin\
 C:/tmp/opt/emacs*/bin\
 D:/tmp/opt/emacs*/bin)

ROOT := $(strip $(ROOT))

EMACSDOTDIR     = $(HOME)/.emacs.d
SERVERDIR	= $(EMACSDOTDIR)/server

RUNEMACS	= $(ROOT)/runemacs.exe
EMACSCLIENTW	= $(ROOT)/emacsclientw.exe
CFLAGS_STD	= -std=c99 --ansi
CFLAGS_DEBUG	= -g
CFLAGS_LINT	= -Wall --pedantic
CFLAGS		= $(CFLAGS_STD) $(CFLAGS_LINT) $(CFLAGS_DEBUG)
NAME		= eclient
BIN		= $(NAME).exe

# According to the gnu-win32 faq it is possible to prevent the console
# window from showing up by adding "-Wl,-subsystem,windows"

CYGFLAGS	= -Wl,-subsystem,windows

# Rule: all - compile Cygwin wrapper to emacsclient (eclient)
all: check $(BIN)

# Rule: clean - remove compiled binaries
clean:
	rm -f $(BIN)

check:
	# Check that ROOT directory exists. Use "make ROOT=<directory>" to change
	[ -d "$(ROOT)" ]

	# Make sure HOME variable is defined	
	[ -d "$(HOME)" ]

	# Check that Emacs server directory exists for M-x server-start
	# Create this with "make server" to use correct permissions
	[ -d "$(SERVERDIR)" ]

# Rule: server - for M-x server-start command, create correct direcory
server:
	# Create Emacs dot directory for server
	mkdir -p "$(SERVERDIR)"
	# set correct permissions
	setfacl --file 700.setfacl "$(SERVERDIR)"
	
$(BIN): eclient.c
	@echo "# Compiling with path ROOT=$(ROOT)"
	gcc $(CFLAGSUSER) \
		$(CYGFLAGS) \
		-DRUNEMACS='"$(RUNEMACS)"' \
		-DEMACSCLIENTW='"$(EMACSCLIENTW)"' \
		$(CFLAGS) -o $(BIN) $<

# Rule: install - install to Emacs bin/ directory
install: $(BIN)
	dir="$$(dirname $$(cygpath --unix '$(RUNEMACS)'))"; \
	install -m 755 "$(BIN)" "$$dir/$(BIN)"; \
	echo In Firefox add-on, use path: $$(cygpath --windows "$$dir/$(BIN)")

# Rule: help - display Makefile rules
help:
	@grep "^# Rule:" Makefile | sort
	@echo An example: make ROOT="c:/path/to/emacs-23.2/bin" server all install

.PHONY: install help check

# End of file
