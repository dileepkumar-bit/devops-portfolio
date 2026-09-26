#!/bin/bash

##############################
##############################
# Author: Dileep
# Script: service_monitor
##############################
##############################

echo "==========================="
echo "     SERVICE MONITOR"
echo "==========================="
echo 

# Configurable service name
SERVICE_NAME="$1"

# Validate service name 
if [ -z "$SERVICE_NAME" ]; then 
  echo "ERROR: Service name is required."
  echo "Usage: $0 <service-name>" 
  exit 2 
fi

echo "Service: $SERVICE_NAME"

# Check service status
STATUS=$(systemctl is-active "$SERVICE_NAME")
echo "status: $STATUS"
echo 
if [ "$STATUS" = "active" ]; then
    echo "======================="
    echo "SERVICE STATUS: RUNNING"
    echo "======================="
    exit 0
else
    echo "======================="
    echo "SERVICE STATUS: STOPPED"
    echo "======================="
    exit 1
fi
