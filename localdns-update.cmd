@ECHO OFF
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.conf --directory-prefix="C:\localdns\unbound"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.blacklist.ips.conf --directory-prefix="C:\localdns\unbound"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.local-zone.blacklist.domains.conf --directory-prefix="C:\localdns\unbound"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.local-zone.hosts.conf --directory-prefix="C:\localdns\unbound"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/unbound/unbound.forward-zone.China.conf --directory-prefix="C:\localdns\unbound"
C:\localdns\wget.exe -N --no-check-certificate https://www.internic.net/domain/named.cache --directory-prefix="C:\localdns\unbound"

C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-proxy-cisco.conf --directory-prefix="C:\localdns\dnscrypt-proxy"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-proxy-yandex.conf --directory-prefix="C:\localdns\dnscrypt-proxy"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-blacklist-domains.txt --directory-prefix="C:\localdns\dnscrypt-proxy"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/CNMan/unbound.conf/raw/master/dnscrypt-proxy/dnscrypt-blacklist-ips.txt --directory-prefix="C:\localdns\dnscrypt-proxy"
C:\localdns\wget.exe -N --no-check-certificate https://github.com/jedisct1/dnscrypt-proxy/raw/master/dnscrypt-resolvers.csv --directory-prefix="C:\localdns\dnscrypt-proxy"

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
