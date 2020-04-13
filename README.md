<p align="left"><img src="logo/logo.png" alt="xyPlatform" height="120px"></p>

### xyPlatform: develop and test locally, deploy and run in the cloud

#### Disclaimer
* All operating systems (OS) and applications (App) mentioned in this project, their licenses belong to the original product providers respectively.
* The configuration files in project will trigger the downloads of certain OS (i.e., Ubuntu and Windows) and certain App (i.e., Java and Chrome) from Vagrant, Docker and OS/App providers.
* You need to agree to the original license agreements with the original product providers directly. This project does not assume any 3rd party licensing responsibility.

#### Project Summary
This project is licensed under the terms of the MIT license.

This project contains Vagrant and Docker configuration files for a few general purpose operating systems that can be deployed locally in desktop environment or in the cloud.

#### Main purpose
The main purpose of this project is to provide easy-to-use VMs for E2E QA Automation.

#### Current included systems:
* Ubuntu 18.04 LTS, vagrant and docker
* Windows 10, vagrant only
* Windows 7, vagrant only

We may add additional systems in the future as needed. Contributions are very welcomed.

#### Overall Prerequisites

##### Local hosting system:

* Windows 10, Mac OS 10 or Ubuntu 18.04 with reasonable RAM (16G+) and HD space (500G+)
* VirtualBox 6.0.0
* Vagrant 2.2.3
* Vagrant Plugins
    * vagrant-vbguest
    * vagrant-ca-certificates
    * vagrant-timezone
    * vagrant-proxyconf (optional)

##### Cloud hosting system:

* Any Cloud system that supports Linux Docker

##### Projects directory configuration:

The project path of $HOME/Projects and ~/Projects are used through out, and is shared into VMs via Vagrant and Docker configurations, therefore a main directory called Projects should be created under the user's home directory, and this and other related projects should be checkout into the Projects directory. The main benefit of sharing the Projects directory with the VMs is easy exchange of code between the host and VMs.

#### Step by Step configuration

##### Ubuntu 18.04 Host Setup
- Install VirtualBox
    - ```$ sudo sh -c 'echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list'```
    - ```$ wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -```
    - ```$ wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -```
    - ```$ sudo apt update && sudo apt-get install virtualbox-6.1```
- Install VirtualBox Extension Package
    - ```$ VirtualBoxVersion=$(virtualbox --help | head -1 | sed 's/.*v//')```
    - ```$ wget "https://download.virtualbox.org/virtualbox/${VirtualBoxVersion}/Oracle_VM_VirtualBox_Extension_Pack-${VirtualBoxVersion}.vbox-extpack"```
    - ```$ sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-${VirtualBoxVersion}.vbox-extpack```
- Install Vagrant
    - ```$ VagrantVersion=2.2.7```
    - ```$ wget https://releases.hashicorp.com/vagrant/2.2.7/vagrant_${VagrantVersion}_x86_64.deb && sudo apt install vagrant_${VagrantVersion}_x86_64.deb```
- Install Vagrant Plugins
    - ```$ sudo vagrant plugin install vagrant-vbguest```
    - ```$ sudo vagrant plugin install vagrant-ca-certificates```
    - ```$ sudo vagrant plugin install vagrant-timezone```

##### Host of other types
- Follow/Convert the general steps above in your own OS

