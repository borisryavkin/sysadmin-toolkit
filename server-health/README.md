# Server Health Check

A basic Bash monitoring script representing routine Linux server checks from 2016. It records disk, memory, load, uptime, and selected-process status with simple warning thresholds.

## Usage

Copy and edit the configuration, then run the checker:

```sh
cp config.example config
chmod +x health-check.sh
./health-check.sh config
```

## Requirements

`/bin/bash`, `df`, `free`, `uptime`, `ps`, `awk`, `grep`, and `tee`.

## Notes

The default thresholds are examples. Set the process names, log path, and threshold values for the machine being checked.
