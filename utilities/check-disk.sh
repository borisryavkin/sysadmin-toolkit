#!/bin/bash

WARNING="${1:-85}"
df -P | awk 'NR > 1 { gsub(/%/, "", $5); if ($5 >= warn) print "WARNING: " $6 " is " $5 "% full"; else print "OK: " $6 " is " $5 "% full" }' warn="$WARNING"
