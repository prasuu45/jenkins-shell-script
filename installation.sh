#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
  echo "you need to be root user to excuite this script"

fi

yum update -y
if [$? -ne 0]
then
  echo "updating yum is faliure"
else 
  echo "updating yum is success"
fi


