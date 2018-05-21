echo "installing apt packages"
export DEBIAN_FRONTEND=noninteractive
apt update -q && apt autoremove -y
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" lxde-core lubuntu-core ntpdate autofs tree xvfb xdotool python python-pip software-properties-common wmctrl xclip ffmpeg sshfs rdesktop imagemagick nodejs npm
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" build-essential g++ gyp git-crypt dkms tesseract-ocr linux-headers-$(uname -r) unixodbc unixodbc-dev tdsodbc sqlite3 freetds-bin libnss3 libnss3-tools
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" libssl-dev libreadline-dev libyaml-dev libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libxtst-dev libpng-dev libxtst-dev libpng++-dev libopencv-dev libtesseract-dev zlib1g-dev libgtk2-perl