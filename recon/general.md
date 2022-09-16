# Packet Captures
# "PCAP IT OR IT DIDNT HAPPEN...its up to you if you need to"

## tcpdump
- `tcpdump -i eth0`
- `tcpdump -c -i eth0`
- `tcpdump -A -i eth0`
- `tcpdump -w 0001.pcap -i eth0`
- `tcpdump -r 0001.pcap`
- `tcpdump -n -i eth0`
- `tcpdump -i eth0 port 22`
- `tcpdump -i eth0 -src 172.21.10.X`
- `tcpdump -i eth0 -dst 172.21.10.X`

Other tools:
- Tshark (Command Line Wireshark)
- Wireshark

# Network Scanning
## NetDiscover (ARP Scanning):
- `netdiscover -i eth0`
- `netdiscover -r 172.21.10.0/24`

## Nbtscan:
- `nbtscan -r 172.21.1.0/24`

## Linux Ping Sweep (Bash)
- `for i in {1..254} ;do (ping -c 1 10.11.1.i | grep "bytes from" &) ;done`

## Windows Ping Sweep (Run on Windows System)
- `for /L %i in (1,1,255) do @ping -n 1 -w 200 172.21.10.%i > nul && echo 172.21.1.%i is up.`

## Nmap Network Scanning:
- `nmap -sn 172.21.10.0/24`
- `nmap -sn 172.21.10.1-253`
- `nmap -sn 172.21.10.*`

### Neat Nmap trick for Speedily Scanning Ports
Scans to check for open port first, then follows up with more thorough scan:
- `tgtip="10.11.1.101";ports=$(sudo nmap -Pn -p- --min-rate=1000 -T4 $tgtip | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//) && echo $tgtip":ports\!:" $ports && sudo nmap -Pn -T4 -A -p$ports $tgtip -oA nmap_break_sp_full`


# Host Scanning
## Nmap:

- `nmap -sC -sV 172.21.0.0`
- `nmap -Pn -sC -sV -p- 172.21.0.0`
- `nmap -sV -Pn 172.21.0.0`
- `nmap -T4 -sC -sV 172.21.0.0`
- `nmap -A 172.21.0.0`
- `nmap -p- -A -nv -oA <filename> <IP>`

## Nmap Stealth:

- `nmap -sS -sC -sV 172.21.0.0`
- `nmap -sS -p- 172.21.0.0`

## UDP Scan:

- `nmap -sS -sU -Pn -sV 172.21.0.0`
- `nmap -sU -A --top-ports=20 --version-all`
- `nmap -sU -A -p 53,67,68,161,162 --version-all`
- `unicornscan -mU -p ,161,162,137,123,138,1434,445,135,67,68,53,139,500,637,162,69`
- OCSC - `nmap --top-ports 100 -sU -sV -sC -oA <filename> <IP>`

## Nmap Scripts:
- Location: `/usr/share/nmap/scripts/`
- Example: `nmap --scripts vuln,safe,discovery -oN results.txt target-ip`

## Scans through Socks proxy:
`nmap --proxies socks4://proxy-ip:8080 target-ip`

## Useful OSCP Service 
- Hosts w/ SMB: `namp -p 139,445 --open <IP range>`
- Hosts for SMB Vulns: `nmap -p 139,445 --script=smb-vuln* <IP(s)>`
- SMB Info Collection: `nmap -p 139,445 --script=smb-enum-domains.nse,smb-enum-groups.nse,smb-enum-processes.nse smb-enum-services.nse,smb-enum-sessions.nse,smb-enum-shares.nse,smb-enum-users.nse,smb-ls.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-print-text.nse,smb-protocols.nse,smb-psexec.nse,smb-security-mode.nse,smb-server-stats.nse,smb-system-info.nse,smb-vuln-conficker.nse,smb-vuln-cve2009-3103.nse,smb-vuln-cve-2017-7494.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse,smb-vuln-regsvc-dos.nse,smb-vuln-webexec.nse,smb-webexec-exploit.nse <IP>`
- SMB v2 Info Collection: `nmap -p 139,445 --script=smb2-capabilities.nse,smb2-security-mode.nse,smb2-time.nse,smb2-vuln-uptime.nse <IP>`
- Shellshock Check: `nmap -p 80 --script=http-shellshock --script-args uri=/cig-bin/admin.cgi <IP>`
- ColdFusion Vuln: `nmap -v -p 80 --script=http-vuln-cve2010-2861 <IP>`

# Service Specific Nmap Scanning
Scans to attempt to find systems that might not respond to DNS recon or full nmap scan.

## Windows
- Windows system: `nmap -p 135,139-139,445,339 -Pn <IP>`

## Linux
- Linux: `nmap -p 22,111 -Pn <IP>`

## Top Ports:
- Top 20: `nmap -p 80,23,443,21,22,25,3389,110,445,139,143,53,135,3306,8080,1723,111,995,993,5900 -Pn <IP>`
- Using Nmap's feature: `nmap -Pn --top-ports=20`

## Common Services
- MSSQL: `nmap -p 1433,1434 -Pn <IP>`
- Oracle: `nmap -p 1521,1630 -Pn <IP>`
- DB2: `nmap -p 50000,50001 -Pn <IP>`
- SAP: `nmap -p 3200,3300 -Pn <IP>`
- Postgres: `nmap -p 5432 -Pn <IP>`
- MariaDB/MySQL: `nmap -p 3306 -Pn <IP>`
- Informix: `nmap -p 9088,9089 -Pn <IP>`
- ICS Protocols `- Modbus, DNP3, Ethernet/IP: nmap -p 502,20000,48818 -Pn <IP>`

# DNSRecon:
- `dnsrecon -d www.example.com -a`
- `dnsrecon -d www.example.com -t axfr`
- `dnsrecon -d`
- `dnsrecon -d www.example.com -D -t brt`

# Dig:

- `dig www.example.com + short`
- `dig www.example.com MX`
- `dig www.example.com NS`
- `dig www.example.com> SOA`
- `dig www.example.com ANY +noall +answer`
- `dig -x www.example.com`
- `dig -4 www.example.com (For IPv4)`
- `dig -6 www.example.com (For IPv6)`
- `dig www.example.com mx +noall +answer example.com ns +noall +answer`
- `dig -t AXFR www.example.com`

# Sublis3r:

- `Sublist3r -d www.example.com`
- `Sublist3r -v -d www.example.com -p 80,443`

# OWASP AMASS:

- `amass enum -d www.example.com`
- `amass intel -whois -d www.example.com`
- `amass intel -active 172.21.0.0-64 -p 80,443,8080,8443`
- `amass intel -ipv4 -whois -d www.example.com`
- `amass intel -ipv6 -whois -d www.example.com`