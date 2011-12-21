/* 
 * gcc --ansi --pedantic -Wall -o eclient -g eclient.c
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
