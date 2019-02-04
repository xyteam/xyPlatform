## Light-Weight Ubuntu Desktop Boxes
This folder contains configuration files for two versions of Linux light-weight ubuntu desktop boxes:
* Ubuntu 18.04 LTS
* Ubuntu 16.04 LTS 

Normally you would only need one of Ubuntu 18.04 or Ubuntu 16.04. These two boxes have almost mirrored configurations. Pick whichever one that is suitable for your project.

#### Deploy Ubuntu 18.04 VM
Legend:
* CMD> indicates the PC host cmd prompt in the xyPlatform/lubuntu folder
* $ indicates the VM's bash shell
Prepare:
* Edit config.yaml
    * select the desire CPU/Memory for the VM
    * select/comment the synced folder line according to your host OS (Windows vs. Mac/Linux)

###### Bring up Base VM and check $HOME/Projects folder
Here we want to bring up the base VM and check the shared folder structure. Becasue we shared the %HOME%/Projects from the host PC to the VM, you should see the same folder structure inside and outside. If you can see the shared folder, it is the indication that your VirtualBox, Vagrant and Vagrant Plugins are working perfectly. You can continue on the provision steps.
```
CMD> cd ~/Projects/xyPlatform/lubuntu
CMD> VAGRANT_LOG=INFO vagrant up l1804Base --no-provision 2>&1 | tee vagrant.log
CMD> vagrant ssh l1804Base
$ ls -al ~/Projects
```

###### Complete the VM provisioning and reboot the VM
Here we provision the VM with necessary packages and configurations. This step will take about 20~40 minutes depending on the power of your host system and the network. There maybe some error messages which in general you can ignore.
You need to reboot the VM at least once after the provisioning. Afterward in you can keep the VM running all the time, and only reboot when the VM is hung.
```
$ exit
CMD> VAGRANT_LOG=INFO vagrant up l1804Base --provision 2>&1 | tee -a vagrant.log
CMD> vagrant reload l1804Base (reload is only needed the first time)
```

###### To use the VM
Login GUI:
* login as vagrant/vagrant
* Set VM resolution to 1920x1200, Scaled Mode.

Login Bash:
* CMD> vagrant ssh l1804Base

Reboot VM:
* CMD> vagrant reload l1804Base

Stop VM:
* CMD> vagrant halt l1804Base
* or close the VM window and select "Power-Off", there is no need to save the VM state

troubleshooting 
```
**PROBLEM:** unable to sync Projects directory between host and lubuntu box
Normally this is due to VirtualBox Guest Addition and Extension Pack are not installed. Installing them should solve the problem.
In a rare case that you can not resolve this problem, here is a workaround. 
**WORKAROUND:**
In Cygwin terminal
$ nano .bashrc (and enter below alias)
-> alias shv='rsync --archive -e "ssh -p 2022 -i ~\Projects\xyPlatform\global\platform_id_rsa" ~/Projects/ vagrant@localhost:~/Projects/'
-> alias svh='rsync --archive -e "ssh -p 2022 -i ~\Projects\xyPlatform\global\platform_id_rsa"  vagrant@localhost:~/Projects/ ~/Projects/'

-> save and exit the file
$ . .bashrc
$ shv (to perform one-time one-way sync from Host -> VM)
$ svh (vise versa)
```

#### Deploy Ubuntu 16.04 VM
Same process as Ubuntu 18.04.

#### Deploy Docker
We provided two Docker configuration files for our supported Ubuntu versions with mirrored configurations. For direct comparison purpose the Ubuntu version between the host and docker should be the same. For cross version checking purpose they can also be cross deployed.

###### Build Ubuntu 18.04 Docker
```
$ cd ~/Projects/xyPlatform/lubuntu
$ sudo docker build --tag xyplatform:lubuntu1804 --file Dockerfile1804 . # the '.' here means the current dir
```

###### Build Ubuntu 16.04 Docker
Same process as 18.04 Docker excapt change to -file Dockerfile1604

#### Docker run examples
For now reference to the comments in the Docker files for additional deployment and usage commands. We will update/add examples to this README later.
