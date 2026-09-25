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
# Check Disk Filesystem:
FILE=$(df -h / | awk 'NR==2 {print $6}')
echo "Filesystem: $FILE"
# Check Disk Usage:
DISK=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk Usage: $DISK%"
# Disk Threshold:
echo "Threshold: $DISK_THRESHOLD%"
echo ""
#Check Disk Status:
if [ "$DISK" -lt "$DISK_THRESHOLD" ]; then
    echo "========================"
    echo "DISK STATUS: HEALTHY"
    echo "========================"
else
    echo "========================="
    echo "DISK STATUS: WARNING"
    echo "========================="
fi
