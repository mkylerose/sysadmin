#!/bin/bash
services=(nginx sshd cron)
for service in "${services[@]}"; do
    systemctl is-active --quiet $service || {
        echo "$service is down. Restarting..."
        sudo systemctl restart $service
    }
done
