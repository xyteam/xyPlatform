echo "======================="
echo "= apt install jenkins ="
echo "======================="

export DEBIAN_FRONTEND=noninteractive
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt clean && sudo apt update -q
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" jenkins
