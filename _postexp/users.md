# Linux 
- `cat /etc/passwd`
- `less etc/passwd`
- `getent passwd | awk -F: '{ print $1}'`
- `cut -d: -f1 /etc/passwd`
- `awk –F: ‘{ print $1}’ /etc/passwd`
- `getent parrwd {1000..6000}`
## Enumerating Users Permissions
- `id`
- `id -nG`
- `getent group`
## Enumerating Linux Groups
- `groups`
- `less /etc/group`
- `getent groups`
- `getent group | awk -F: '{ print $1}'`

# Windows
- View your current user: `whoami`
- View information about the current user: `net user afsimmons`
- View information about current domain user: `net user afsimmons /domain`

## View Local Groups:
- net localgroup
- net localgroup Administrators
- Add a new user: `net user afsimmons enterpasswordhere /add`
- Add a user in a localgroup: `net localgroup Administrators afsimmons`