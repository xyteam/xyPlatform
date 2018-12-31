echo "===================================="
echo "= apt install google-chrome=stable ="
echo "===================================="

apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" google-chrome-stable
