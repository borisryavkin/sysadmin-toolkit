#!/bin/bash

HOST="${1:-example.com}"

echo "Checking $HOST"
ping -c 2 "$HOST" 2>/dev/null || echo "Ping failed"
if command -v ip >/dev/null 2>&1; then
    ip route | awk '/default/ { print "Default gateway: " $3; exit }'
else
    route -n 2>/dev/null | awk '$1 == "0.0.0.0" { print "Default gateway: " $2; exit }'
fi
