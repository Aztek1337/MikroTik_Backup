#!/usr/bin 

# Update routers.txt with routers IP address or FQDN
routers="192.168.1.1"

#Username for agent SSH key is stored in MikroTik
USER="backup_agent"

# Runs $router_command on routers from routers.txt
for router in $routers
do
router_command="/system backup save name=aa_$router encryption=aes-sha256 password=7Aj4511"

# Connects to router via ssh then runs command and then appends any errors to results.txt
ssh -p 2222 $USER"@"$router "$router_command"
done
