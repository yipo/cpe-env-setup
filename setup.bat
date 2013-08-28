@ECHO OFF
CD /D %~dp0
PATH %PATH%;%CD%\tool


ECHO ** Visual C++ 2010 Express with .NET Framework 4
ECHO (about 30 minutes...)
:: http://www.microsoft.com/visualstudio/cht/downloads#d-cpp-2010-express
:: Run 'vc_web.exe /?' to show the command-line usage.

vc2010e\vc_web.exe /q /norestart
CALL:check


ECHO ** MinGW
ECHO (about 5 minutes...)
:: Follow the instructions below, we can install MinGW in command line.
:: http://www.mingw.org/wiki/Getting_Started#toc5
:: The CLI installer 'mingw-get' v0.5 (beta-20120426-1) can be downloaded at:
:: http://sourceforge.net/projects/mingw/files/Installer/mingw-get/

SET MINGW_DIR=C:\MinGW
7za x mingw\mingw-get.zip -o%MINGW_DIR% -y > NUL
%MINGW_DIR%\bin\mingw-get install gcc g++
CALL:check


:quit
PAUSE
EXIT


:check
IF ERRORLEVEL 1 (
	ECHO [FAIL] %ERRORLEVEL%
	GOTO quit
) ELSE (
	ECHO [OK] %TIME%
)
GOTO:EOF

