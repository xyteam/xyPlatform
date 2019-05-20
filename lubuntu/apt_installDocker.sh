echo "========================="
echo "= apt install docker-ce ="
echo "========================="

export DEBIAN_FRONTEND=noninteractive
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" docker-ce
sudo gpasswd -a $USER docker
cat << END1 > /etc/docker/daemon.json
{
  "storage-driver":"aufs",
  "debug":true
}
END1

