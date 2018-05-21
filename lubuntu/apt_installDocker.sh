echo "installing Docker"
export DEBIAN_FRONTEND=noninteractive
apt remove -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
apt update -q && apt autoremove -y
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" docker-ce

cat << END1 > /etc/docker/daemon.json
{
  "storage-driver":"aufs",
  "debug":true,
  "insecure-registries":["corporate.docker.repo:5000"]
}
END1

