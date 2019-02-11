echo "========================="
echo "= build docker image    ="
echo "========================="

cd ~/Projects/xyPlatform/lubuntu;
sudo docker build --tag xyplatform1:lubuntu1804 --file Dockerfile1804 .
