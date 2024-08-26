#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0] 
then
  echo "you need to be root uesr to excute the script"
fi 

