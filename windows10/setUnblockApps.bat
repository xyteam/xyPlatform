@ECHO OFF
netsh advfirewall firewall add rule name="Java(TM) Platform SE binary" dir=in action=allow
netsh advfirewall firewall add rule name="Command line server for the IE driver" dir=in action=allow
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
EXIT
