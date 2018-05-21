echo "Installing chrome"
cat << END > /etc/apt/sources.list.d/google-chrome.list
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
END

export DEBIAN_FRONTEND=noninteractive
cd /tmp
wget --no-check-certificate https://dl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub
cd -
apt update -q && apt autoremove -y
apt install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" google-chrome-stable
