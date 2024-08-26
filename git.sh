#!/bin/bash

USERID=$(id -u)

if [$USERID -ne o]
then
  echo "you need to be root user to excuite this script"

fi

dnf install git -y 

if [$? -ne o]
then
   echo "installing git is failure"
else
  echo "installing git is success"

fi
