echo "=========================="
echo "=   build docker image   ="
echo "=========================="
UBUNTU_NUM=$(lsb_release -rs | tr --delete .)
cd /home/vagrant/Projects/xyPlatform/lubuntu;
docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --tag xyplatform:lubuntu${UBUNTU_NUM} --file Dockerfile${UBUNTU_NUM} ${PWD}
