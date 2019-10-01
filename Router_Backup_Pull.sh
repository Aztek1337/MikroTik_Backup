#!/usr/bin 
#Should be ran after Router_Backup_Config.sh
# Will login into MikoTik and pull backup file that is created and store it on location specified

# Update routers.txt with routers IP address or FQDN
routers="192.168.1.1"

#username is on Mikrotik, Server's Public  SSH key is stored on MikroTik
USER="backup_agent"

# Runs $router_command on routers
for router in $routers
do
#bfn=backup file name
bfn="$router.backup"
router_command="get $bfn /PATH TO BACKUP" # <--- file path is on client server 

# Connects to router via ssh then runs command and then appends any errors to results.txt
sftp -P 22 $USER"@"$router <<EOF
$router_command
exit
EOF
done

# Renames backup file to add date stamp
 mv "/PATH TO BACKUP/$router.backup" "/PATH TO BACKUP/$router-$(date +%m%d%y).backup"
