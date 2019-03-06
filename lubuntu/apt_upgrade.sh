echo "==============================="
echo "= apt update and fill-upgrade ="
echo "==============================="

export DEBIAN_FRONTEND=noninteractive
apt clean && apt update -q && apt autoremove -y
apt full-upgrade --fix-missing -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
