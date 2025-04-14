#!/bin/bash
logfile="/var/log/syslog"
keywords=("error" "failed" "unauthorized")
tail -n 100 -f "$logfile" | while read -r line; do
    for kw in "${keywords[@]}"; do
        if echo "$line" | grep -i "$kw" > /dev/null; then
            echo "Match: $line"
        fi
    done
done
