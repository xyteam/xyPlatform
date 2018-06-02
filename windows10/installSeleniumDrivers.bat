@ECHO OFF
cd %HOMEPATH%
./node_modules/.bin/selenium-standalone install --config=selenium-standalone-config.js --loglevel=error
EXIT /b 0
