echo "======================================"
echo "= system java import ca-certificates ="
echo "======================================"

echo 'changeit' | keytool -keystore $(find $JAVA_HOME -name cacerts) -import -alias GeoTrustGlobalCA.crt -file /usr/share/ca-certificates/private/GeoTrustGlobalCA.crt -noprompt
