#!/bin/bash

LOG_DIR="${1:-/var/log}"
DAYS="${2:-14}"

echo "This command lists .log files older than $DAYS days in $LOG_DIR."
echo "Review the list before manually removing any files."
find "$LOG_DIR" -type f -name '*.log' -mtime "+$DAYS" -print 2>/dev/null
