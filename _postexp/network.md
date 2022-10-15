# Linux
## What does the targets network look like:
- `/sbin/ifconfig -a`
- `/sbin/ip addr`
- `cat /etc/network/interfaces`
- `cat /etc/sysconfig/network`
- `ip addr show`
## Network configuration Settings:
- `cat /etc/resolv.conf`
- `cat /etc/sysconfig/network`
- `cat /etc/networks`
- `iptables -L`
- `hostname`
- `dnsdomainname`
## List all current connections
- `lsof -i`
- `lsof -i :80`
- `grep 80 /etc/services`
- `netstat -antup`
- `netstat -antpx`
- `netstat -tulpn`
- `chkconfig --list`
- `chkconfig --list | grep 3:on`
## Check the routes:
- `arp -e`
- `route`
- `route -n`
- `/sbin/route -nee`
- `ip route list`

# Windows
## List all network interfaces, IP, and DNS.
- `ipconfig /all`
- `Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address`
- `Get-DnsClientServerAddress -AddressFamily IPv4 | ft`

## List all current connections
- `netstat -nao`

## List firewall state and current configuration
- `netsh advfirewall firewall dump`
- `netsh firewall show state`
- `netsh firewall show config`
## List firewall's blocked ports
- `f=New-object -comObject HNetCfg.FwPolicy2;f=New−object−comObjectHNetCfg.FwPolicy2;f.rules | where {$_.action -eq "0"} | select name,applicationname,localports`
## Disable firewall
- `netsh firewall set opmode disable (Older Versions of Windows)`
- `netsh advfirewall set allprofiles state off`
## List current routing table
- `route print`
- `Get-NetRoute -AddressFamily IPv4 | ft DestinationPrefix,NextHop,RouteMetric,ifIndex`
## List the ARP table
- `arp -A`
- `Get-NetNeighbor -AddressFamily IPv4 | ft ifIndex,IPAddress,LinkLayerAddress,State`
## List all network shares
- `net share`
## Wifi Passwords:
### Finding the SSID:
- `netsh wland show profile`
### Obtaining the cleartext password:
- `netsh wlan show profile key=clear`
- `cls & echo. & for /f "tokens=4 delims=: " %a in ('netsh wlan show profiles ^| find "Profile "') do @echo off > nul & (netsh wlan show profiles name=%a key=clear | findstr "SSID Cipher Content" | find /v "Number" & echo.) & @echo on`