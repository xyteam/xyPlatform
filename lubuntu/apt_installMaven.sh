echo "installing maven"
export DEBIAN_FRONTEND=noninteractive
apt update -q
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" maven
