# This is an optional step to reduce your vagrant box size before you package it.
# adjust as necessary to skip removing certain data.
echo "=========================================="
echo "=   Cleaning vagrant box for packaging   ="
echo "=========================================="

# remove APT cache & file
echo ' >> APT cache and file'
sudo apt-get clean -y
sudo apt-get autoclean -y
find /var/lib/apt -type f | xargs rm -f

# clean up logs
echo ' >> Clean up log files'
find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove jobs, synced Run, trash and downloads
echo ' >> Remove unnecessary project-run files and trash'
rm -rf ~/Downloads/*
rm -rf ~/jenkins-agent/workspace/*
rm -rf ~/.local/share/Trash/*
rm -rf ~/Run


# zero out free space
echo ' >> Zero out free space'
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -rf /EMPTY

echo ' >> Empty bash history and exit'
# remove bash history and exit
cat /dev/null > ~/.bash_history && history -c && exit

