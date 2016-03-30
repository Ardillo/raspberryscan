# Raspberry Pi scan
Scan for Raspberry Pi's in your network.

Script which scans entire network on raspberry Pi's using port 22, use wisely. You could frustrate other users.

Script needs one variable, a network interface which is connected to the network you want to scan.
It will give an message with the available interfaces if you type in a wrong interface.

## Dependencies
- sudo rights
- basic tools: *egrep, grep, awk, tr, rev, cut, echo* (almost every distro has these, don't worry)
- user tools: *nmap*
