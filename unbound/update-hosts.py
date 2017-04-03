import requests;
import os;
import re;
import sys;
# 判断是否是ipv6地址
def is_ipv6_addr(addr):
    ip6_regex = '^([\da-fA-F]{1,4}:){6}((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^::([\da-fA-F]{1,4}:){0,4}((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^([\da-fA-F]{1,4}:):([\da-fA-F]{1,4}:){0,3}((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^([\da-fA-F]{1,4}:){2}:([\da-fA-F]{1,4}:){0,2}((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^([\da-fA-F]{1,4}:){3}:([\da-fA-F]{1,4}:){0,1}((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^([\da-fA-F]{1,4}:){4}:((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$|^([\da-fA-F]{1,4}:){7}[\da-fA-F]{1,4}$|^:((:[\da-fA-F]{1,4}){1,6}|:)$|^[\da-fA-F]{1,4}:((:[\da-fA-F]{1,4}){1,5}|:)$|^([\da-fA-F]{1,4}:){2}((:[\da-fA-F]{1,4}){1,4}|:)$|^([\da-fA-F]{1,4}:){3}((:[\da-fA-F]{1,4}){1,3}|:)$|^([\da-fA-F]{1,4}:){4}((:[\da-fA-F]{1,4}){1,2}|:)$|^([\da-fA-F]{1,4}:){5}:([\da-fA-F]{1,4})?$|^([\da-fA-F]{1,4}:){6}:$'
    return bool(re.match(ip6_regex, addr))

# 系统路径
path = sys.path[0]

# host 文件列表，如果有相同的域名，选择后面出现的host的地址
confit_host_file = [
    'https://raw.githubusercontent.com/racaljk/hosts/master/hosts',
    'https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts'
    ]

# 逐个下载hosts，并保存
hosts = {}
for hostsUrl in confit_host_file:
    hostsText = requests.get(hostsUrl).text;
    hostText = re.split('\n|\r\n', hostsText)
    for ipvx_host in hostText:
        if ipvx_host != '' and ipvx_host[0] != '#':
            ip_domain = ipvx_host.split()
            if ip_domain[1] != 'localhost':
                hosts[ip_domain[1]] = ip_domain[0]

# 把hosts写入到配置文件中
fd = open(path + os.path.sep + "unbound.local-zone.hosts.conf",'w')
fd.write('# Converted from https://github.com/racaljk/hosts/blob/master/hosts\n')
fd.write('# https://github.com/racaljk/hosts\n')
fd.write('# Thanks to all contributors.\n\n')
fd.write('# Converted from https://github.com/lennylxx/ipv6-hosts/blob/master/hosts\n')
fd.write('# https://github.com/lennylxx/ipv6-hosts\n')
fd.write('# Thanks to all contributors.\n\n')

# for host in hosts.items():
#    fd.write('local-zone: "'+ host[0] +'" typetransparent\n')

for host in hosts.items():
    if is_ipv6_addr(host[1]):
        fd.write('local-data: "' + host[0] + ' AAAA ' + host[1] + '"\n')
    else:
        fd.write('local-data: "' + host[0] + ' A ' + host[1] + '"\n')

fd.close();