#!/bin/bash

# Check if the script is run with the correct arguments
if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <ip_list_file> <ssh_key> <new_root_password>"
  echo "Example: $0 ips.txt /path/to/ssh_key 'new_password'"
  exit 1
fi

# Assign arguments to variables
IP_LIST=$1
SSH_KEY=$2
NEW_PASSWORD=$3
SSH_USER='root'

# Check if the IP list file exists
if [ ! -f "$IP_LIST" ]; then
  echo "Error: IP list file '$IP_LIST' not found."
  exit 1
fi

# Check if the SSH key exists
if [ ! -f "$SSH_KEY" ]; then
  echo "Error: SSH key file '$SSH_KEY' not found."
  exit 1
fi

# Loop through each IP in the list
while read -r IP; do
  if [[ -n "$IP" ]]; then
    echo "Connecting to $IP..."

    # Use SSH to connect and change the root password
    ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no "$SSH_USER@$IP" <<EOF
      echo "root:$NEW_PASSWORD" | chpasswd
EOF

    # Check if the password change was successful
    if [ $? -eq 0 ]; then
      echo "Root password changed successfully on $IP."
    else
      echo "Failed to change root password on $IP."
    fi
  fi
done < "$IP_LIST"

echo "Password change process completed."
