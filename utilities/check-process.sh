#!/bin/bash

PROCESS="$1"

if [ -z "$PROCESS" ]; then
    echo "Usage: $0 process-name"
    exit 1
fi

if ps aux | grep "[$(echo "$PROCESS" | cut -c1)]$(echo "$PROCESS" | cut -c2-)" | grep -v grep >/dev/null; then
    echo "Process is running: $PROCESS"
else
    echo "Process is not running: $PROCESS"
    exit 1
fi
