echo "================================"
echo "= apt install lubuntu packages ="
echo "================================"

export DEBIAN_FRONTEND=noninteractive
apt install --fix-missing -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
  autofs \
  build-essential \
  dkms \
  ffmpeg \
  freetds-bin \
  g++ \
  git-crypt \
  gyp \
  imagemagick \
  libcurl4-openssl-dev \
  libffi-dev \
  libgtk2-perl \
  libnss3 \
  libnss3-tools \
  libopencv-dev \
  libpng++-dev \
  libpng-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtesseract-dev \
  libxml2-dev \
  libxslt1-dev \
  libxtst-dev \
  libxtst-dev \
  libyaml-dev \
  lightdm \
  linux-headers-$(uname -r) \
  lubuntu-core \
  maven \
  module-assistant \
  nodejs \
  ntpdate \
  openjdk-8-jdk \
  openjdk-8-jre \
  python \
  python-pip \
  rdesktop \
  software-properties-common \
  sqlite3 \
  sshfs \
  tdsodbc \
  tesseract-ocr \
  tree \
  unixodbc \
  unixodbc-dev \
  virtualbox-guest-dkms \
  wmctrl \
  xclip \
  xdotool \
  xinit \
  xvfb \
  zlib1g-dev

# clean up un-needed screensavers
apt purge -q -y gnome-screensaver xscreensaver light-locker
# clean up un-needed packages
apt --purge autoremove -y
# set libopencv_java path
ln -sf /usr/lib/jni/libopencv_java*.so /usr/lib/libopencv_java.so
# set default java version to java 8 (needed by Jenkins)
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

#install tinydb to use autorunner framework
pip install tinydb