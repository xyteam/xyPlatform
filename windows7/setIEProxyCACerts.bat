@ECHO OFF
set http_proxy_host_port=%1
ECHO Configuring Proxy Settings! please wait...
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d http://%http_proxy_host_port% /f
certutil -addstore "Root" "C:\Users\IEUser\Projects\xyAutomatoin\global\corporate_cacerts\GeoTrustGlobalCA.crt"
EXIT