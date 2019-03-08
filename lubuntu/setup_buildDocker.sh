echo "=========================="
echo "=   build docker image   ="
echo "=========================="
UBUNTU_NUM=$(lsb_release -rs | tr --delete .)
cd /home/vagrant/Projects/xyPlatform/lubuntu;
docker build --tag xyplatform:lubuntu${UBUNTU_NUM} --file Dockerfile${UBUNTU_NUM} .
