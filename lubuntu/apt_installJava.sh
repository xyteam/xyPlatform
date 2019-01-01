echo "==========================="
echo "= apt install oracle-java ="
echo "==========================="

export DEBIAN_FRONTEND=noninteractive
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --allow-unauthenticated oracle-java8-installer oracle-java8-set-default