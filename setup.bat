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


ECHO ** Java SE Development Kit 7
ECHO (about 5 minutes...)
:: The x86 version of JDK is choosed for compatibility.
:: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
:: Installing the JDK Silently
:: http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html#jdk-silent-installation

jdk\jdk-7u25-windows-i586.exe /s
CALL:check


ECHO ** Coding Frenzy
ECHO (about 1 minutes...)
:: It's downloaded at 2013-08-28 15:32 from:
:: http://coding-frenzy.arping.me/CodingFrenzy@CPExam.zip

SET CF_DIR=C:\CodingFrenzy^@CPExam
7za x cf\cf-cpe.zip -o%CF_DIR% -y > NUL
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

