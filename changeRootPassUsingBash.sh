#!/bin/bash
 
NEW_PASS="_PASS_GOES_HERE_"
 
# IP list file
IP_LIST_FILE="ip.txt"
 
while IFS= read -r IP; do
  echo "Changing root password on $IP"

  if [[ -z "$IP" || $IP == \#* || ! $IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      echo "Skipping: $IP"
      continue
  fi

  ssh -n root@"$IP" "echo 'root:$NEW_PASS' | chpasswd"
 
  if [ $? -eq 0 ]; then
    echo "Password changed on $IP"
  else
    echo "Failed to change password on $IP"
  fi
done < "$IP_LIST_FILE"
