@ECHO OFF

ECHO ** Visual C++ 2010 Express with .NET Framework 4
ECHO (about 30 minutes...)
:: http://www.microsoft.com/visualstudio/cht/downloads#d-cpp-2010-express
:: Run 'vc_web.exe /?' to show the command-line usage.

vc2010e\vc_web.exe /q /norestart
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

