echo "setting up java certs"
echo 'changeit' | keytool -keystore $(find $JAVA_HOME -name cacerts) -import -alias CORPORATE_CACERT.crt -file /usr/share/ca-certificates/private/CORPORATE_CACERT.crt -noprompt
