#!/bin/bash

#Create bash script for making dump of database and write this dump to the file 
user=xxchaos
dbname=example_database
mysql=$(systemctl status mysql | grep -c active)

#Checks if mysql service exists and creates dump to pwd
if [[ ${mysql} != 1 ]];
then
echo "MySQL service is not exists"
else
mysqldump -u ${user} -p ${dbname} > $PWD/sqldump_"$(date +%d-%m-%Y_%H-%M-%S)".sql
fi

