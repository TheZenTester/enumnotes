#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "A reference guide for all the awesome pentesting notes."
   echo "Notes sourced from TJNull's awesome JPT File, and personalized over my pentesting journey"
   echo
   echo "Syntax: enumnotes.sh category sub-category [glow-flags]"
   echo
   echo "Categories:"
   echo "   recon       1) Reconnainssance - tcpdump, network scanning, nmap, DNS recon, dig, sublist3r, amass ,etc."
   echo "   enum        2) Enumeration - searches for common network services (Web, SMB, AD, SNMP, FTP, TCP, UDP, Other),"
   echo "                  and old notes from 0daysecurity, all possible techniques to try based on the open port."
   echo "   exp         3) Exploitation - default credentials, reverse shells, AV bypass, searchsploit, msfvenom, "
   echo "                  Windows AMSI bypass, netcat"
   echo "   postexp     4) Post-Exploitation - port redirection, priv esc, interestin files, compiling exploits, "
   echo "                  transferring files, C2 frameworks, bloodhound, impacket"
   echo "   hvi         5) High-Value Information - hashes, dumping hashes, identifying hash types, "
   echo "                  online/offline hash cracking, hash cracking wordlists"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

## Error Handling for incorrect categories
if [[ ! $1 =~ ^(recon|enum|exp|postexp|hvi)$ ]]; then
  echo "Invalid category entered: $1"
  echo "Valid Categories: recon, enum, exp, postexp, hvi"
  echo "Correct Syntax: enumnotes.sh category subcategory [glow flags]"
  echo
  Help
  exit
fi

# Error Handling for incorrect subcategories
if [ $1 = "recon" ] && [[ ! $2 =~ ^(general)$ ]]; then
   echo "Invalid Subcategory for recon: $2"
   echo "Valid Subcategories: general"
   echo
   echo "Subcategory Description:"
   echo "general     Output all commands: tcpdump, nmap, network/host scanning, dnsrecon, dig, sublist3r, amass"
   echo
   exit
elif [ $1 = "enum" ] && [[ ! $2 =~ ^(web|sqli|php|smb|ad|snmp|ftp|responder|impacket|general)$ ]]; then
   echo "Invalid Subcategory for enum: $2"
   echo "Valid Subcategories: web, smb, ad, snmp, ftp, general"
   echo
   echo "Subcategory Description:"
   echo "web         enumeration tactics for web services. Includes: enumeration overview, directory scanning,"
   echo "            web app/directory scanning wordlists, web app scanners, local file inclusion (LFI) testing,"
   echo "            remote file inclusion (RFI), reverse shell, password guessing (hydra/wfuzz)"
   echo "sqli        Enumeration for SQL Injection, including: common bypass tests, sqlmap."
   echo "php         Enumeration for PHP Code Analysis, including: global variables, dangerous functions" 
   echo "smb         enumeration of SMB including: rpcclient, smbclient, crackmapexec, enum4linux/enum4linux-ng,"
   echo "            impacket, smbmap, SMB-specific nmap scans"
   echo "ad          Active Directory Enumeration: initial foothold enumeration, listing SMB shares, username mutation"
   echo "            username/SID enumeration, etc. Tools included: impacket, ldapsearch, getadusers, lookupsid,"
   echo "            rpcclient, secretsdump, psexec, wmiexec. Reference sheets: payloadallthethings, Attacking AD"
   echo "snmp        SNMP enumeration: snmpwalk, SNMP-specific nmap scripts, metasploit modules, "
   echo "            onesixtyone, snmp-check, impacket samdump"
   echo "ftp         FTP enumeration: manual/browser connection, nmap scripts, enumeration steps/ideas"
   echo "responder   Enumeration notes on using Responder. Cannot be used for OSCP for Poisoning/Spoofing"
   echo "impacket    Enumeration notes for Impacket, including kerberoasting commands"
   echo "general     WARNING: LARGE OUTPUT! - outputs the 0daysecurity list of possible enumeration steps"
   echo "            for commonly known ports (25-9100)."
   echo
   exit
elif [ $1 = "exp" ] && [[ ! $2 =~ ^(general|avbypass|ss|msfvenom|amsi|nc|bufoflow)$ ]]; then
   echo "Invalid Subcategory for enum: $2"
   echo "Valid Subcategories: general, avbypass, ss, msfvenom, amsi, nc, bufoflow"
   echo
   echo "Subcategory Description:"
   echo "general     prereqs for running exploits, default credentials links, reverse shell lists/examples "
   echo "            (netcat, bash, perl, python, IPv6, ruby, php, PowerShell, golang, awk)"
   echo "avbypass    resources to use for AV bypass: Veil framework, shellter, sharpshooter, donut, vulcan,"
   echo "            scarecrow"
   echo "ss          searchsploit syntax reference guide - install searchsploit/binsploits, basic searching,"
   echo "            search result exclusion, view exploits, copy exploit, website access, nmap scan analysis"
   echo "msfvenom    msfvenom syntax for creating payloads: windows, linux, web (PHP, ASP, JSP, WAR),"
   echo "            scripting (python, bash perl), encoding, templates"
   echo "amsi        Bypassing Windows AMSI resources: testing, PowerShell bypass & other resources"
   echo "nc          netcat tips"
   echo "bufoflow    references to learn buffer overflows"
   echo
   exit
