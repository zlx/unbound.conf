@ECHO OFF
REM START DNSCrypt
nircmd.exe exec2 hide "%~dp0\dnscrypt-proxy\" "%~dp0\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf
REM C:\localdns\nircmd.exe exec2 hide "C:\localdns\dnscrypt-proxy\" "C:\localdns\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-yandex.conf

REM START Unbound
nircmd.exe exec2 hide "%~dp0/unbound" "%~dp0/unbound/unbound-control.exe" -c unbound.conf start
