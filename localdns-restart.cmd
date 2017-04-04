@ECHO OFF
REM STOP DNSCrypt
REM taskkill /IM dnscrypt-proxy.exe /F

ipconfig /flushdns

REM START DNSCrypt
REM nircmd.exe exec2 hide "%~dp0\dnscrypt-proxy\" "%~dp0\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf

REM RESTART DNS
nircmd.exe exec2 hide "%~dp0/unbound" "%~dp0/unbound/unbound-control.exe" -c unbound.conf reload