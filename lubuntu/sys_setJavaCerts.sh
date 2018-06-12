echo "setting up java certs"
echo 'changeit' | keytool -keystore $(find $JAVA_HOME -name cacerts) -import -alias GeoTrustGlobalCA.crt -file /usr/share/ca-certificates/private/GeoTrustGlobalCA.crt -noprompt
