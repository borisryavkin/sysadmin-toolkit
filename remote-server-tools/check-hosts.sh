#!/bin/bash

HOSTS_FILE="${1:-hosts.example}"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "Hosts file not found: $HOSTS_FILE"
    exit 1
fi

while IFS= read -r host; do
    case "$host" in
        ''|\#*) continue ;;
    esac

    echo "== $host =="
    if ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" 'echo connected' >/dev/null 2>&1; then
        echo "SSH: connected"
        ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" 'uptime; df -h; free -h 2>/dev/null || vm_stat 2>/dev/null'
    else
        echo "SSH: connection failed"
    fi
    echo
done < "$HOSTS_FILE"
