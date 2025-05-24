#!/bin/bash

NUMBER1=$1
NUMBER2=$2

if [ $NUMBER1 -lt $NUMBER2 ]
then
	echo "Given number $NUMBER1 is less than $NUMBER2"
else
	echo "Given number $NUMBER1 is greather than $NUMBER2"
fi
