#!/bin/bash
echo "Username | Shell | Last Login | Sudo"
getent passwd | while IFS=: read -r user _ uid _ _ home shell; do
    if [ $uid -ge 1000 ]; then
        last_login=$(lastlog -u "$user" | awk 'NR==2 {print $4, $5, $6}')
        sudo_status=$(sudo -lU "$user" 2>/dev/null | grep -q 'may run the following commands' && echo "Yes" || echo "No")
        echo "$user | $shell | $last_login | $sudo_status"
    fi
done
