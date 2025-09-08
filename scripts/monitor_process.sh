#!/bin/bash
# monitor_process.sh
# Simple Linux process monitoring script
# Output saved to log file with timestamp

LOG_FILE="$HOME/linux-lab/process_log.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== Process Snapshot at $TIMESTAMP ===" >> "$LOG_FILE"
ps aux >> "$LOG_FILE"
echo -e "\n" >> "$LOG_FILE"
