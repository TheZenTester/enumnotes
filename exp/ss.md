# Installing searchsploit (Already in Kali)
`apt update && apt install exploitdb`

## Updating Searchsploit
- `searchsploit -u`

## Basic Searching:
- `searchsploit <version #> etc`
- `searchsploit -t php windows`

## Exclude unwanted results
- `searchsploit linux kernel 5.2 --exclude="Poc"`

## View exploits from Searchsploit
- `searchsploit 9542 --examine`
- `searchsploit -x window/remote/42031.py`

## Copy exploit to current working directory
- `searchsploit -m`

## Access Exploits from Exploit-DB website:
- `searchsploit vsftpd 2.3.4 -w`

## Run an nmap scan result through searchsploit:
1. Run the nmap scan and ensure output is printed to an XML File (`-oX`), for example: `Nmap -Pn 172.21.0.0 -oX results.xml`
2. Take scan results and run through searchsploit: `searchsploit -x --nmap results.xml`

## Useful Searchsploit Aliases
Add to `~/.zshrc` file in Kali to save yourself a lot of keystrokes during the PWK Labs/OSCP Exam
- `alias ss='searchsploit --exclude="/dos/" $1'`
- `alias ssx='searchsploit -x $1'`
- `alias ssm='searchsploit -m $1'`

# Install binsploits
Note: bin-sploits contains a set of compiled binaries that are tied to exploits in the exploitdb database. Installing this package will take some time depending on your network connection.
- `apt update && apt install exploitdb-bin-sploits`

References:

https://www.exploit-db.com/documentation/Offsec-SearchSploit.pdfb