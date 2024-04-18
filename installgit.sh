#!/bin/bash 

# THIS SCRIPT IS WRITTEN TO INSTALL GIT PACKAGE ON DIFFERENT OPERATING SYSTEM

# STORING THE LOG FILES
DATE=$(date +%Y-%m-%d)
LOGSDIR=/tmp
LOGFILE=$SCRIPT_NAME-$DATE.log

#CHECKING WHETHER USER IS IN ROOT OR NOT
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR: PLEASE SWITCH TO ROOT USER"
    exit 1
fi

#CHECKING LINUX FLAVOUR
FLAVOUR_DISTRIBUTION=$(grep '^ID=' /etc/os-release | cut -d '=' -f2)

if [ $FLAVOUR_DISTRIBUTION == "ubuntu" ]
then
    echo "LINUX DISTRIBUTION IS UBUNTU"
    apt install git -y
elif
if [ $FLAVOUR_DISTRIBUTION == "centos" ]
then
    echo "LINUX DISTRIBUTION IS CENTOS"
    yum install git -y
else
    echo "LINUX DISTRIBUTION IS NOT UBUNTU AND CENTOS
fi



