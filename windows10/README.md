##Windows 10 Selenium boxes
```
cygwin$ communicator=ssh vagrant up win10Base
  Admin CMD> c:\vagrant\setPrivateNetwork.bat
  Admin CMD> c:\vagrant\setEnableWinRM.bat
  Admin CMD> c:\vagrant\setEnableRemotePowerShell.bat
  Admin CMD> c:\vagrant\installChoco.bat
cygwin$ communicator=ssh vagrant halt win10Base
cygwin$ vagrant reload win10Base --provision
cygwin$ vagrant reload win10Base
```
