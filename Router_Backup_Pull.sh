#!/usr/bin 

# Update routers.txt with routers IP address or FQDN
routers="192.168.1.1"

#username SSH key is stored on MikroTik
USER="backup_agent"

# Runs $router_command on routers from routers.txt
for router in $routers
do
#bfn=backup file name
bfn="aa_$router.backup"
router_command="get $bfn /fs/backups"

# Connects to router via ssh then runs command and then appends any errors to results.txt
sftp -P 2222 $USER"@"$router <<EOF
$router_command
exit
EOF
done

 mv "/fs/backups/aa_$router.backup" "/fs/backups/router_backups/aa_$router-$(date +%m%d%y).backup"
