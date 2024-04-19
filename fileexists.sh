#!/bin/bash

# THIS SCRIPT IS USED TO KNOW THE FILE STATUS EXISTS OR NOT


# TSORING THE LOG FILE
LOGSDIR=/tmp
DATE=$(date +%Y-%m-%d)
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

# CHECKING WHETHERE ON ROOT USER OR NOT
USERID=$(id -u) &>>$LOGFILE
if [ $USERID -ne 0 ]
then
    echo "ERROR: PLEASE SWITCH TO ROOT USER"
    exit 1
fi 

FILE_PATH=$(/root/lalli)
if [ -e $FILE_PATH ]
then   
    echo "FILE ALREADY EXISTS"
else
    echo "FILE DOES NOT EXISTS"
fi