##### Credentials and Directory setup
- Verify ssh-keygen command permission, execute following command:
    - ```$ ssh-keygen```
        - If ssh-keygen not found, please ensure openssh is properly installed when setting up cygwin
        - If permission denied error, please refer to [troubleshooting section](#troubleshooting-section) before proceed
- Create directory with name **Projects** under *C:/Users/your_username/*, and run following commands:
    - ```$ cd ~/Projects```
    - ```$ git clone https://github.com/xyteam/xyPlatform.git```
    - ```$ git clone https://github.com/xyteam/AutoBDD.git```
##### Create Guest Machine (Lubuntu 1804)
- If you want to build platform from scratch, refer to this [Build from scratch](#build-from-scratch) Guideline
- If you want to build platform from pre-built vagrant box, refer to this [Build from box](#build-from-vagrant-box) Guideline
##### Build from scratch #####
- To build the platform from scratch, run following commands:
    - ```$ cd ~/Projects/xyPlatform/lubuntu```
        - edit config.yaml for desired CPU/Memory and synced folder line format
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
- To build docker image, go to Lubuntu box (or ssh into it) and run following commands:
    - ```$ cd ~/Projects/xyPlatform/lubuntu```
    - ```$ sudo docker build --tag xyplatform:lubuntu1804 --file Dockerfile1804 .``` &rightarrow; to build docker image from specified dockerfile
    - ```$ sudo docker images``` &rightarrow; Verify if *xyplatform* and *ubuntu* docker image is created
- To setup Jenkins
	- Access Jenkins from host at http://localhost:2880 or from lubuntu Chrome browser at http://localhost:8080
    - Install all recommended plugins and setup jenkins credential with **xyAdmin** and **xyPassword**
- Once completed, go to [Setup Verification](#setup-verification) section
##### Build from Vagrant box #####
- (Optional) To build the platform from pre-built vagrant box

    After you have built the VM and configured it for your application, you can repackage the VM into a box and save it for future use.
    - ```$ vagrant package --base l1804Base --output l1804Desktop.box```
    - ```$ cd ~/Projects/xyPlatform/lubuntu```
        - Ensure your Vagrant-Box is located in this directory
        - Edit config.yaml for desired CPU/Memory and synced folder line format
        - Edit Vagrantfile to have following config under boxes = [...] section (assume your box-name is **l1804Desktop.box**)
            - ```{:name => "l1804Desktop", :box_name => 'l1804Desktop', :box_url => 'l1804Desktop.box', :ssh_host_port=>2022, :http80=>2080, :http8080=>2880, :http8082=>2882, :http3000=>2300, :http8000=>2800}```
    - ```$ VAGRANT_LOG=INFO vagrant up l1804Desktop 2>&1 | tee vagrant.log```
        - Vagrant up will take roughly 3-5 minutes
        - Please ensure your laptop does not go to sleep while running this command
        - Login with username **vagrant** and password **vagrant**
        - If you hit into any error, please refer to [troubleshooting section](#troubleshooting-section)
- Once completed, go to [Setup Verification](#setup-verification) section
##### Setup Verification
- In your Lubuntu box, verify following:
    - ```$ DISPLAY=:0 xdpyinfo | grep dimensions``` &rightarrow; should returns **1920x1200**
    - ```$ mvn -version``` &rightarrow; able to return maven version
    - ```$ sudo docker version``` &rightarrow; able to return docker version
    - ```$ cd ~/Projects/``` &rightarrow; this folder should in-sync with your windows host (**%userprofile%/Projects/**)
    - ```$ DISPLAY=:0 google-chrome``` &rightarrow; launch chrome browser
    - ```$ sudo docker images``` &rightarrow; should returns 2 entries with name **xyplatform** and **ubuntu**

##### Troubleshooting Section
| Error | Resolutions |
| ------ | ------ |
| configure_docker_proxy.rb:50:in write': No such file or directory @ rb_sysopen -/tmp/vagrant-proxyconf-docker-config.json (Errno::ENOENT) | Uninstall proxyconf plugin with `vagrant plugin uninstall vagrant-proxyconf`
| -bash: /usr/bin/ssh-keygen: Permission denied | *) Generate key using [PuTTYgen](https://www.putty.org/) with *key 4096* and *comment xyPlatform* <br> *) copy generated public key into file *~/Projects/xyPlatform/global/platform_id_rsa.pub* <br> *) Conversion &rightarrow; Export OpenSSH Key &rightarrow; *~/Projects/xyPlatform/global/platform_id_rsa* <br> *) Open Vagrantfile under ../xyPlatform/lubuntu/ and comment out lines `trigger.info = checking...` and `trigger.run = {path:...}`|
|Unable to sync between **%userprofile%/Projects/** *(windows)* with **~/Projects/** *(linux)* directory | *) Install [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) <br> *) run `vagrant plugin install vagrant-vbguest`|
| VBoxManage.exe: error: VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED) | *) Enable Virtualization Technology (VTx) and Virtualization Technology for Directed I/O (VTd) from your BIOS setting <br> *) open *Turn Windows features on or off* and disable **Hyper-V** features. &<br> *) run `systeminfo` to verify virtualization is enabled |
| UI not visible, Docker/maven/java/chrome/... not available | *) Ensure there is no network loss and laptop doesn't goes to sleep during `vagrant up` <br> *) run `vagrant reload` right after the `vagrant up` completed before doing other thing such as restart laptop etc.. |
| The version of powershell currently installed on this host is less than the required minimum version. | *) Download and install Windows6.1-KB2506143-x64.msu from [Here](https://www.microsoft.com/en-us/download/details.aspx?id=34595) <br> *) Open windows Powershell and run `$PSVersionTable.PSVersion` to verify the Major version is now >=3 |
| C:/HashiCorp/Vagrant/embedded/mingw64/lib/ruby/2.4.0/resolv.rb:784:in \`[]=': incompatible character encodings: UTF-8 and ASCII-8BIT (Encoding::CompatibilityError) | *) Open the resolv.rb file located at the mentioned location in the error <br> *) Edit line 784, replace `request[0,2] = [id].pack('n')` to `request[0,2] = [id].pack('U')` |
| Segmentation fault when running vagrant from cygwin | *) Uninstall vagrant and delete `.vagrant.d` directory <br> *) Delete all your cygwin directory <br> *) Reinstall cygwin and vagrant |


#### Additional README files
Additional information and steps are provided in individual README files.

#### Ubuntu VM and Docker information
Reference to the README files inside the lubuntu directory.

* [Ubuntu 18.04 Client README.md](./lubuntu/README.md)

#### Windows 10 and Windows 7
Reference to the README files inside the windows10 and windows7 directories respectively.

* [Windows 7 Client README.md](./windows7/README.md)

* [Windows 10 Client README.md](./windows10/README.md)
