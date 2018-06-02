@ECHO OFF
set http_proxy_host_port=%1
ECHO Configuring Proxy Settings! please wait...
certutil -addstore "Root" "C:\Users\IEUser\Projects\xyAutomatoin\global\corporate_cacerts\GeoTrustGlobalCA.crt"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE" /v iexplore.exe /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d http://%http_proxy_host_port% /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
EXIT
