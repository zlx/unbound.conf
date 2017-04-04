@ECHO OFF
REM STOP DNSCrypt
REM taskkill /IM dnscrypt-proxy.exe /F

REM STOP Unbound
nircmd.exe exec2 hide "%~dp0/unbound" "%~dp0/unbound/unbound-control.exe" -c unbound.conf stop

ipconfig /flushdns
