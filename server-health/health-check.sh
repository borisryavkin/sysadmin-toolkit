#!/bin/bash

CONFIG_FILE="${1:-config.example}"

if [ -f "$CONFIG_FILE" ]; then
    . "$CONFIG_FILE"
else
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

timestamp() {
    date '+%Y-%m-%d %H:%M:%S'
}

log() {
    echo "$(timestamp) $1" | tee -a "$LOG_FILE"
}

check_disk() {
    disk_used=$(df -P "$DISK_PATH" | awk 'NR == 2 { gsub(/%/, "", $5); print $5 }')
    if [ -z "$disk_used" ]; then
        log "WARNING: could not read disk usage for $DISK_PATH"
    elif [ "$disk_used" -ge "$DISK_WARN" ]; then
        log "WARNING: disk usage is ${disk_used}% on $DISK_PATH"
    else
        log "OK: disk usage is ${disk_used}% on $DISK_PATH"
    fi
}

check_memory() {
    if ! command -v free >/dev/null 2>&1; then
        log "WARNING: free command not available"
        return
    fi
    memory_used=$(free | awk '/Mem:/ { printf "%d", ($3 / $2) * 100 }')
    if [ "$memory_used" -ge "$MEMORY_WARN" ]; then
        log "WARNING: memory usage is ${memory_used}%"
    else
        log "OK: memory usage is ${memory_used}%"
    fi
}

check_load() {
    load=$(uptime | awk -F'load averages?: ' '{ print $2 }' | awk -F, '{ print $1 }' | tr -d ' ')
    if [ -z "$load" ]; then
        load=$(uptime | awk -F'load average: ' '{ print $2 }' | awk -F, '{ print $1 }' | tr -d ' ')
    fi
    if [ -n "$load" ] && awk "BEGIN { exit !($load >= $LOAD_WARN) }"; then
        log "WARNING: load average is $load"
    else
        log "OK: load average is ${load:-unknown}"
    fi
}

check_processes() {
    for process in $PROCESSES; do
        if ps aux | grep "[$(echo "$process" | cut -c1)]$(echo "$process" | cut -c2-)" | grep -v grep >/dev/null; then
            log "OK: process found: $process"
        else
            log "WARNING: process not found: $process"
        fi
    done
}

mkdir -p "$(dirname "$LOG_FILE")" 2>/dev/null
log "Health check started; uptime: $(uptime)"
check_disk
check_memory
check_load
check_processes
log "Health check finished"
