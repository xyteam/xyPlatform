echo "upgrading apt packages"
export DEBIAN_FRONTEND=noninteractive
apt update -q && apt autoremove -y
apt upgrade -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
