# pfSense-SSH-backup
a bash script that will pull and back up the pfsense XML

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
0 */6 * * * /bin/bash /home/jason/scripts/pfBackup.sh
```
