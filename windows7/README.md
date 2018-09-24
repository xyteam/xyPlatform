##Windows 7 Selenium boxes
```
pre: download these files to this folder. This folder will be inside the guest vm as c:\vagrant
  Win7-KB3191566-x86.msu
  Windows6.1-KB958830-x86-RefreshPkg.msu
cygwin$ communicator=ssh vagrant up win7Base --provision
open GUI (virtualBox => win7Base => Show)
  GUI> install VirtualBox Guest Update
  Admin CMD> cd c:\vagrant
  Admin CMD> Win7-KB3191566-x86.msu
  Admin CMD> Windows6.1-KB958830-x86-RefreshPkg.msu
  GUI> complete the installation questions
  GUI> reboot to complete the update
  GUI> shutdown to complete addition update
cygwin$ communicator=ssh vagrant reload up win7Base
  Admin CMD> c:\vagrant\setEnableWinRM.bat
  Admin CMD> c:\vagrant\setEnableRemotePowerShell.bat
  Admin CMD> c:\vagrant\installChoco.bat
cygwin$ vagrant reload win7Base --provision
cygwin$ vagrant reload win7Base
```
