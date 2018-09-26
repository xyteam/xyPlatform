## Windows 10 Selenium boxes
The Vagrant file in this folder will download Windows 10 from Vagrant repo. The configuration steps will install and config the Windows 10 VM for Java, NodeJS, Chrome, SSH, RDP and Selenium-Standalone.
The Vagrant file is prepared for scaled deployment of this VM for scaled automation testing.
Read through below steps for more details.

#### Step 1: Building win10Base VM
```
cygwin$ communicator=ssh vagrant up win10Base
```

#### Step 2: Manual configuration for the next step 
There is no automatic GUI to win1oBase VM. To gain GUI access start VirtualBox application, select the win10Base VM and click "Show GUI" option.
From the GUI console, start CMD in Administrator mode and perform the step 2 commands below manually.
```
  Admin CMD> c:\vagrant\setPrivateNetwork.bat
  Admin CMD> c:\vagrant\setEnableWinRM.bat
  Admin CMD> c:\vagrant\installChoco.bat
```

#### Step 3: Complete auto configurations
```
cygwin$ communicator=ssh vagrant halt win10Base
cygwin$ vagrant up win10Base --provision
cygwin$ vagrant reload win10Base
```
At this point win10Base VM is ready to be used.

#### Step 4: (Optional) Building win10desktopxx VM
Optionally, you can create a vagrant box out of win10Base and use this vagrant box for scaled deployment (win10desktop01 win10desktop02 win10desktop03 win10desktop04, etc, modify the Vagrant file to add more VMs as needed).
```
cygwin$ vagrant package --base win10Base --output win10Base.box
cygwin$ vagrant up win10desktop01 win10desktop02 win10desktop03 win10desktop04
or
cygwin$ VagrantAll.sh up All
```

#### win10Base and win10desktop## VM Access Note:
###### GUI Console:
The VM GUI console is disabled for all Windows 10 VM by default. You can enable indivual directly through VirtualBox application by "Show GUI" button. You can detach a GUI if you do not need the GUI console.
###### SSH:
SSH ports are pre-mapped inside the Vagrantfile for each VM.
From the host PC:
```
cygwin$ vagrant ssh win10desktop01
```
or
```
cygwin$ ssh -i ../global/platform_id_rsa IEUser@localhost -p 21022
```
From lubuntu1804 or lubuntu1604:
```
$ ssh -i .ssh/platform_id_rsa IEUser@10.0.2.2 -p 21022 -L20389:localhost:3389 -L21444:localhost:4444 -N &
```
The above ssh command from lubuntu1804 or lubuntu1604 will map the remote RDP and Selenium ports to the Linux system on port 21389 and port 21444 respectively.
RDP to win10desktop01 VM:
```
$ DISPLAY=:0 rdesktop -u IEUser -p Passw0rd! -g 1920x1080 -a 16 localhost:21389 &
```
Selenium access from lubuntu1804 or lubuntu1604 to win10desktop01 VM:
```
$ DISPLAY=:0 google-chrome http://localhost:21444
```
