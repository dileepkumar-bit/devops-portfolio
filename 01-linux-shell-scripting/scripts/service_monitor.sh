#!/bin/bash
##############################
##############################
#Author: Dileep
#Script: service_monitor
##############################
##############################
echo "========================"
echo "SERVICE MONITOR"
echo "========================"
echo ""
SERVICE_NAME="$1"
#Service Name:
echo "Service: $SERVICE_NAME"
#Service status:
STATUS=$(systemctl is-active "$SERVICE_NAME")
echo "status: $STATUS"
if [ "$STATUS" = "active" ]; then
    echo "======================="
    echo "SERVICE STATUS: RUNNING"
    echo "======================="
else
    echo "======================="
    echo "SERVICE STATUS: STOPPED"
    echo "======================="
fi
