# Linux Process & Resource Monitoring

## Overview
Monitoring running processes, CPU, memory, and system resources is critical
for troubleshooting and performance tuning.

## Process Management

# List running processes
ps aux

# View processes tree
pstree

# Real-time process view
top

# Alternative real-time view with more info
htop   # if installed

## CPU & Memory Usage

# Show CPU usage
top
mpstat   # from sysstat package

# Show memory usage
free -h
vmstat 1 5

# Detailed per-process memory usage
ps aux --sort=-%mem | head -n 10

## Disk I/O Monitoring

# Show I/O per device
iostat -xz 1   # from sysstat package

# Monitor read/write for a file
iotop   # requires root

# Disk space in human-readable format
df -h
du -sh /var/log

## Network Monitoring

# Show current network connections
netstat -tulnp
ss -tulnp

# Show bandwidth usage
ifstat 1
nload   # if installed

# Real-time connections & traffic
iftop   # requires root

## Automation & Alerts

# Cron job example: check disk usage daily
0 7 * * * /usr/bin/df -h >> /var/log/disk_report.log

# Email alert if disk > 80%
df -h | awk '$5+0 > 80 {print $0}' | mail -s "Disk Alert" admin@example.com
