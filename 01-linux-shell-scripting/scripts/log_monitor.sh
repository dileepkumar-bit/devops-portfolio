#!/bin/bash

##############################
##############################
# Author: Dileep
# Script: Log_Monitor
##############################
##############################

echo "========================"
echo "LOG MONITOR"
echo "========================"

# Checking error count
ERROR_COUNT=$(grep -ic "error" /var/log/syslog)

#Log file
echo "Log File: /var/log/syslog"

# Log error count
echo "ERROR Count: $ERROR_COUNT"

# check Log status
if [ "$ERROR_COUNT" -eq 0 ]; then
    echo "==================="
    echo "LOG STATUS: HEALTHY"
    echo "==================="
else
    echo "====================="
    echo "LOG STATUS: WARNING"
    echo "====================="
fi
