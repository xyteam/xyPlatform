echo "========================"
echo "= user set .userEnv.sh ="
echo "========================"

vagrant_user=$1
echo "setting $vagrant_user user env"

# prepare for smbv2 file mounting
sudo adduser $vagrant_user vboxsf

# set .profile to source .userEnv
fgrep -v ".userEnv" ~/.profile > /tmp/temp_profile
echo ". ~/.userEnv" >> /tmp/temp_profile
mv /tmp/temp_profile ~/.profile

# set github preference
git config --global url."https://github.com/".insteadOf git://github.com/

# install node version
export NVM_DIR="$HOME/.nvm"
export NODE_VERSION=v8.15.0
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install $NODE_VERSION
mkdir -p ~/.npm && sudo cat /usr/share/ca-certificates/private/GeoTrustGlobalCA.crt > ~/.npm/cacerts

# create .userEnv for .profile to source
cat << END1 > ~/.userEnv
export TZ="America/Los_Angeles"
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
    PATH="\$PATH:./node_modules/.bin"

# set alias for rsync between Projects and Run
alias spr='rsync --human-readable --progress --update --archive --exclude .git/ --exclude node_modules/ --exclude xyPlatform/ $HOME/Projects/ $HOME/Run'
alias srp='rsync --human-readable --progress --update --archive --exclude node_modules/ --exclude target/ --exclude logs/ $HOME/Run/ $HOME/Projects'
alias xvfb-auto='xvfb-run --auto-servernum --server-args="-screen 0 1920x1200x16"'
END1

# create .envrc
cat << END2 > ~/.npmrc
# bypass cacert issue
insecure=true
rejectUnauthorized=false
strict-ssl=false

END2
