#!/bin/bash
echo "Disk Usage:"
df -h
echo ""
echo "Inode Usage:"
df -i
echo ""
echo "SMART Status:"
for disk in /dev/sd?; do
    echo "Checking $disk:"
    sudo smartctl -H $disk
done
