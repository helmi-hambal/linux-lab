#!/bin/bash

THRESHOLD=1
LOGFILE=~/linux-lab/disk_usage.log

# Create log file if not exists
touch $LOGFILE

df -h | grep '^/dev/' | while read line; do
    usage=$(echo $line | awk '{print $5}')
    partition=$(echo $line | awk '{print $1}')
    echo "$(date): $partition usage $usage" >> $LOGFILE
done

