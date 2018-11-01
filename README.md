# pfSense-SSH-backup
a bash script that will pull and back up the pfsense XML. It will store as many as you like by setting the variable. If email is configured on the system it can email the user on failure of a back up.

### Quick instructions
- A user needs to be created on pfSense with **User - System: Copy files (scp)** permissions and an SSH key to allow the script to reach in and grab the XML config from pfSense.
- Once the user is created and the SSH keys have been setup the script can be run and it will make a backup and keep track of how many to keep. Don't put anything else in the backups folder as it will be delete with the cleanup.
- Install the the script as a cron job so that it will run as often as you would like.

### Example Cron job that runs every six hours

```
#* * * * *        command to be executed
#- - - - -
#| | | | |
#| | | | +----- day of week (0 - 6) (Sunday=0)
#| | | +------- month (1 - 12)
#| | +--------- day of        month (1 - 31)
#| +----------- hour (0 - 23)
#+------------- min (0 - 59)
0 */6 * * * /bin/bash /home/USER/scripts/pfBackup.sh
```
