# Sysadmin Scripts

A collection of independent Linux/Bash system-administration utilities representing routine work from 2015–2017. The scripts cover backups, disk checks, process checks, cautious log review, network checks, and system information.

## Usage

```sh
chmod +x *.sh
./system-info.sh
./check-disk.sh 85
./check-process.sh sshd
./network-check.sh example.com
./backup.sh /path/to/source /path/to/backups
./clean-logs.sh /var/log 14
```

## Requirements

Typical Linux utilities: `/bin/bash`, `tar`, `find`, `df`, `free`, `ps`, `ping`, `ip` or `route`, `awk`, and `grep`.

## Notes

`clean-logs.sh` deliberately lists candidate log files only; it does not remove files. Configure paths carefully before running backup commands.
