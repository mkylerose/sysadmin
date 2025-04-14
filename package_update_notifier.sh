#!/bin/bash
if ! command -v apt &> /dev/null; then
    echo "Only supports apt-based systems."
    exit 1
fi
updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)
if [ $updates -gt 0 ]; then
    echo "$updates packages can be upgraded."
fi
