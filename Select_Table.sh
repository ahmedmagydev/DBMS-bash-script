#!/bin/bash

read -p "enter table name " TableName
if [ -f $TableName ]
then 
clear
echo "==================data in table  $TableName is ================="
cat $TableName 
echo "========================================"

. ../../menutable.sh

elif [ -z $TableName ]
then 
echo "enter name not emoty name"
. ../../menutable.sh
else 
echo "this table  dosnot found"
. ../../menutable.sh
fi 
