@ECHO OFF
CD /D %~dp0

:: Look for installed MinGW.

PATH %PATH%;^
C:\MinGW\bin;^
C:\"Program Files"\CodeBlocks\MinGW\bin;^
C:\"Program Files (x86)"\CodeBlocks\MinGW\bin

:: Make

mingw32-make %*
IF NOT ERRORLEVEL 1 ECHO [Done]
PAUSE
