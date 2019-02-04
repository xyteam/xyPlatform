## xyPlatform: develop and test locally, deploy and run in the cloud

#### Disclaimer
* All operating systems (OS) and applications (App) mentioned in this project, their licenses belong to the original product providers respectively.
* The configuration files in project will trigger the downloads of certain OS (i.e., Ubuntu and Windows) and certain App (i.e., Java and Chrome) from Vagrant, Docker and OS/App providers.
* You need to agree to the original license agreements with the original product providers directly. This project does not assume any 3rd party licensing responsibility.

#### Project Summary
This project is licensed under the terms of the MIT license.

This project contains Vagrant and Docker configuration files for a few general purpose operating systems that can be deployed locally in desktop environment or in the cloud. In addition, this project contains automatic configuration scripts to install additional applications that are useful for development, experiement, automation testing and screen documentation.

###### Some Obvious Benefits
* *Automated Deployment Process* - The VM and Docker deployment process have been automated to remove the technical pains and nuances for end-users.
* *Source controlled configuration* - The configurations and automated scripts are captured in source code form for repeatability and future improvements.
* *Deploy anywhere* - It can be deployed anywhere that has git access to this git repo and internet access to OS and Application providers.
* *Scale deployable* - One can deploy 32 windows VMs and destroy them after use.
* *Local and Cloud coherency* - Develop and test with the local Docker configuration and deploy and run in any cloud service.

###### Main purpose
The main purpose of this project is to create an E2E automation environment. In this environment the Ubuntu system can act as the main driver, and the Windows VMs can act as the remote PC clients.

The idea behind this automation environment is, we can use Ubuntu X environments to simulate people, where each X environment simulates one person. Multiple X environment can be spawn by using virtual frame buffer (Xvfb). Inside each X environment Sikuli can be used to see the X screen, and RobotJS can be used to control the keyboard and mouse.

In addition to the Sikuli and and RobotJS control, other network tunnels can also be created to further control the remote PCs. For example, SSHFS can be used to access remote file systems, and Selenium Webdriver can be used to control remote PC browsers.

Using this project we are able to achieve 1 Core + 1G RAM per X environment and 2 Core + 1G RAM per Windows VM, meaning, an Amazon EC2 Linux host with 16 logical cores and 30G RAM (c4.4xlarge) can run 16x virtual X environments inside a Docker instance, and a physical PC with 4x8 cores and 32G RAM can run 16x Windows VMs.

###### Other General Purpose
Besides an E2E automation environment, the Ubuntu VMs in this project can also be use for other general purposes. Many useful features supported on the Ubuntu OS are accounted for and can be used directly. Namely:
* Java/JDK (oracle java v1.8.0)
* Node.js and NPM (node v8.15.0 LTS and npm 6.4.1)
* Python (v2.7 and v3.x)
* Linux build essential
* Google-chrome browser (latest)
* Docker (docker-ce)
* Openssh/Openssl
* RDP (rdesktop)
* Screen image capture (import)
* Video video capture (ffmpeg)
* Normal X desktop (lightdm)
* Virtual X desktops (Xvfb)

We have been using these VMs to run Machine Learning exercises and experiments. The built in docker environment allows easy deployment to the cloud.

###### Current included systems:
* Ubuntu 16.04 LTS, vagrant and docker
* Ubuntu 18.04 LTS, vagrant and docker
* Windows 10, vagrant only
* Windows 7, vagrant only

We may add additional systems in the future as needed. Contributions are very welcomed.

#### Overall Prerequisites

###### Local hosting system:
* Windows 10 or Mac OS with reasonable RAM (16G+) and HD space (500G+)
    - Have not tested on Linux desktop host, feedbacks are welcome
* Vagrant 2.1.1 and up
* Vagrant Plugins
    * vagrant-vbguest
    * vagrant-ca-certificates
    * vagrant-proxyconf
    * vagrant-timezone
    * vagrant-winrm [Do **Not** install this plugin for VirtualBox 6.0]
* VirtualBox 5.2.10 and up

###### Cloud hosting system:
* Any Linux system that supports Docker

###### Projects directory configuration:
The project path of $HOME/Projects and ~/Projects are used through out, and is shared into VMs via Vagrant and Docker configurations, therefore a main directory called Projects should be created under the user's home directory, and this and other related projects should be checkout into the Projects directory. The main benefit of sharing the Projects directory with the VMs is easy exchange of code between the host and VMs.

