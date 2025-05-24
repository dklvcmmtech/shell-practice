#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ] 
then
	echo "ERROR:: Running script as non root, Please run as root"
	exit 1
else
	echo "Running script as root user..."
fi

dnf list installed mysql

if [ $? -ne 0 ] then
	echo "MySQL not installed on this System, Installing now ....."
	dnf install mysql -y
	if [ $? -eq 0 ] then
		echo "MySQL installed Successfully"
	else
		echo "Unable to install MySQL successfully, Failed"
		exit 1
	fi
else
	echo "MySQL already installed"
fi
