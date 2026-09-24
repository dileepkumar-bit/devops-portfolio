#!/bin/bash

##############################
##############################
#Author: Dileep
#Script: System_Health
##############################
##############################
echo "================================="
echo "LOG MONITOR"
echo "================================="

ERROR_COUNT=$(grep -ic "error" /var/log/syslog)
#Log file:
echo "Log File: /var/log/syslog"
#Log error count:
echo "ERROR Count: $ERROR_COUNT"

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo "==================="
    echo "LOG STATUS: HEALTHY"
    echo "==================="
else
    echo "====================="
    echo "LOG STATUS: WARNING"
    echo "====================="
fi
