echo "updating apt repository"
export DEBIAN_FRONTEND=noninteractive
# chrome
cat << CHROME_END > /etc/apt/sources.list.d/google-chrome.list
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
CHROME_END
curl -sL "http://dl.google.com/linux/linux_signing_key.pub" | apt-key add

# docker
apt remove -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" docker docker-engine docker.io
curl -sL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -a | grep Codename | cut -d\: -f2 | xargs) stable"

# java
add-apt-repository ppa:webupd8team/java --yes --update

apt update -q
