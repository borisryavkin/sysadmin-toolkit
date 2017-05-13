#!/bin/bash

SOURCE_DIR="${1:-/path/to/source}"
DEST_DIR="${2:-/path/to/backups}"
ARCHIVE="$DEST_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

[ -d "$SOURCE_DIR" ] || { echo "Source directory not found"; exit 1; }
mkdir -p "$DEST_DIR" || exit 1
tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" && echo "Created $ARCHIVE"
