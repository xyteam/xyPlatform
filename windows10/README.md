##Windows 10 Selenium boxes
The Vagrant file in this folder will download Windows 10 from Vagrant repo. The configuration steps will install and config the Windows 10 VM for Java, NodeJS, Chrome, SSH, RDP and Selenium-Standalone.
The Vagrant file is prepared for scaled deployment of this VM for scaled automation testing.
Read through below steps for more details.

#### Step 1: Building win10Base VM
```
cygwin$ communicator=ssh vagrant up win10Base
```
There is no automatic GUI to win1oBase VM. To gain GUI access start VirtualBox application, select the win10Base VM and click "Show GUI" option.
From GUI console perform step 2 below.

#### Step 2: Manual configuration for step 3 
```
  Admin CMD> c:\vagrant\setPrivateNetwork.bat
  Admin CMD> c:\vagrant\setEnableWinRM.bat
  Admin CMD> c:\vagrant\setEnableRemotePowerShell.bat
  Admin CMD> c:\vagrant\installChoco.bat
```

#### Step 3: Complete auto configurations
```
cygwin$ communicator=ssh vagrant halt win10Base
cygwin$ vagrant reload win10Base --provision
cygwin$ vagrant reload win10Base
```
At this point win10Base VM is ready to be used.

#### Step 4: (Optional) Building win10desktopxx VM
Optionally, when the configuraiton of this box is stable and is ready for scaled deployment, you can create a box out of it and use that box for scaled deployment.
###### Caution: win10desktop01 and win10Base share the same ports and cannot be run at the same time.
```
cygwin$ vagrant package --base win10Base --output win10Base.box
cygwin$ vagrant up win10desktop01 win10desktop02 win10desktop03 win10desktop04
or
cygwin$ VagrantAll.sh up All
```

#### VM Access Note:
###### GUI Console:
Preparing for scaled deployment, the VM GUI console is disabled by default. You can enable indivual directly through VirtualBox application.
###### SSH:
SSH ports are pre-mapped inside the Vagrantfile for each VM.
From the host PC:
```
cygwin$ vagrant ssh win10desktop01
```
or
```
cygwin$ ssh -i ../global/platform_id_rsa IEUser@localhost -p 20022
```
From lubuntu1804 or lubuntu1604:
```
$ ssh -i .ssh/platform_id_rsa IEUser@10.0.2.2 -p 20022 -L20389:localhost:3389 -L20444:localhost:4444 -N &
```
The above ssh command from lubuntu1804 or lubuntu1604 will map the remote RDP and Selenium ports to the Linux system on port 20389 and port 20444 respectively.
RDP from lubuntu1804 or lubuntu1604 to win10desktop01 VM:
```
$ DISPLAY=:0 rdesktop -u IEUser -p Passw0rd! -g 1920x1080 -a 16 localhost:20389 &
```
Selenium access from lubuntu1804 or lubuntu1604 to win10desktop01 VM:
```
$ DISPLAY=:0 google-chrome http://localhost:20444
```