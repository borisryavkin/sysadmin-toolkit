#!/bin/bash

echo "Host: $(hostname)"
echo "User: $(whoami)"
uname -a
uptime
df -h
if command -v free >/dev/null 2>&1; then
    free -h
fi
