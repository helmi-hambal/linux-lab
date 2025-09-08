# Linux Disk & Filesystem Monitoring

## Overview
Monitoring disk usage and filesystem health is essential to prevent outages
and ensure system stability.

## Disk Usage

# Show disk space in human-readable format
df -h

# Show disk usage per directory
du -sh /var/log
du -sh /home/*

# Show inode usage
df -i

## Filesystem Info

# List block devices
lsblk

# Detailed filesystem info
sudo blkid
sudo fdisk -l

# Show mounted filesystems
mount | column -t

# Show disk space and file system type
df -Th

## Monitoring Tools

# Watch disk usage in real-time
watch -n 5 df -h

# Monitor logs for disk related errors
tail -f /var/log/syslog | grep -i disk

# Check filesystem for errors
sudo fsck /dev/sda1

# Check free space and usage per filesystem
df -hT

