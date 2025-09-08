# Linux Cron Jobs

## Overview
Cron allows scheduling of commands or scripts at specific times/dates.

## Basic Commands

# Edit current user's cron jobs
crontab -e

# List cron jobs
crontab -l

# Remove all cron jobs for current user
crontab -r

## Cron Format

* * * * * command
┬ ┬ ┬ ┬ ┬
│ │ │ │ │
│ │ │ │ └─ Day of week (0-7, 0 or 7 = Sun)
│ │ │ └── Month (1-12)
│ │ └─── Day of month (1-31)
│ └──── Hour (0-23)
└───── Minute (0-59)

## Examples

# Run backup.sh at 2:30 AM every day
30 2 * * * /home/azureuser/backup.sh

# Run script every 5 minutes
*/5 * * * * /home/azureuser/check_disk.sh

# Log cron activity
grep CRON /var/log/syslog
