#!/bin/bash

HOSTS_FILE="${1:-hosts.example}"

while IFS= read -r host; do
    case "$host" in ''|\#*) continue ;; esac
    echo "== Disk usage: $host =="
    ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" 'df -h' || echo "Could not check $host"
    echo
done < "$HOSTS_FILE"
