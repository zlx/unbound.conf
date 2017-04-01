@ECHO OFF
REM START DNSCrypt
C:\localdns\nircmd.exe exec2 hide "C:\localdns\dnscrypt-proxy\" "C:\localdns\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-cisco.conf
REM C:\localdns\nircmd.exe exec2 hide "C:\localdns\dnscrypt-proxy\" "C:\localdns\dnscrypt-proxy\dnscrypt-proxy.exe" dnscrypt-proxy-yandex.conf

REM START Unbound
C:\localdns\nircmd.exe exec2 hide "C:\localdns\unbound\" "C:\localdns\unbound\unbound.exe" -c unbound.conf
