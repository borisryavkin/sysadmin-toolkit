#!/bin/bash

echo "Linux System Information"
echo "========================"
echo "Hostname: $(hostname)"
echo "Current user: $(whoami)"
echo "Kernel: $(uname -sr)"
echo "Version: $(uname -v)"
echo
echo "Uptime:"
uptime
echo
echo "Memory usage:"
if command -v free >/dev/null 2>&1; then
    free -h
else
    vm_stat 2>/dev/null || echo "free command not available"
fi
echo
echo "Disk usage:"
df -h
echo
echo "Network information:"
if command -v ip >/dev/null 2>&1; then
    ip addr show
elif command -v ifconfig >/dev/null 2>&1; then
    ifconfig
else
    echo "ip/ifconfig command not available"
fi
echo
echo "Running-process summary:"
ps aux | awk 'NR > 1 { cpu += $3; mem += $4; count++ } END { printf "Processes: %d  CPU: %.1f%%  Memory: %.1f%%\n", count, cpu, mem }'
ps aux | awk 'NR == 1 || NR <= 6 { print }'
