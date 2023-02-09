#!/bin/bash
read -p "enter table name " TableName
if [  -f $TableName  ]
then
rm -r $TableName 
clear
echo "==============table remove successfully===================="
. ../../menutable.sh
else 
clear
 echo "===============error removing table not found=================="
 . ../../menutable.sh
 fi 