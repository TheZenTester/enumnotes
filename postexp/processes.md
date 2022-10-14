# Linux
- `top`
- `htop`
- `ps -e`
- `ps aux`
- `ps aux | more`
- `ps aux | less`
## Finding processes
- `pgrep`
## Terminating a Process
- `kill`
- `kill -9 PID`
- `pkill processName`
- `killall`

# Windows
## Check for Processes
- `tasklist`
- `wmic process list full`

## PowerShell
- `Get-Process`
- `Get-Process -Name 'Notepad'`
### List path where the process is running:
- `(Get-Process -Name 'Calculator').Path`