#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
	echo "ERROR: Run the script as Root"
	exit 1
else
	echo "Running the script as Root"
fi

VALIDATE(){

	if [ $1 -ne 0 ]
	then
		echo "Error:: Installing $2 is ..... FAILURE"
		exit 1
	else
		echo "Installing $2 is ...... SUCCESS"
	fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
	echo "MySQL not installed, Installing ....."
	dnf install mysql -y
	VALIDATE $?, "mysql"
else
	echo "MySQL already installed. No Action required"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
	echo "Nginx not Installed, Installing ......"
	dnf install nginx -y
	VALIDATE $?, "nginx"
else
	echo "Nginx already installed. No Action required"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
	echo "Python3 not Installed, Installing ....."
	dnf install python3 -y
	VALIDATE $?, "python3"
else
	echo "Python3 already installed. No Action required"
fi






}
