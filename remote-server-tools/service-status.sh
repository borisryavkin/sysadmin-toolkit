#!/bin/bash

HOSTS_FILE="${1:-hosts.example}"
SERVICE="${2:-sshd}"

while IFS= read -r host; do
    case "$host" in ''|\#*) continue ;; esac
    echo "== $SERVICE on $host =="
    ssh -o BatchMode=yes -o ConnectTimeout=5 "$host" "ps aux | grep '[${SERVICE%?}]${SERVICE#?}' | grep -v grep" || echo "Service/process not found or host unavailable"
    echo
done < "$HOSTS_FILE"
