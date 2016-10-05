# Network Diagnostics

A quick Bash connectivity troubleshooting utility representing Linux administration work from 2016. It reports interface, gateway, DNS, external-connectivity, hostname, and routing information.

## Usage

```sh
chmod +x network-check.sh
./network-check.sh example.com
```

The hostname argument is optional and defaults to `example.com`.

## Requirements

`/bin/bash`, `hostname`, `ping`, `ip` or `route`, `awk`, plus `dig` or `nslookup` when available.

## Notes

Unavailable network utilities are reported rather than treated as fatal errors.
