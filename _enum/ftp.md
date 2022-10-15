# Nmap Enumeration
- `$ ls -lh /usr/share/nmap/scripts/ | grep ftp`
    - `ftp-anon.nse`
    - `ftp-bounce.nse`
    - `ftp-brute.nse`
    - `ftp-libopie.nse`
    - `ftp-proftpd-backdoor.nse`
    - `ftp-syst.nse`
    - `ftp-vsftpd-backdoor.nse`
    - `ftp-vuln-cve2010-4221.nse`
    - `tftp-enum.nse`
- `$ nmap x.x.x.x -p 21 -sV --script=exampleScript1.nse,exampleScript2.nse`
- `nmap --script ftp-* -p 21 <IP>`
- ` nmap -Pn -T4 -p 21 -n --script=ftp-syst,ftp-anon,ftp-vsftpd-backdoor,ftp-libopie,ftp-proftpd-backdoor,ftp-vuln-cve2010-4221 10.1.1.25 -oA fw_it_nse_ftp`

# Manual Connection
- `ftp x.x.x.x`
- `nc x.x.x. 21`

# Connect via Browser
- `ftp://x.x.x.x`

# Enumeration
- Server Version Vulnerable?
- Anonymous FTP
- Read/Write Access?
- Hidden Files?
- Filezilla (GUI Based traversing/trasnfer)
- UPloading REverse Shells (ASPX) if you can access via HTTP
- Misconfigurations - i.e. directory traversal