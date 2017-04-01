@ECHO OFF
REM STOP DNSCrypt
taskkill /IM dnscrypt-proxy.exe /F

REM STOP Unbound
taskkill /IM unbound.exe /F

ipconfig /flushdns
