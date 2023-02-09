#!/bin/bash
clear
echo "===============welcome You Should  insert Data to===================="  
read -p "Enter Table Name : " TableName

if [[ -f "$TableName" ]]
then

num=$(awk -F : 'END{print $1}' $TableName)
id=0
((id = num + 1))

row="$id:"

field=$(awk -F : 'END{print NF}' $TableName)
for (( i = 2; i < $field ; i++ )) 
do
name=$(awk -F : 'BEGIN {field = '$i'}{if(NR==1){print $field;}}' $TableName)
colType=$(awk -F : 'BEGIN {field = '$i'}{if(NR==2){print $field;}}' $TableName)
read -p "Enter the value of field $name : " val
while [ -z $val ]
do 
read -p "please enter un empty value enter again >> " val
done
if [[ $colType == "int" ]]
then
while ! [[ $val =~ ^[0-9]*$ ]] 
do
read -p  " colType is not correct enter again" val 
done
while [ -z $val ]
do 
read -p "please enter un empty value enter again >> " val
done
else
while ! [[ $val =~ [a-zA-Z] ]] 
do
read -p  " colType is not correct enter again" val

done
while [ -z $val ]
do 
read -p "please enter un empty value enter again >> " val
done
fi
row+="$val:"
done
echo $row>>$TableName
clear
echo "The record is inserted to $TableName successfully..."
echo "are you need to insert again "
select check in "Yes" "No"
do
case $check in
"Yes" ) clear ; . ../../insertintoTable.sh  ; clear ; break;;
"No" )  clear ; . ../../menutable.sh  ; clear ; break;;
* ) echo "select from 1 and 2 only";
esac
done

else # for if [[ -f "$TableName" ]]
. ../../insertintoTable.sh
fi # for if [[ -f "$TableName" ]]