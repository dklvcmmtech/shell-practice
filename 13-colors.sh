#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"



USER=$(id -u)

if [ $USER -ne 0 ]
then
	echo -e "$R ERROR: Run the script as Root $N"
	exit 1
else
	echo -e "$G Running the script as Root $N"
fi

VALIDATE(){

	if [ $1 -ne 0 ]
	then
		echo -e "Error:: Installing $2 is ..... $R FAILURE $N"
		exit 1
	else
		echo -e "Installing $2 is ...... $G SUCCESS $N"
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







