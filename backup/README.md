# Simple Backup Script

A compact Bash directory-backup utility representing routine systems-administration work from 2015. It creates timestamped `tar.gz` archives and reports whether the backup completed.

## Usage

Edit `SOURCE_DIR` and `DEST_DIR` in `backup.sh`, then run:

```sh
chmod +x backup.sh
./backup.sh
```

Example cron entry, run every day at 01:30:

```cron
30 1 * * * /path/to/simple-backup-script/backup.sh >> /path/to/backup.log 2>&1
```

## Requirements

`/bin/bash`, `tar`, `date`, and standard shell utilities.

## Notes

The script is intentionally small and expects the source and destination to be configured locally before use.
