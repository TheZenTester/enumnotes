# PHP Code Analysis General Notes
- Look for super global variables of GET / POST/REQUEST
    - `grep -R -i '$_[GPR].*\[' .`

# Dangerous Functions
- `grep -R -i 'exec\|shell_exec\|system\|passthru\|eval\|popen' .`
- Helpful post: https://gist.github.com/mccabe615/b0907514d34b2de088c4996933ea1720
## Ippsec
- `exec`, `shell_exec`, `system`, `passthru`, `eval`, `popen`
- `unserialize`, `include`, `file_put_contents`
- `$_COOKIE | if`
