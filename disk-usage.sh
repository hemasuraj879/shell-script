#!/bin//bash

# THIS SCRIPT IS TO GET THE ALERT EMAIL OF DISK USAGE IF IT IS MORE THAN THREESHOLD LIMIT

LOGSDIR=/tmp/shell-script-log
LOGFILE=$LOGSDIR/$0-$DATE.log
SCRIPT_NAME=$0
DATE=$(date +%Y-%m-%d)
MESSAGE=

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}'  | cut -d % -f1  )
DISK_USAGE_THREESHOLD_LIMIT=10

PARTITION=$( df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $1}')
USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}'  | cut -d % -f1 )

if [ $DISK_USAGE -gt $DISK_USAGE_THREESHOLD_LIMIT ]
then
   $MESSAGE+="HIGH DISK USAGE on $PARTITION: $USAGE"
   echo "$MESSAGE" | mail -s "Disk Usage Alert" mulaveesalav@gmail.com
fi 

sh mail.sh mulaveesalav@gmail.com "High Disk Usage" "$MESSAGE" "DEVOPS TEAM" "High Disk usage"