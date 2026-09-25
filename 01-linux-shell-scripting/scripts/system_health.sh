#!/bin/bash

##############################
##############################
# Author: Dileep
# Script: System_Health
##############################
##############################

echo "=========================="
echo "LINUX SYSTEM HEALTH CHECK"
echo "=========================="

# central configuration file
source "$(dirname "$0")/../config/monitor.conf"

# Hostname
echo ""
HOST=$(hostname)
echo "Hostname: $HOST"

# Uptime
TIME=$(uptime | awk -F'up |,' '{print $2}')
LOAD=$(uptime | awk -F'load average: ' '{print $2}')
echo "Uptime: $TIME"
echo "CPU Load: $LOAD"
echo ""

# Memory usage
MEMORY=$(free -h | awk '/Mem:/ {printf "%.0f", $3/$2*100}')
echo "Memory usage: $MEMORY%"

# Disk space
DISK=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')
echo "Disk Space: $DISK%"
echo ""

# Check system_health
if [ "$MEMORY" -lt "$MEMORY_THRESHOLD" ] && [ "$DISK" -lt "$DISK_THRESHOLD" ]; then
    echo "========================"
    echo "SYSTEM HEALTH: HEALTHY"
    echo "========================"
else
    echo "========================="
    echo "SYSTEM HEALTH: UNHEALTHY"
    echo "========================="
fi