elif [ $1 = "postexp" ] && [[ ! $2 =~ ^(files|apps|network|processes|jobs|sysinfo|users)$ ]]; then
   echo "Invalid Subcategory for postexp: $2"
   echo "Valid Subcategories:  files, apps, network, processes, jobs, sysinfo, users"
   echo
   echo "Subcategory Description:"
   echo "scripts     "
   echo "files       Enumerate files on the system. Commands to execute searches, common files, file permissions"
   echo "apps        List installed applications: Linux (Debian, RedHat, BSD, Gentoo, Arch Linux), "
   echo "            Windows (PowerShell, remote application enumeration, WMI, WMIC, File permissions)"
   echo "network     Enumerate what the target network topology, interfaces, DNS, configuration settings, "
   echo "            current connections, firewall state/disable, ARP table, network shares, wifi passwords"
   echo "processes   Enumerate processes running on the system: listing/terminating processes, Linux/Windows specific"
   echo "jobs        Enumerate scheduled jobs and tasks. Linux/Windows specific"
   echo "sysinfo     Enumerate system information. Linux (PowerShell, arch specific); Windows (cmd, PowerShell)"
   echo "users       Enumerate users & groups - including: users, user permissions, groups, local/domain membership"
   echo
   exit
elif [ $1 = "hvi" ] && [[ ! $2 =~ ^(hashes|crackoff|pwguess|wifi)$ ]]; then
   echo "Invalid Subcategory for hvi: $2"
   echo "Valid Subcategories: general"
   echo
   echo "Subcategory Description:"
   echo "hashes      Identifying, collecting, and dumping hashes. Includes: metasploit, impacket, samdump, unshadow"
   echo "            MacOSX, lsassy"
   echo "crackoff    Cracking hashes offline using hashcat/john."
   echo "pwguess     Guessing passwords over the network using medusa/hydra"
   echo "wifi        Using airmon-ng, airodump-ng, aireplay-ng, aircrack-ng, hashcat and john to crack"
   echo "            WEBP/WPA/WPA2 PSK Authentication"
   exit
fi

# Logic handling to launch notes
if [ $1 = "recon" ]; then
   if [[ $2 =~ ^general$ ]]; then
      # pass to glow, allow for glow flags to be passed from enumnotes line.
      glow /usr/local/bin/enumnotes/_recon/general.md ${@:3}
   fi
elif [ $1 = "enum" ]; then
   if [[ $2 =~ ^web$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/web.md ${@:3}
   elif [[ $2 =~ ^sqli$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/sqli.md ${@:3}
   elif [[ $2 =~ ^php$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/php.md ${@:3}
   elif [[ $2 =~ ^smb$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/smb.md ${@:3}
   elif [[ $2 =~ ^ad$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/ad.md ${@:3}
   elif [[ $2 =~ ^snmp$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/snmp.md ${@:3}
   elif [[ $2 =~ ^ftp$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/ftp.md ${@:3}
   elif [[ $2 =~ ^responder$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/responder.md ${@:3}
   elif [[ $2 =~ ^impacket$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/impacket.md ${@:3}
   elif [[ $2 =~ ^general$ ]]; then
      glow /usr/local/bin/enumnotes/_enum/general.md ${@:3}
   fi
elif [ $1 = "exp" ]; then
   if [[ $2 =~ ^general$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/general.md ${@:3}
   elif [[ $2 =~ ^avbypass$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/avbypass.md ${@:3}
   elif [[ $2 =~ ^ss$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/ss.md ${@:3}
   elif [[ $2 =~ ^msfvenom$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/msfvenom.md ${@:3}
   elif [[ $2 =~ ^amsi$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/amsi.md ${@:3}
   elif [[ $2 =~ ^nc$ ]]; then
      glow /usr/local/bin/enumnotes/_exp/nc.md ${@:3}
   fi
elif [ $1 = "postexp" ]; then
   if [[ $2 =~ ^files$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/files.md ${@:3}
   elif [[ $2 =~ ^apps$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/apps.md ${@:3}
   elif [[ $2 =~ ^network$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/network.md ${@:3}
   elif [[ $2 =~ ^processes$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/processes.md ${@:3}
   elif [[ $2 =~ ^jobs$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/jobs.md ${@:3}
   elif [[ $2 =~ ^sysinfo$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/sysinfo.md ${@:3}
   elif [[ $2 =~ ^users$ ]]; then
      glow /usr/local/bin/enumnotes/_postexp/users.md ${@:3}
   fi
elif [ $1 = "hvi" ]; then
   if [[ $2 =~ ^hashes$ ]]; then
      glow /usr/local/bin/enumnotes/_hvi/hashes.md ${@:3}
   elif [[ $2 =~ ^crackoff$ ]]; then
      glow /usr/local/bin/enumnotes/_hvi/crackoff.md ${@:3}
   elif [[ $2 =~ ^pwguess$ ]]; then
      glow /usr/local/bin/enumnotes/_hvi/pwguess.md ${@:3}
   elif [[ $2 =~ ^wifi$ ]]; then
      glow /usr/local/bin/enumnotes/_hvi/wifi.md ${@:3}
   fi
fi