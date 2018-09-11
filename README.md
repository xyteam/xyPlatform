# xyPlatform

## Disclaimer
* All operating systems (OS) and applications (App) mentioned in this project, their licenses belong to the original product providers respectively.
* The configuration files in project will trigger the downloads of certain OS (i.e., Ubuntu and Windows) and certain App (i.e., Java and Chrome) from Vagrant, Docker and OS/App providers.
* You need to agree to the original license agreements with the original product providers directly. This project does not assume any 3rd party licensing responsibility.

## Project Summary
This project is licensed under the terms of the MIT license.

This project contains Vagrant and Docker configuration files for a few general purpose operating systems that can be deployed locally in desktop environment or in the cloud. In addition, this project contains automatic configuration scripts to install additional applications that are useful for development, experiement, automation testing and screen documentation.

Many useful features provided by the Ubuntu OS are accounted for and can be used directly. Namely:
* Openssh/Openssl
* RDP (rdesktop)
* Screen capture (import)
* Video capture (ffmpeg)
* Concurrent user desktops (xvfb)
* Node.js (node 8.11.1)
* Google-chrome browser
* Docker
* Tensorflow board (port 6006)
* And many more...

### The operating systems include:
* Ubuntu 16.04 LTS, vagrant and docker
* Ubuntu 18.04 LTS, vagrant and docker
* Windows 10, vagrant only
* Windows 7, vagrant only

The Ubuntu systems have corresponding Vagrant and Docker configuration files, therefore one can develop and test at the local Ubuntu system and expect it to run at the cloud Docker container with no or minimal additional configuration.

## Benefits
1. The deployment process have been automated to remove the technical pains and nuances for end-users.
2. The configurations are captured in source code form for repeatability and future improvements.
3. It can be deployed anywhere that has git access to this git repo.
4. Easy repeatable deployment of multiple systems (i.e., deploy 32 windows systems and destroy them after use).
5. And many more...

## Prerequisites

### Local hosting system:
* Windows 10 or Mac OS with reasonable RAM (16G+) and HD space (500G+)
* Vagrant 2.1.1 and up
* Vagrant Plugins
    * vagrant-vbguest
    * vagrant-ca-certificates
    * vagrant-proxyconf
    * vagrant-timezone
    * vagrant-winrm
* VirtualBox 5.2.10 and up
* (Have not tested on Linux desktop host, feedbacks are welcome.)

### Cloud hosting system:
* Any Linux system that supports Docker

### Projects directory configuration:
The project path of $HOME/Projects and ~/Projects are used through out, and is shared into VMs via Vagrant and Docker configurations, therefore a main diretory called Projects should be created under the user's home directory, and this and other related projects should be checkout into the Projects directory. The main benefit of sharing the Projects directory with the VMs is easy exchange of code between the host and VMs.

## Deploy VMs

### Ubuntu 18.04 VM
#### bring up and shell login
```
CMD> cd ~/Projects/xyPlatform/lubuntu
CMD> vagrant up l1804Base
CMD> vagrant reload l1804Base (reload is only needed the first time)
CMD> vagrant ssh l1804Base
```
#### gui login
vagrant/vagrant

### Ubuntu 16.04 VM
Same as ubuntu 18.04 except change hostname with l1604Base

### Ubuntu 18.04 Docker
```
$ cd ~/Projects/xyPlatform/lubuntu
$ sudo docker build --tag xyplatform:lubuntu1804 --file Dockerfile1804 .
```

### Ubuntu 16.04 Docker
```
$ cd ~/Projects/xyPlatform/lubuntu
$ sudo docker build --tag xyplatform:lubuntu1604 --file Dockerfile1604 .
```

Reference to the comments in the Docker files for additional deployment and usage commands.

### Windows 10 and Windows 7
reference to the README files inside the windows10 and windows7 directories respectively.


