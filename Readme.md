# Change Root Password Script

This project provides a script to change the root password on multiple Linux machines using SSH. The script connects to each machine using a provided password and updates the root password.

## Prerequisites

1. **Linux Environment**
   Ensure you have access to a Linux machine to run the script.

2. **SSH Access**
   The target machines must allow SSH access with password authentication enabled.

3. **Target Machines**
   Ensure the machines you are targeting have SSH enabled and allow root password changes.

## Files

- `change_root_password_with_password.sh`: The script to change the root password on multiple machines.
- `ips.txt`: A text file containing a list of target IP addresses (one per line).

## Usage

### Step 1: Prepare the IP List

Create a file named `ips.txt` with the IP addresses of the target machines:
```txt
192.168.x.x
192.168.x.xx
192.168.x.xxx
```

### Step 2: Make the Script Executable

Grant execute permissions to the script:
```bash
chmod +x change_root_password_with_password.sh
```

### Step 3: Run the Script

Execute the script with the following parameters:

```bash
./change_pass.sh "<ip_list_file>" " <ssh_keyfile>" "<new_password>"
```

#### Example:
```bash
./change_pass.sh "ip.txt" "/Users/gsingh/.ssh/id_rsa" "1234"```

### Script Parameters:
- `<ip_list_file>`: Path to the file containing IP addresses.
- `<keyfile >`: ssh_key for SSH authentication.
- `<new_password>`: New password to set for the root user.

### Step 4: Verify Password Change

After the script completes, you can manually test the new root password by SSH-ing into one of the target machines:

```bash
ssh root@<ip_address>
```
Enter the new password when prompted.

## Troubleshooting
- **Authentication errors**: Verify the current root password and ensure SSH access is properly configured on the target machines.
- **Permission issues**: Ensure the root user has the ability to change passwords and modify `/etc/shadow`.

## Notes

- Use this script responsibly. Unauthorized access or changes to remote machines may violate policies or laws.
- Ensure strong passwords are used to maintain security.
