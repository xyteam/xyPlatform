@ECHO OFF
cd %HOMEPATH%
start "selenium-standalone" /MIN node_modules\.bin\selenium-standalone start --config=selenium-standalone-config.js
EXIT /b 0
