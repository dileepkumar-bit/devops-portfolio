#!/bin/bash
##############################
##############################
#Author: Dileep
#Script: Disk Space Monitor
##############################
##############################
echo "========================"
echo "DISK SPACE MONITOR"
echo "========================"
echo ""
DISK_THRESHOLD=80
# Disk Filesystem:
file=$(df -h / | awk 'NR==2 {print $6}')
echo "Filesystem: $file"
# Disk Usage:
disk=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk Usage: $disk%"
# Disk Threshold:
echo "Threshold: $DISK_THRESHOLD%"
echo ""
if [ "$disk" -lt "$DISK_THRESHOLD" ]; then
    echo "========================"
    echo "DISK STATUS: HEALTHY"
    echo "========================"
else
    echo "========================="
    echo "DISK STATUS: WARNING"
    echo "========================="
fi
