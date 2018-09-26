## xyPlatform: develop and test locally, deploy and run in the cloud

#### Disclaimer
* All operating systems (OS) and applications (App) mentioned in this project, their licenses belong to the original product providers respectively.
* The configuration files in project will trigger the downloads of certain OS (i.e., Ubuntu and Windows) and certain App (i.e., Java and Chrome) from Vagrant, Docker and OS/App providers.
* You need to agree to the original license agreements with the original product providers directly. This project does not assume any 3rd party licensing responsibility.

#### Project Summary
This project is licensed under the terms of the MIT license.

This project contains Vagrant and Docker configuration files for a few general purpose operating systems that can be deployed locally in desktop environment or in the cloud. In addition, this project contains automatic configuration scripts to install additional applications that are useful for development, experiement, automation testing and screen documentation.

Many useful features suppported on the Ubuntu OS are accounted for and can be used directly. Namely:
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
* Tensorflow board (port 6006)
* And many more...

###### The operating systems include:
* Ubuntu 16.04 LTS, vagrant and docker
* Ubuntu 18.04 LTS, vagrant and docker
* Windows 10, vagrant only
* Windows 7, vagrant only

The Ubuntu systems have corresponding Vagrant and Docker configuration files, and the docker image can be built locally, therefore one can develop in the local Ubuntu system, test with the local Docker container, and ship the package to any cloud Docker host and expect it to be functional with no or minimal additional configuration.

#### Benefits
1. The deployment process have been automated to remove the technical pains and nuances for end-users.
2. The configurations are captured in source code form for repeatability and future improvements.
3. It can be deployed anywhere that has git access to this git repo.
4. Easy repeatable deployment of multiple systems (i.e., deploy 32 windows systems and destroy them after use).
5. Develop and test with the local Docker configuration and deploy and run in any cloud service.
6. And many more...

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
