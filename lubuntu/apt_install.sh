echo "installing apt packages"
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
  lxde-core \
  maven \
  module-assistant \
  nodejs \
  ntpdate \
  python \
  python-pip \
  rdesktop \
  slick-greeter \
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
apt purge -q -y gnome-screensaver xscreensaver light-locker
apt autoremove -y
ln -sf /usr/lib/jni/libopencv_java*.so /usr/lib/libopencv_java.so
