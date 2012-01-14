/*  Copyright
 *
 *	Copyright (C) 2011-2012 Jari Aalto <jari.aalto@cante.net>
 *
 *  License
 *
 *	This program is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU General Public License as published by
 *	the Free Software Foundation; either version 2 of the License, or
 *	(at your option) any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *	GNU General Public License for more details.
 *
 *	You should have received a copy of the GNU General Public License
 *	along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 *  Description
 *
 *      Windows Emacs contains command emacsclientw.exe. Unfortunately it cannot
 *      be used directly with Firefox "It's all text" extension.
 *
 *      Point "It's all Text" extension to call this progam, and it reroutes the
 *      file editing to Emacs with suitable options for emacsclientw.exe.
 *
 *  NOTES
 *
 *      YOU CAN'T USE THIS AS IS. YOUR EMACS INSTALLATION PATHS ARE DIFFERENT.
 *
 *	See the included Makefile. Call makefile to define locations of RUNEMACS and
 *      EMACSCLIENTW according to your installation.
 *
 *      In principle:
 *	gcc --ansi --pedantic -Wall -D<define=value> ... -o eclient -g eclient.c
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#ifndef RUNEMACS
#define RUNEMACS "c:/tmp/opt/emacs-23.3/bin/runemacs.exe"
#endif

#ifndef EMACSCLIENTW
#define EMACSCLIENTW "c:/tmp/opt/emacs-23.3/bin/emacsclientw.exe"
#endif

int main (int argc, char * const argv[])
{
    char *cmd = EMACSCLIENTW;

    char *const param[] =
    {
        "--no-wait",
        "--alternate-editor",
        RUNEMACS,
        argc ? argv[1] : NULL,
        NULL
    };

    printf("%s %s %s %s %s\n",
           cmd,
           param[0],
           param[1],
           param[2],
           param[3] );

    execv(cmd, param);
    perror("eclient.exe: execv failed");

    return 0;
}

/* End of file */
