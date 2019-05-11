echo "=========================="
echo "=   build docker image   ="
echo "=========================="
UBUNTU_NUM=$(lsb_release -rs | tr --delete .)
cd /home/vagrant/Projects/xyPlatform/lubuntu;
docker build --build-arg USER_ID=${SUDO_UID} --build-arg GROUP_ID=${SUDO_GID} --tag xyplatform:lubuntu${UBUNTU_NUM} --file Dockerfile${UBUNTU_NUM} ${PWD}