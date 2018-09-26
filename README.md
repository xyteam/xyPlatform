## xyPlatform: develop and test locally, deploy and run in the cloud

#### Disclaimer
* All operating systems (OS) and applications (App) mentioned in this project, their licenses belong to the original product providers respectively.
* The configuration files in project will trigger the downloads of certain OS (i.e., Ubuntu and Windows) and certain App (i.e., Java and Chrome) from Vagrant, Docker and OS/App providers.
* You need to agree to the original license agreements with the original product providers directly. This project does not assume any 3rd party licensing responsibility.

#### Project Summary
This project is licensed under the terms of the MIT license.

This project contains Vagrant and Docker configuration files for a few general purpose operating systems that can be deployed locally in desktop environment or in the cloud. In addition, this project contains automatic configuration scripts to install additional applications that are useful for development, experiement, automation testing and screen documentation.

###### Some Obvious Benefits
1. The deployment process have been automated to remove the technical pains and nuances for end-users.
2. The configurations are captured in source code form for repeatability and future improvements.
3. It can be deployed anywhere that has git access to this git repo.
4. Easy repeatable deployment of multiple systems (i.e., deploy 32 windows VMs and destroy them after use).
5. Develop and test with the local Docker configuration and deploy and run in any cloud service.

###### Main purpose
The main purpose of this project is to create and configure a coherent E2E automation environment with the Ubuntu system being the main driver and windows 10 and windows 7 PCs being the clients. In this environemt the Ubuntu VM can sprawn many virtual X environments simulating human's eyes and hands, where each X environment can use RDP to access a windows client, simulating a computer in front of a human. To achieve this, Sikuli is used as the human eyes, where it can see the entire X screen, and RobotJS is used as the hands, where it can control the mouse and keyboards of the X envirnment.

In addition to the Sikuli and and RobotJS control, additional network tunnels can also be created to further control the remote VM's file system and browser through SSHFS and Selenium Webdriver.

As already pointed out, this Ubuntu system can simulate many human at the same time. Using this project we are able to achieve 2Core + 2G per X environment and the same per VM, meaning, an Amazon EC2 Linux system with 32 logical cores and 32G RAM can run 16x X environments inside Docker, and a physical PC with 4x8 cores and 32G RAM can run 16x windows VMs, and each Linux X environment remote controls a windows VM.

###### Other General Purpose
Besides an E2E automation environment, the VMs in this project can also be use for other general purposes. Many useful features suppported on the Ubuntu OS are accounted for and can be used directly. Namely:
* Java/JDK (oracle java v1.8.0)
* Node.js and NPM (node v8.11.1 LTS and npm 5.6.0)
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
    * vagrant-winrm
* VirtualBox 5.2.10 and up

###### Cloud hosting system:
* Any Linux system that supports Docker

###### Projects directory configuration:
The project path of $HOME/Projects and ~/Projects are used through out, and is shared into VMs via Vagrant and Docker configurations, therefore a main diretory called Projects should be created under the user's home directory, and this and other related projects should be checkout into the Projects directory. The main benefit of sharing the Projects directory with the VMs is easy exchange of code between the host and VMs.

#### Additional README files
Additional information and steps are provided in individual README files.

###### Ubuntu VM and Docker information
Reference to the README files inside the lubuntu directory.

* [Ubuntu 18.04/16.04 README.md](./lubuntu/README.md)

###### Windows 10 and Windows 7
Reference to the README files inside the windows10 and windows7 directories respectively.

* [Windows 7 README.md](./windows7/README.md)

* [Windows 10 README.md](./windows10/README.md)
