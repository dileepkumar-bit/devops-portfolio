#!/bin/bash
##############################
##############################
#Author: Dileep
#Script: System_Backup
##############################
##############################

# Configurable directories
SOURCE_DIR="/home/ubuntu/app"
BACKUP_DIR="/home/ubuntu/backups"

echo "==============================================="
echo "SYSTEM BACKUP"
echo "==============================================="
echo

# Check source directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "FAILURE: Source directory does not exist: $SOURCE_DIR"
    exit 1
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Create timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Backup file
BACKUP_FILE="$BACKUP_DIR/app_backup_${TIMESTAMP}.tar.gz"

# Create backup
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Check backup result
if [ $? -eq 0 ]; then
    echo "Source: $SOURCE_DIR"
    echo "Backup Directory: $BACKUP_DIR"
    echo "Backup File: $(basename "$BACKUP_FILE")"
    echo
    echo "========================"
    echo "BACKUP STATUS: SUCCESS"
    echo "========================"
    exit 0
else
    echo
    echo "========================"
    echo "BACKUP STATUS: FAILED"
    echo "========================"
    exit 1
fi
