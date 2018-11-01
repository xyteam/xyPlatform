@ECHO OFF
cd %HOMEPATH%
./node_modules/.bin/selenium-standalone install --config=./selenium-standalone_config.js --loglevel=error
EXIT /b 0