@ECHO OFF
CD /D %~dp0
PATH %PATH%;%CD%\tool

TITLE CPE Environment Setup v0.3
:: Author: Yi-Pu Guo (YiPo)

ECHO [START] %TIME%


ECHO ** Coding Frenzy
ECHO (about 1 minutes...)
:: It's downloaded at 2013-08-28 15:32 from:
:: http://coding-frenzy.arping.me/CodingFrenzy@CPExam.zip

SET CF_DIR=C:\CodingFrenzy^@CPExam
7za x cf\cf-cpe.zip -o%CF_DIR% -y > NUL
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


ECHO ** Visual C++ 2010 Express with .NET Framework 4
ECHO (about 20 minutes...)
:: http://www.microsoft.com/visualstudio/cht/downloads#d-cpp-2010-express
:: Run 'vc_web.exe /?' to show the command-line usage.
:: So bad, '/passive' is almost the same as '/q'.

vc2010e\vc_web.exe /q /norestart
IF ERRORLEVEL 3020 CALL:check
IF ERRORLEVEL 3010 VERIFY > NUL && ECHO Error %ERRORLEVEL% ignored.
CALL:check
:: Ignore errors of 301x (about restarting after installation).
:: 'VERIFY > NUL' to reset ERRORLEVEL.


ECHO ** Java SE Development Kit 7
ECHO (about 5 minutes...)
:: The x86 version of JDK is choosed for compatibility.
:: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
:: Installing the JDK Silently
:: http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html#jdk-silent-installation
:: Instead of '/s', '/passive' is used for showing the process bar.
:: Run 'jdk-7u25-windows-i586.exe /?' to read the usage of parameters.

jdk\jdk-7u25-windows-i586.exe /passive
CALL:check


COLOR F2
ECHO Everything goes well! :)
ECHO [FINISH] %TIME%

explorer %CF_DIR%
:: Open the folder of Coding Frenzy for you.

:quit
PAUSE
EXIT


:check
IF ERRORLEVEL 1 (
	COLOR FC
	ECHO [FAIL] %ERRORLEVEL%
	GOTO quit
) ELSE (
	ECHO [OK] %TIME%
)
GOTO:EOF

