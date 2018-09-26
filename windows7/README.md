## Windows 7 Selenium boxes
This configuration steps will install and config the Windows 7 VM for Java, NodeJS, Chrome, SSH, RDP and Selenium-Standalone.
The Vagrant file is prepared for scaled deployment of this VM for scaled automation testing.
Read through below steps for more details.

#### Step 1: Download MS preparation files
Download below files from Microsoft and Unzip to this folder (xyPlatform/windows7):
  * [IE11.Win7.Vagrant.zip](https://az792536.vo.msecnd.net/vms/VMBuild_20150916/Vagrant/IE11/IE11.Win7.Vagrant.zip)
  * [Win7-KB3191566-x86.msu.zip](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
  * [Windows6.1-KB958830-x86-RefreshPkg.msu.zip](https://www.microsoft.com/en-us/download/details.aspx?id=7887)

#### Step 2: Building win7Base VM
```
cygwin$ communicator=ssh vagrant up win7Base --provision
```

#### Step 3: Manual installation of MS preparation files
Open win7Base VM GUI (virtualBox => win7Base => Show). The above downloaded files will be posted inside the VM in c:\varant
```
  Admin CMD> cd c:\vagrant
  Admin CMD> Win7-KB3191566-x86.msu
  GUI> Complete the installation questions
  Admin CMD> Windows6.1-KB958830-x86-RefreshPkg.msu
  GUI> Complete the installation questions
  GUI> Manually check for windows updates and install them
  GUI> Set network type from 'Public Network' to 'Work Network'
  GUI> Manually restart to complete the windows updates
```
#### Step 4: Manual configuration for the next step
Perform the following commands in the defined sequence (important).
```
  Admin CMD> c:\vagrant\setEnableWinRM.bat
  Admin CMD> c:\vagrant\setEnableRemotePowerShell.bat
  Admin CMD> c:\vagrant\installChoco.bat
```
#### Step 5: Complete auto configurations
```
cygwin$ vagrant reload win7Base --provision
cygwin$ vagrant reload win7Base
```
#### Step 6: (Optional) Building win7desktopxx VM
Optionally, when the configuraiton of this box is stable and is ready for scaled deployment, you can create a box out of win7Base VM and use that box for scaled deployment (win7desktop01 win7desktop02 win7desktop03 win7desktop04, etc, modify the Vagrant file to add more VMs as needed).
```
cygwin$ vagrant package --base win7Base --output win7Base.box
cygwin$ vagrant up win7desktop01 win7desktop02 win7desktop03 win7desktop04
or
cygwin$ VagrantAll.sh up All
```
#### win7Base and win7desktop## VM Access Note:
###### GUI Console:
The VM GUI console is disabled for all Windows 10 VM by default. You can enable indivual directly through VirtualBox application by "Show GUI" button. You can detach a GUI if you do not need the GUI console.
###### SSH:
SSH ports are pre-mapped inside the Vagrantfile for each VM.
From the host PC:
```
cygwin$ vagrant ssh win7desktop01
```
or
```
cygwin$ ssh -i ../global/platform_id_rsa IEUser@localhost -p 11022
```
From lubuntu1804 or lubuntu1604:
```
$ ssh -i .ssh/platform_id_rsa IEUser@10.0.2.2 -p 11022 -L10389:localhost:3389 -L11444:localhost:4444 -N &
```
The above ssh command from lubuntu1804 or lubuntu1604 will map the remote RDP and Selenium ports to the Linux system on port 11389 and port 11444 respectively.
RDP to win7desktop01 VM:
```
$ DISPLAY=:0 rdesktop -u IEUser -p Passw0rd! -g 1920x1080 -a 16 localhost:11389 &
```
Selenium access from lubuntu1804 or lubuntu1604 to win7desktop01 VM:
```
$ DISPLAY=:0 google-chrome http://localhost:11444
```
