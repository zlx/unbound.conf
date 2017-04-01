@ECHO OFF
REM STOP DNSCrypt
taskkill /IM dnscrypt-proxy.exe /F

REM STOP Unbound
taskkill /IM unbound.exe /F

ipconfig /flushdns

REM START DNSCrypt
C:\localdns\nircmd.exe exec2 hide "C:\localdns\dnscrypt-proxy\" "C:\localdns\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf
REM C:\localdns\nircmd.exe exec2 hide "C:\localdns\dnscrypt-proxy\" "C:\localdns\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-yandex.conf

REM START Unbound
C:\localdns\nircmd.exe exec2 hide "C:\localdns\unbound\" "C:\localdns\unbound\unbound.exe" -c unbound.conf
