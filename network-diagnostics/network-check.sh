#!/bin/bash

TARGET_HOST="${1:-example.com}"

section() {
    echo
    echo "== $1 =="
}

section "Hostname"
hostname

section "Interface information"
if command -v ip >/dev/null 2>&1; then
    ip addr show
elif command -v ifconfig >/dev/null 2>&1; then
    ifconfig
else
    echo "ip and ifconfig are not available"
fi

section "Default gateway"
if command -v ip >/dev/null 2>&1; then
    gateway=$(ip route | awk '/default/ { print $3; exit }')
else
    gateway=$(route -n 2>/dev/null | awk '$1 == "0.0.0.0" { print $2; exit }')
fi
echo "${gateway:-No default gateway found}"

section "Gateway connectivity"
if [ -n "$gateway" ] && command -v ping >/dev/null 2>&1; then
    ping -c 2 "$gateway"
else
    echo "Gateway or ping command not available"
fi

section "DNS resolution for $TARGET_HOST"
if command -v dig >/dev/null 2>&1; then
    dig +short "$TARGET_HOST"
elif command -v nslookup >/dev/null 2>&1; then
    nslookup "$TARGET_HOST"
else
    echo "dig and nslookup are not available"
fi

section "External connectivity"
if command -v ping >/dev/null 2>&1; then
    ping -c 2 "$TARGET_HOST"
else
    echo "ping command not available"
fi

section "Routing information"
if command -v ip >/dev/null 2>&1; then
    ip route show
else
    route -n 2>/dev/null || echo "route command not available"
fi
