@echo off

REM http://www.emacswiki.org/emacs/EmacsClient
REM
REM “%~dp0” returns the directory in which the batch file resides,
REM which is why it’s important to put it alongside “emacsclientw.exe”
REM and “runemacs.exe”

"%~dp0emacsclientw.exe" --no-wait --alternate-editor="%~dp0runemacs.exe" "%1"
