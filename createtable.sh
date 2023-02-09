#!/bin/bash

read -p "Enter Table Name : " TableName

if [[ -f $TableName ]]
then
echo "Table alredy Exist"
echo "Enter A new Name again >>>> "
. ../../createtable.sh

elif [ -z $TableName  ] 
then
echo "Table Name Mustnot be Empty Please try again !!!!!!"
. ../../createtable.sh
elif [ "${TableName//[!0-9]}" ]  
then
echo "Table Name Mustnot Contain Number Please try again !!!!!!!"
. ../../createtable.sh
elif [[ $TableName =~ ["!@#$%^&*()_+/\*//"] ]]
then
echo "Table Name Mustnot Contain this !@#$%^&*()_+ Please try again !!!!!!!"
. ../../createtable.sh

elif [[ $TableName =~ [' '] ]]
then
echo "Table Name Mustnot Contain space"
. ../../createtable.sh
else
read -p "Enter Colum Number :-> "  colnum 
while [[ -z $colnum ]]
do
echo "col num mustnotbe Empty "
read -p "Enter Colum Number :-> "  colnum 
done
while [[ $colnum =~ [a-zA-Z] ]]
do
echo "col num Mustnot Contain  char !!!!!!!"
read -p "Enter Colum Number :-> "  colnum 
done
row1="ID:"
		row2="int:"
		echo "created id as pk in col one in the table ... "
  counter=2 
  while [ $colnum -ge $counter ]
  do
			read -p "enter field name " field
      while [ -z $field ]
      do
echo  "table field mustnot be empty"
      			read -p "enter field name " field
      done
			row1+="$field:"
			echo "Enter the colType:"
			select colType in "Integer" "String"
			do
				case $colType in
					"Integer" ) row2+="int:"; break;;
					"String" ) row2+="string:"; break;;
					* ) echo "select again";
				esac
			done
((counter++))
done
fi
touch $TableName
	echo $row1>>$TableName
		echo $row2>>$TableName
		
echo $TableName" Created successfully...."
. ../../menutable.sh

