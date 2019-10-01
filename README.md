# MikroTik_Backup

This shell script is used  to create and pull MikroTik backup's to a server.

**The rundown of the scripts is as follows**
--------------------------------------------
1. `Router_Backup_Config.sh` will login to the MikroTik using specified user and create a backup file. (default name will be $router.backup)
2. `Router_Backup_Pull.sh` Will login in to the MikroTik using a specified user to pull the backup file, then it will timestamp the backup file.

## Setup before running scripts
1. Set up a user on the MikroTik that will be used as to login to the MikroTik, my example uses a user called "Backup_Agent".
2. Copy the connecting clients public SSH key on to the Mikrotik, This is the better and more secure configuration as you won't have to hardcode a SSH password into the script.
   1. Instructions on how to copy a pub key to a MikroTik: https://bit.ly/2o70ZEc
3. Setup a cron job on the client server to run the scripts on a desired interval.
   1. Schedule `Router_Backup_Config.sh` first
   2. Schedule `Router_Backup_Pull.sh` second, after a reasonable amount of time (5 minutes or so) after the config script
4. Schedule a script on MikroTik to delete backup file created on MikroTik it self. - example script - "delete_old_backups"

