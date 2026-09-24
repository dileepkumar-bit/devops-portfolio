#!/bin/bash

##############################
##############################
#Author: Dileep
#Script: System_Health
#Date: 24-09-2026
##############################################################################################
##############################################################################################
echo "==============================================="
echo "LINUX SYSTEM HEALTH CHECK"
echo "==============================================="
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80

# hostname:
echo ""
host=$(hostname)
echo "Hostname: $host"
# print uptime:
time=$(uptime | awk -F'up |,' '{print $2}')
load=$(uptime | awk -F'load average: ' '{print $2}')
echo "Uptime: $time"
echo "CPU Load: $load"
echo ""
# memory usage:
memory=$(free -h | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
echo "Memory usage: $memory%"
# disk space:
disk=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')
echo "Disk Space: $disk%"
echo ""
if [ "$memory" -lt "$MEMORY_THRESHOLD" ] && [ "$disk" -lt "$DISK_THRESHOLD" ]; then
    echo "========================"
    echo "SYSTEM HEALTH: HEALTHY"
    echo "========================"
else
    echo "========================="
    echo "SYSTEM HEALTH: UNHEALTHY"
    echo "========================="
fi
