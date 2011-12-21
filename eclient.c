/* 
 * gcc --ansi --pedantic -Wall -o eclient -g eclient.c
 */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef RUNEMACS
#define RUNEMACS "c:\\tmp\\opt\\emacs-23.3\\bin\\runemacs.exe"
#endif

#ifndef EMACSCLIENTW
#define EMACSCLIENTW "c:\\tmp\\opt\\emacs-23.3\\bin\\emacsclientw.exe"
#endif

int main (int argc, char * const argv[])
{
    char *bin = EMACSCLIENTW;

    char *arr[4];
    arr[0] = "--no-wait";
    arr[1] = "--alternate-editor";
    arr[2] = RUNEMACS;
    arr[3] = (char *) 0;
    
    if (argc)
       arr[3]= argv[1];

    printf("%s %s %s %s %s\n",
	   bin,
	   arr[0],
	   arr[1],
	   arr[2],
	   arr[3] );

    /*    
    execv(bin, arr);
    */

    return 0;          
}
