# Linux Disk Management Notes

## Check Disk Usage
- `df -h` → show filesystem usage
- `du -sh <path>` → show folder/file usage
- `lsblk` → list block devices

## Create & Mount Dummy Disk
- `dd if=/dev/zero of=/mnt/diskfile.img bs=1M count=100`
- `mkfs.ext4 /mnt/diskfile.img`
- `mkdir /mnt/testdisk`
- `mount -o loop /mnt/diskfile.img /mnt/testdisk`
- `umount /mnt/testdisk`
