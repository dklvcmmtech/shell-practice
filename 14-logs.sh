#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SCRIPT_LOG_FOLDER="/var/log/SHELLSCRIPT-LOGS"
LOG_FILE_NAME=$(echo $1 | cut -d "." -f1)
LOG_FILE="$SCRIPT_LOG_FOLDER/$LOG_FILE_NAME.log"

USER=$(id -u)

mkdir -p SCRIPT_LOG_FOLDER

echo "Script started at $(date)" | tee -a $LOG_FILE

if [ $USER -ne 0 ]
then
	echo -e "$R ERROR: Run the script as Root $N" | tee -a $LOG_FILE
	exit 1
else
	echo -e "$G Running the script as Root $N" | tee -a $LOG_FILE
fi

VALIDATE(){

	if [ $1 -ne 0 ]
	then
		echo -e "Error:: Installing $2 is ..... $R FAILURE $N" | tee -a $LOG_FILE
		exit 1
	else
		echo -e "Installing $2 is ...... $G SUCCESS $N" | tee -a $LOG_FILE
	fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
	echo "MySQL not installed, Installing ....." | tee -a $LOG_FILE
	dnf install mysql -y &>> $LOG_FILE
	VALIDATE $?, "mysql"
else
	echo "MySQL already installed. No Action required" | tee -a $LOG_FILE
fi

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ]
then
	echo "Nginx not Installed, Installing ......" | tee -a $LOG_FILE
	dnf install nginx -y &>> $LOG_FILE
	VALIDATE $?, "nginx"
else
	echo "Nginx already installed. No Action required" | tee -a $LOG_FILE
fi

dnf list installed python3 &>> $LOG_FILE
if [ $? -ne 0 ]
then
	echo "Python3 not Installed, Installing ....." | tee -a $LOG_FILE
	dnf install python3 -y &>> $LOG_FILE
	VALIDATE $?, "python3"
else
	echo "Python3 already installed. No Action required" | tee -a $LOG_FILE
fi







