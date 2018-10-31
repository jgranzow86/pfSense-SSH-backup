#!/bin/bash

## User adjustable variables
userName=backupsvc
pfSenseServer=""
toEmailAddress="user@example.com"
fromEmailAddress="pfsense@example.com (pfSense)"
emailSubject="pfSense Backup Error"
emailBody="Error backing up pfSense configureation file for $pfSenseServer."
backUpPath="/path/to/folder"
backUpsToKeep=28

## Check if backup directory exists, if it doesn't then create it
if [ ! -d $backUpPath ]
then
  mkdir $backUpPath
fi

## Move to backup directory
cd $backUpPath

## Get latest backup
scp $userName@$pfSenseServer:/conf/config.xml $backUpPath/config-$(date +%y%m%d%H%M).xml \
|| echo "$emailBody" |mailx -r "$fromEmailAddress" -s "$emailSubject" $toEmailAddress

## Clean up old backups
if [ $(ls -t |tail -n +$(( $backUpsToKeep + 1 )) |wc -l) -gt 0 ]
then
  rm $(ls -t $backUpPath |tail -n +$(( $backUpsToKeep + 1 )))
fi
