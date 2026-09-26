#!/bin/bash
##############################
##############################
# Author: Dileep
# Script: Disk Space Monitor
##############################
##############################
echo "========================"
echo "   DISK SPACE MONITOR"
echo "========================"
echo 

#central configuration file
source "$(dirname "$0")/../config/monitor.conf"

# Check disk filesystem
FILE=$(df -h / | awk 'NR==2 {print $6}')
echo "Filesystem: $FILE"

# Disk usage
DISK=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk Usage: $DISK%"
# Disk Threshold
echo "Threshold: $DISK_THRESHOLD%"
echo 

# Disk Status
if [ "$DISK" -lt "$DISK_THRESHOLD" ]; then
    echo "========================"
    echo "DISK STATUS: HEALTHY"
    echo "========================"
    exit 0 
else
    echo "========================="
    echo "DISK STATUS: WARNING"
    echo "========================="
    exit 1
fi
