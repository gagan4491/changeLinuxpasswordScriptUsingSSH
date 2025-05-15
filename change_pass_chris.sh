#!/bin/bash

IP_LIST='ip.txt'
NEW_PASSWORD='sonic1234'
SSH_USER='root'

while read -r IP; do
  if [[ -n "$IP" ]]; then
    echo "Connecting to $IP..."
    ssh  -o StrictHostKeyChecking=no "$SSH_USER@$IP" <<EOF
      echo "root:$NEW_PASSWORD" | chpasswd
EOF
    if [ $? -eq 0 ]; then
      echo "Root password changed successfully on $IP."
    else
      echo "Failed to change root password on $IP."
    fi
  fi
done < "$IP_LIST"

echo "Password change process completed."
