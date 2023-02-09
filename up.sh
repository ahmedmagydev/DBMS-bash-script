

#!/bin/bash

read -p "enter table name " TableName
if [ -f $TableName ]
then 
clear
echo "==================data in table  $TableName is ================="
cat $TableName 
echo "========================================"
fi
echo "Enter id  to update data its record  "
read idd

# awk -F ":" '{NF=1; print $1}' ok | grep "\b2\b"  ok
# awk -F ":" '{NF=1; print $1}' $TableName | grep "\b2\b"  $TableName
if [ "$idd" = "`awk -F ":" '{NF=1; print $1}' $TableName | grep "\b$idd\b" `" ]
then 
roww=`awk 'BEGIN{FS=":"}{if ($1=="'$idd'") print NR}' $TableName`
`sed -i ''$roww'd' $TableName`
echo "Record deleted successfully"
else 
echo "This id doesn't exist"
. ../../menutable.sh
fi







num=$(awk -F : 'END{print $1}' $TableName)
id=0
((id = num + 1))

row="$id:"


		field=$(awk -F : 'END{print NF}' $TableName)
		for (( i = 2; i < $field ; i++ )) 
		do
			name=$(awk -F : 'BEGIN {field = '$i'}{if(NR==1){print $field;}}' $TableName)
			colType=$(awk -F : 'BEGIN {field = '$i'}{if(NR==2){print $field;}}' $TableName)
			echo "Enter the value of field ($name):"
			read val
			
			if [[ $colType == "int" ]]
			then
				while ! [[ $val =~ ^[0-9]*$ ]] 
				do
					echo  "Invalid colType!"
					read val
					while  [[ $val == "" ]] 
					do
						echo  "This field must not be empty!"
						read val
					done
				done
			fi
				row+="$val:"
		done
		echo $row>>$TableName
		clear
		echo "The record is inserted to $TableName successfully :)"
		