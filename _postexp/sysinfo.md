# Linux 
## For all Linux Distro's:
- `uname -a`
- `cat /etc/issue`
- `cat /proc/version`

## Debian:
- `dmesg | grep Linux`
## RedHat:
- `rpm -q kernel`
# Windows
- Command Line: `systeminfo`
## PowerShell
- `$PSVersionTable`
- Obtaining Systems Enviorment Variables: `Get-ChildItem -Path Env:`
- `Get-ComputerInfo`
- `Get-ComputerInfo -Property "*version"`
- `Get-ComputerInfo -Property "version", "os" | select WindowsCurrentVersion, WindowsVersion, OsName, OsBuildNumber, OsHotFixes, OsArchitecture | fl`