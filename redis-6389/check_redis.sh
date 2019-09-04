#!/bin/bash
# Check if redis is running, return 1 if not.
# Used by keepalived to initiate a failover in case redis is down

REDIS_STATUS=$(telnet 127.0.0.1 6389 < /dev/null | grep "Connected" )
if [ "$REDIS_STATUS" != "" ]
then
  exit 0
else
  logger "REDIS is NOT running. Setting keepalived state to FAULT."
  exit 1
fi
