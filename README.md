# README.md
Tool to act as a repository for all of my shortcuts and notes.  This project is in its infancy, but for now the idea is to migrate the data I have in Joplin (shoutout to @tjnull for https://github.com/tjnull/TJ-JPT), but have tailored based on developing my methodologies over time.  This tool might not be for you right out of the box, but hopefully will give you a framework in which you can make it your own by forking and copypasta-ing your own commands you use most. For an already finished solution, check out @mike-hacks' tool [mxhelp](https://github.com/mikes-hacks/mxhelp), which was my inspiration for starting this project.

# Enhancements
- Have a command to run which will print out shortcuts for various stages of network pentest
- Have output print out in markdown format (i.e. glow , batcat)

# Syntax
`netexp [step] [sub-step]`

## Steps/Sub-step
As of now, this list is from TJ Null's TJ-JPT file. The plan is to layout the information as displayed in the JPT file, make sure my tweaks of the file are logical
1. Recon
- General Checklist
	- tcpdump
	- network scanning
	- nmap
		- Speedy Nmap Scan
		- Nmap Scans
		- Specific Service Nmap
	- DNS Recon
	- Dig
	- Sublist3r (subdomain enum)
	- OWASP amass
2. Enumeration
	- General Notes (Need to get from https://web.archive.org/web/20201122081447/http://www.0daysecurity.com/penetration-testing/enumeration.html)
	- Responder
	- Impacket (for Kerberoasting)
	- Services
		- Web - Organize Joplin Note (both General Note and SQL Injection)
		- SMB - Organize Joplin Note (compare with enum_smb) and remove redundancies
		- Active Directory (AD) - Organize Joplin Note
		- SNMP - `snmpwalk`, `nmap` NSEs, Metasploit Aux Modules, `onesixtyone`, `snmpcheck`, Impacket (samdump.py)
		- FTP - `nmap` NSEs, manual connection
3. Explotation
	- General Notes: Default Creds, Reverse shells (sources/links), reverse shell code
	- AV Bypass
	- Searchsploit
	- msfvenom
	- Windows AMSI Bypass
	- Netcat
4. Post Exploitation
	- Port Redirection: my notes on RINETD and Chisel
	- PRiv Esc: Linux, Windows, PTH, Stored Creds
	- General Notes: Spawn TTY, `PowerSharpPack`, Priv Esc Scripts, Location for Scripts, Intersting Files (cronjob)
	- Compiling Exploits
	- Transferring Files: ftp, web, powercat, scp, windows SMB share (rdesktop, impacket), Impacket SMB Serving, windows binaries, certutil.exe, bitsadmin, wget, powershell, cscript.exe
	- C2Frameworks: Empire C2, Covenant
	- Bloodhound
	- Impacket: Silver Ticket, Golden Ticket, Secrestdump
	- Rubeus
	- Mimikatz
	- Interesting Files: Windows, Linux
	- Installed Applications: Windows, Linux
	- Network Info: Windows, Linux
	- Running Processes: Windows, Linux
	- Scheduled Jobs/Tasks: Windows, Linux
	- System Info: Windows, Linux
	- Users & Groups: Windows, Linux
5. High Value Information
- Hashes
	- Dumping Hashes
	- Identifying Hash Types
	- Cracking Hashes Online - medusa, hydra
	- Cracking HAshes Offline- Wordlists, Hashcat, JTR, Wifi
