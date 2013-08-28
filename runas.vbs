' Run 'setup.bat' as Adminstrator.

' Shell.ShellExecute method
' http://msdn.microsoft.com/en-us/library/windows/desktop/gg537745

Set Shell = CreateObject("shell.application")
Shell.ShellExecute "setup.bat","","","runas",1

' Note that the current directory must be the same as where the 'setup.bat' is.
