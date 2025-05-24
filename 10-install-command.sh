#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
	echo "ERROR:: Please run this script with root access"
	exit 1
else
	echo "You are running with Root access"
fi

dnf list installed mysql  

if [ $? -ne 0 ]
then
	echo "Installing MySQL is ......"
	dnf install mysql -y
	if [ $? -eq 0 ]
	then
		echo "Installing MySQL is .... SUCCESS"
	else
		echo "MySQL already installed"
		exit 1
	fi
else
	echo "MySQL is already installed........ Nothing to do"
fi
