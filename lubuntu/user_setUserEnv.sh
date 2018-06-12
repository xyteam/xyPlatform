vagrant_user=$1
echo "setting $vagrant_user user env"

# set .profile to source .userEnv
fgrep -v ".userEnv" ~/.profile > /tmp/temp_profile
echo ". ~/.userEnv" >> /tmp/temp_profile
mv /tmp/temp_profile ~/.profile

# set github preference
git config --global url."https://github.com/".insteadOf git://github.com/

# install node version
export NVM_DIR="$HOME/.nvm"
export NODE_VERSION=v8.11.1
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install $NODE_VERSION
mkdir -p ~/.npm && sudo cat /usr/share/ca-certificates/private/GeoTrustGlobalCA.crt > ~/.npm/cacerts

# create .userEnv for .profile to source
cat << END1 > ~/.userEnv
export TZ="PST8PDT"
# export DBUS_SESSION_BUS_ADDRESS="unix:path=/dev/null"
export _JAVA_OPTIONS="-Xms512m -Xmx512m -Dcom.sun.net.ssl.checkRevocation=false"

# set node to ignore certificate error
export NODE_TLS_REJECT_UNAUTHORIZED=0
# overcome chrome and chrome-driver compatibility issue
export LC_NUMERIC=en_US.UTF-8

# set NVM
export NODE_VERSION=$NODE_VERSION
if [ -d "\$HOME/.nvm" ] ; then
  export NVM_DIR="\$HOME/.nvm"
  [ -s "\$NVM_DIR/nvm.sh" ] && . "\$NVM_DIR/nvm.sh"  # This loads nvm
  PATH="\$HOME/.nvm/versions/node/\$NODE_VERSION/bin:\$PATH"
  nvm use --delete-prefix \$NODE_VERSION
fi
# set NPM path
if [ -d "\$HOME/node_modules/.bin" ] ; then
    PATH="\$HOME/node_modules/.bin:\$PATH"
fi

# set NPM
# npm config --global set proxy \$http_proxy
# npm config set proxy \$http_proxy
# npm config set https-proxy \$https_proxy
npm config set registry http://registry.npmjs.org
npm config set progress false
npm config set cafile \$HOME/.npm/cacerts
npm config set unsafe-perm true
npm config set user $vagrant_user
npm config set umask 0022

END1

# create .envrc
cat << END2 > ~/.npmrc
# bypass cacert issue
insecure=true
rejectUnauthorized=false
strict-ssl=false

END2
