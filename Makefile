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

ROOT		= c:/tmp/opt/emacs-23.3/bin
RUNEMACS	= $(ROOT)/runemacs.exe
EMACSCLIENTW	= $(ROOT)/emacsclientw.exe
CFLAGS		= --ansi --pedantic -Wall -g

# According to the gnu-win32 faq it is possible to prevent the console
# window from showing up by adding "-Wl,-subsystem,windows"

CYGFLAGS	= -Wl,-subsystem,windows

BIN		= eclient.exe

# Rule: all - compile Cygwin wrapper to emacsclient (eclient)
all: $(BIN)

$(BIN): eclient.c
	gcc $(CFLAGSUSER) \
		$(CYGFLAGS) \
		-DRUNEMACS='"$(RUNEMACS)"' \
		-DEMACSCLIENTW='"$(EMACSCLIENTW)"' \
		$(CFLAGS) -o $(BIN) $<

# Rule: install - install to Emacs bin/ directory
install: all
	dir=$$(dirname $$(cygpath -u $(RUNEMACS))); \
	install -m 755 $(BIN) $$dir/$(BIN)

# Rule: help - display Makefile rules
help:
	grep "^# Rule:" Makefile | sort

# End of file
