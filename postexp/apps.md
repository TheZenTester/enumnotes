# Linux
## Debian:
- `ls -alh /usr/bin/`
- `ls -alh /sbin/`
- `dpkg -l`
- `ls -alh /var/cache/apt/archives`
- `ls /usr/share/applications | awk -F '.desktop' ' { print $1}' -`
## RedHat:
- `rpm -qa`
- `ls -alh /var/cache/yum/`
## BSD:
- `pkg_info`
## Gentoo:
- `equery list`
- `eix -I`
## Arch Linux:
- `pacman -Q`
## Bash Script:
- Script below:
    `#!/bin/bash
    IFS=: read -ra dirs_in_path <<< "$PATH"
    for dir in "${dirs_in_path[@]}"; do
        for file in "$dir"/*; do
            [[ -x $file && -f $file ]] && printf '%s\n' "${file##*/}"
        done
    done`

# Windows

## PowerShell
- `Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize`
- Obtaining a list of programs from a remote system:
- `Invoke-command -computer remote_pc_name {Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize }`
- List of software that is installed on the users system:
    `$listsoftware= Get-ChildItem HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall
    $names = $listsoftware |foreach-object {Get-ItemProperty $_.PsPath}
    foreach ($name in $names)
    {
        Write-Host $name.Displayname
    }`
## WMI:
- `Get-WmiObject -Class Win32_Product | Select-Object -Property Name > C:\InstalledSoftwareList.txt`
## Reviewing Installed Windows Features
- `Get-WindowsFeature | Where-Object {$_.InstallState -eq 'Installed'}`
## Wmic
Note: Microsoft has planned to deprecrate this program in new versions of Windows. The commands used can be slow to run but it will return the results it needed:
- `wmic /output:C:\InstalledSoftwareList.txt product get name,version`
- Saving it to a text file: `wmic product get name,version /format:csv > C:\InstalledSoftware.csv`
## File Permissions
- Check file permissions: `Get-ACL root.txt | fl *`
- Check directory permissions: `Get-ACL administrator | fl *`