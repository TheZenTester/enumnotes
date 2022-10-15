# Windows Sensitive Files:
- `%windir%\repair\sam`
- `%windir%\System32\config\RegBack\SAM`
- `%windir%\repair\system`
- `%windir%\repair\software`
- `%windir%\repair\security`
- `%windir%\debug\NetSetup.log (AD domain name, DC name, internal IP, DA account)`
- `%windir%\iis6.log (5,6 or 7)`
- `%windir%\system32\logfiles\httperr\httperr1.log`
- `C:\sysprep.inf`
- `C:\sysprep\sysprep.inf`
- `C:\sysprep\sysprep.xml`
- `%windir%\Panther\Unattended.xml`
- `C:\inetpub\wwwroot\Web.config`
- `%windir%\system32\config\AppEvent.Evt (Application log)`
- `%windir%\system32\config\SecEvent.Evt (Security log)`
- `%windir%\system32\config\default.sav`
- `%windir%\system32\config\security.sav`
- `%windir%\system32\config\software.sav`
- `%windir%\system32\config\system.sav`
- `%windir%\system32\inetsrv\config\applicationHost.config`
- `%windir%\system32\inetsrv\config\schema\ASPNET_schema.xml`
- `%windir%\System32\drivers\etc\hosts (dns entries)`
- `%windir%\System32\drivers\etc\networks (network settings)`
- `%windir%\system32\config\SAM (only really useful if you have access to the files while the machine is off)`
- `%windir%\unattend.xml`
- `%windir%\Windows\Panther\Unattend.xml`
- `%windir%\Windows\Panther\Unattend\Unattend.xml`
- `%windir%\Windows\system32\sysprep.inf`
- `%windir%\Windows\system32\sysprep\sysprep.xml`
- `C:\ProgramData\Configs\*`
- `C:\Program Files\Windows PowerShell\*`
- `dir c:*vnc.ini /s /b`
- `dir c:*ultravnc.ini /s /b`ss
## Search for contents contained in a file:
- `cd C:\ & findstr /SI /M "password" *.xml *.ini *.txt`
- `findstr /si password *.xml *.ini *.txt *.config`
- `findstr /spin "password" *.*`
## Search for a file with a certain filename:
- Search:
    `dir /S /B *pass*.txt == *pass*.xml == *pass*.ini == *cred* == *vnc* == *.config*
    where /R C:\ user.txt
    where /R C:\ *.ini`
## File Permissions (PowerShell)
- `Get-ACL root.txt | fl *`
## check directory permissions (PowerShell)
- `Get-ACL administrator | fl *`

# Linux

## Finding Sensitive files on Linux:
- `locate password | more`      

## Interesting Linux Files/Directories
- `/boot/grub/i386-pc/password.mod`
- `/etc/pam.d/common-password`
- `/etc/pam.d/gdm-password`
- `/etc/pam.d/gdm-password.original`
- `/lib/live/config/0031-root-password`
- `/etc/profile`
- `/etc/passwd`
- `/etc/group`
- `/etc/shadow`
- `/etc/gshadow`
- `/var/apache2/config.inc`
- `/var/lib/mysql/mysql/user.MYD`
- `/root/anaconda-ks.cfg`
- `~/.bash_history`
- `~/.bash_profile`
- `~/.bash_login`
- `~/.nano_history`
- `~/.atftp_history`
- `~/.mysql_history`
- `~/.php_history`
- `ls -alh /var/mail/`

## Sensitive Files for SSH:
- `find / -name authorized_keys 2> /dev/null`
- `find / -name id_rsa 2> /dev/null`

## Interesting Log Files:
- `/etc/httpd/logs/access_log`
- `/etc/httpd/logs/access.log`
- `/etc/httpd/logs/error_log`
- `/etc/httpd/logs/error.log`
- `/var/log/apache2/access_log`
- `/var/log/apache2/access.log`
- `/var/log/apache2/error_log`
- `/var/log/apache2/error.log`
- `/var/log/apache/access_log`
- `/var/log/apache/access.log`
- `/var/log/auth.log`
- `/var/log/chttp.log`
- `/var/log/cups/error_log`
- `/var/log/dpkg.log`
- `/var/log/faillog`
- `/var/log/httpd/access_log`
- `/var/log/httpd/access.log`
- `/var/log/httpd/error_log`
- `/var/log/httpd/error.log`
- `/var/log/lastlog`
- `/var/log/lighttpd/access.log`
- `/var/log/lighttpd/error.log`
- `/var/log/lighttpd/lighttpd.access.log`
- `/var/log/lighttpd/lighttpd.error.log`
- `/var/log/messages`
- `/var/log/secure`
- `/var/log/syslog`
- `/var/log/wtmp`
- `/var/log/xferlog`
- `/var/log/yum.log`
- `/var/run/utmp`
- `/var/webmin/miniserv.log`
- `/var/www/logs/access_log`
- `/var/www/logs/access.log`
- `ls -alh /var/lib/dhcp3/`
- `ls -alh /var/log/postgresql/`
- `ls -alh /var/log/proftpd/`
- `ls -alh /var/log/samba/`

Note: auth.log, boot, btmp, daemon.log, debug, dmesg, kern.log, mail.info, mail.log, mail.warn, messages, syslog, udev, wtmp