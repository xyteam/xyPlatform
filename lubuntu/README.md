## Light-Weight Ubuntu Desktop Boxes
This folder contains configuration files for two versions of Linux light-weight ubuntu desktop boxes:
* 18.04 LTS
* 16.04 LTS 

These two boxes have almost mirrored configurations. Pick whichever one that is suitable for your project.

#### Feature Highlight
Here is a list of key features worth mentioning with detail explanations below the list:
* Light-Weight Linux
* Mirrored Docker configuration
* Single key for SSH tunneling

We have chosen a light-weight desktop environment for easy deployment and CPU power reservation. If you need richer UI feature you can install additional packages later.

We provided a mirrored Docker configuration file, and provided Docker command examples to show how to run commands outside and inside docker. You can build docker images locally, and test your application inside and outside of docker for direct comparison. This way you can deploy your application to the cloud later with higher confidence.

A dedicated private key is created in xyPlatform, and its public key is shared in all Linux and Windows boxes in this project. It is convenient to create SSH tunnels between xyPlatform systems, therefore it is easy to do many automation testing between them. Example on a few key tunnels such as SSHFS, RDP and Selenium Webdriver are provided.

#### Deploy VMs
Normally you would only need one of Ubuntu 18.04 or Ubuntu 16.04. In general Ubuntu 16.04 has more matured 3rd party support then Ubuntu 18.04, such as RobotJS, Sikuli and Selenium Webdriver. Ubuntu 18.04 support is getting matured therefore you might as well go ahead with it. We provide both versions in case there is a glitch need for the older.

###### Ubuntu 18.04 VM
bring up VM
```
CMD> cd ~/Projects/xyPlatform/lubuntu
CMD> VAGRANT_LOG=INFO vagrant up l1804Base 2>&1 | tee vagrant.log
CMD> vagrant reload l1804Base (reload is only needed the first time)
```
troubleshooting 
```
**PROBLEM:** unable to sync Projects directory between host and lubuntu box
**WORKAROUND:**
In Cygwin terminal
$ nano .bashrc (and enter below alias)
-> alias slr='rsync --archive -e "ssh -p 2022 -i ~\Projects\xyPlatform\global\platform_id_rsa" ~/Projects/ vagrant@localhost:~/Projects/'
-> save and exit the fiel
$ . .bashrc
$ slr (to perform one-time one-way sync from Host -> lubuntu)
```
shell login from host
```
CMD> vagrant ssh l1804Base
or
CMD> ssh -i ../global/platform_id_rsa vagrant@localhost -p 2022
```
gui login
```
vagrant/vagrant
```

###### Ubuntu 16.04 VM
Same as ubuntu 18.04 except change hostname with l1604Base and change ssh port 2022 to 1022.

#### Deploy Docker
We provided two Docker configuration files for our supported Ubuntu versions with mirrored configurations. For direct comparison purpose the Ubuntu version between the host and docker should be the same. For cross version checking purpose they can also be cross deployed.

###### Build Ubuntu 18.04 Docker
```
$ cd ~/Projects/xyPlatform/lubuntu
$ sudo docker build --tag xyplatform:lubuntu1804 --file Dockerfile1804 . # the '.' here means the current dir
```

###### Build Ubuntu 16.04 Docker
change to -file Dockerfile1604

#### Docker run examples
For now reference to the comments in the Docker files for additional deployment and usage commands. We will update/add examples to this README later.