#### Step by Step configuration
##### Cygwin Setup (for Windows host)
- Install [Cygwin](https://www.cygwin.com/)
- On the cygwin setup window:
    - Change the view to **Category**
    - Ensure all the packages under **Base** category are selected
    - Search for **openssh** and select openssh package under **Net** Category
    - Next and Install
- In your *Cygwin terminal* 
    - ```$ cd ../..``` 
    - ```$ rm -rf ./home``` &rightarrow; to remove cygwin-generated home dir at */cygwin64/home/*
    - ```$ ln -s /cygdrive/c/Users/ /home``` &rightarrow; to create symbolic link to your home dir
##### VirtualBox Setup
- Install [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
- Launch Oracle VirtualBox &rightarrow; File &rightarrow; Preferences &rightarrow; Extensions
	- Verify that *Oracle VM VirtualBox Extension Pack* is listed
##### Vagrant Setup
- Install [Vagrant](https://www.vagrantup.com/)
- Install vagrant plugins with following commands:
    - ```$ vagrant plugin install vagrant-vbguest```
    - ```$ vagrant plugin install vagrant-ca-certificates```
    - ```$ vagrant plugin install vagrant-timezone```
    - ```$ vagrant plugin install vagrant-winrm``` (Only for VirtualBox **below** 6.0)
    - ```$ vagrant plugin list``` &rightarrow; To verify installed plugins
##### Create Guest Machine (Lubuntu 1804)
- Verify ssh-keygen command permission, execute following command:
    - ```$ ssh-keygen```
        - If ssh-keygen not found, please ensure openssh is properly installed when setting up cygwin
        - If permission denied error, please refer to [troubleshooting section](#troubleshooting-section) before proceed
- Create directory with name **Projects** under *C:/Users/your_username/*, and run following commands:
    - ```$ cd ~/Projects```
    - ```$ git clone https://github.com/xyteam/xyPlatform.git```
    - ```$ git clone https://github.com/xyteam/AutoBDD.git```
    - ```$ cd ~/Projects/xyPlatform/lubuntu```
    - ```edit config.yaml for desired CPU/Memory and synced folder lien format```
    - ```$ VAGRANT_LOG=INFO vagrant up l1804Base 2>&1 | tee vagrant.log```
        - Vagrant up will take roughly 20-40 minutes depending on your internet speed
        - Please ensure your laptop does not go to sleep or disconnected from network while running this command
        - If you hit into any error, please refer to [troubleshooting section](#troubleshooting-section)
    - ```$ vagrant reload l1804Base``` (Only required for initial setup)
        - You should be able to see UI screen with login prompt
        - Login with username **vagrant** and password **vagrant**
- Screen Resolution configuration
    - Maximize your linux box &rightarrow; View &rightarrow; Virtual Screen 1 &rightarrow; Resize to 1920x1200
    - View &rightarrow; Scaled Mode
##### Build docker image and Setup Jenkins
- To build docker image, go to Lubuntu box (or ssh into it) and run following commands:
    - ```$ cd ~/Projects/xyPlatform/lubuntu```
    - ```$ sudo docker build --tag xyplatform:lubuntu1804 --file Dockerfile1804 .``` &rightarrow; to build docker image from specified dockerfile
    - ```$ sudo docker images``` &rightarrow; Verify if *xyplatform* and *ubuntu* docker image is created
- To setup Jenkins
	- Access Jenkins from your lubuntu Chrome browser at http://localhost:8080
    - Install all recommended plugins and setup jenkins credential with **xyAdmin** and **xyPassword**
##### Setup Verification
- In your Lubuntu box, verify following:
    - ```$ xdpyinfo | grep dimensions``` &rightarrow; should returns **1920x1200**
    - ```$ mvn -version``` &rightarrow; able to return maven version
    - ```$ sudo docker version``` &rightarrow; able to return docker version
    - ```$ cd ~/Projects/``` &rightarrow; this folder should in-sync with your windows host (**%userprofile%/Projects/**)
    - ```$ google-chrome``` &rightarrow; launch chrome browser

##### Troubleshooting Section
| Error | Resolutions |
| ------ | ------ |
| configure_docker_proxy.rb:50:in write': No such file or directory @ rb_sysopen -/tmp/vagrant-proxyconf-docker-config.json (Errno::ENOENT) | Uninstall proxyconf plugin with `vagrant plugin uninstall vagrant-proxyconf`
| -bash: /usr/bin/ssh-keygen: Permission denied | *) Generate key using [PuTTYgen](https://www.putty.org/) with *key 4096* and *comment xyPlatform* <br> *) copy generated public key into file *~/Projects/xyPlatform/global/platform_id_rsa.pub* <br> *) Conversion &rightarrow; Export OpenSSH Key &rightarrow; *~/Projects/xyPlatform/global/platform_id_rsa* <br> *) Open Vagrantfile under ../xyPlatform/lubuntu/ and comment out lines `trigger.info = checking...` and `trigger.run = {path:...}`|
|Unable to sync between **%userprofile%/Projects/** *(windows)* with **~/Projects/** *(linux)* directory | *) Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) <br> *) run `vagrant plugin install vagrant-vbguest`|
| VBoxManage.exe: error: VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED) | *) Enable Virtualization Technology (VTx) and Virtualization Technology for Directed I/O (VTd) from your BIOS setting <br> *) open *Turn Windows features on or off* and disable **Hyper-V** features. &<br> *) run `systeminfo` to verify virtualization is enabled |
| UI not visible, Docker/maven/java/chrome/... not available | *) Ensure there is no network loss and laptop doesn't goes to sleep during `vagrant up` <br> *) run `vagrant reload` right after the `vagrant up` completed before doing other thing such as restart laptop etc..


#### Additional README files
Additional information and steps are provided in individual README files.

###### Ubuntu VM and Docker information
Reference to the README files inside the lubuntu directory.

* [Ubuntu 18.04/16.04 README.md](./lubuntu/README.md)

###### Windows 10 and Windows 7
Reference to the README files inside the windows10 and windows7 directories respectively.

* [Windows 7 README.md](./windows7/README.md)

* [Windows 10 README.md](./windows10/README.md)
