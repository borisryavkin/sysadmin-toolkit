#!/bin/bash

# Change these paths before running the backup.
SOURCE_DIR="/path/to/source"
DEST_DIR="/path/to/backups"
ARCHIVE_PREFIX="backup"

DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE="$DEST_DIR/${ARCHIVE_PREFIX}_${DATE}.tar.gz"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    if [ $? -ne 0 ]; then
        echo "Could not create backup directory: $DEST_DIR"
        exit 1
    fi
fi

echo "Creating backup of $SOURCE_DIR"
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ] && [ -f "$ARCHIVE" ]; then
    echo "Backup completed: $ARCHIVE"
    exit 0
fi

echo "Backup failed"
exit 1
