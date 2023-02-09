#!/bin/bash

read -p "enter table name " TableName
if [ -f $TableName ]
then 
clear
echo "==================data in table  $TableName is ================="
cat $TableName 
echo "========================================"
fi
echo "Enter id  to delete its record  "
read id

# awk -F ":" '{NF=1; print $1}' ok | grep "\b2\b"  ok
# awk -F ":" '{NF=1; print $1}' $TableName | grep "\b2\b"  $TableName
if [ "$id" = "`awk -F ":" '{NF=1; print $1}' $TableName | grep "\b$id\b" `" ]
then 
row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $TableName`
`sed -i ''$row'd' $TableName`
echo "Record deleted successfully"
. ../../menutable.sh
else 
echo "This id doesn't exist"
. ../../menutable.sh
fi




