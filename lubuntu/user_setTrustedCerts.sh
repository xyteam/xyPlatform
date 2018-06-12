# set trusted certs for ubuntu user
vagrant_user=$1
echo "Setting trusted certs for user $vagrant_user"
export user_home=/home/$vagrant_user
rm -rf $user_home/.pki/nssdb
mkdir -p $user_home/.pki/nssdb
certutil -N --empty-password -d sql:$user_home/.pki/nssdb
sudo certutil -d sql:$user_home/.pki/nssdb -A -t "CT,c,c" -n "CORPORATE_CACERT" -i /usr/share/ca-certificates/private/GeoTrustGlobalCA.crt
