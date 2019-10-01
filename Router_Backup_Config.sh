#!/usr/bin 
# This script will create a backup file on the MikroTik

# Update a txt file such as routers.txt with routers IP address or FQDN. Or you can just manually add one IP or FQDN.
routers="192.168.1.1"

#Default config of "backup_agent" is not a default user on MikroTik, this user was created on the MikroTik
#Please feel free to create a user with another name
USER="backup_agent"

# Runs $router_command on routers from routers.txt
for router in $routers
do
# name can be set to anything, make sure to update backup file name on line 15 on Router_backup_Pull.sh script
#password should be changed to desired password
router_command="/system backup save name=$router encryption=aes-sha256 password=PASSWORD"


# This SSH command relies that client SSH public key is stored on the MikroTik
# On MikroTik, make sure that "backup_agent" (or other username) is the client's pub SSH key, Key owner
# Connects to router via SSH then runs command
ssh -p 22 $USER"@"$router "$router_command"
done
