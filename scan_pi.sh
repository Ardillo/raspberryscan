#!/bin/sh
#
# Script which scans entire network on raspberry Pi's 
#  Using port 22, use wisely. You could frustrate other users.

execute_scan(){
  echo ""
  echo " ============================================================"
  echo "|==--                  Pi's in network                   --==|"
  echo " ============================================================"
  echo " scanning network: $1"
  echo ""
  sudo nmap -sS -p22 $1 -Pn -T4 | grep -B 4 "Raspberry"
  echo ""
}

parse_input(){
  IFACES=$(ip addr show | egrep '^[[:digit:]]' | awk '{print $2}' | \
           tr -d ':' | tr '\n' ' ' | rev | cut -c 2- | rev)
  if [ "$1" = "" ]; then
    echo "- No input given"
    echo "  enter network interface -> ${IFACES}"
    return
  fi
  SUBNET=$(ip addr show $1 | grep 'inet ' | awk '{print $4}' | \
           egrep '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}' -o)
  if [ "${SUBNET}" = "" ]; then
    echo "- Invalid interface given -> $1"
    echo "  enter correct interface -> ${IFACES}"
    return
  else
    execute_scan "${SUBNET}0-255"
  fi
}

# Parse input and execute scan
parse_input $1
