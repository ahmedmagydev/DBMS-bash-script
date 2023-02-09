function selectall {
	NR=$(awk -F : 'END{print NR}' $TableName)
		((NR= $NR - 2))
		head -n1 $TableName > select.txt 
		tail -n$NR $TableName >> select.txt
		column -t -s ':' select.txt  > output.txt  
		awk  '{
			print $0;
			if(NR==1){
				print "-------------------------------------------------------------------------------"
			}
		}' output.txt
		rm select.txt output.txt
		echo -e "\n"
}

function deleterecord { 
	echo "Enter the ID of the record you want to delete or type (back) to back to MENU: "
	read id
	if [  $id == "back" ]
	then
		clear 
		. select2.sh
	else
		if ! [[ $id =~ ^[0-9]*$ ]]
		then
			echo "Invalid ID!"
			val1="Re-enter ID"
			val2="Back to MENU"
			select val in "$val1" "$val2"
			do
				case $val in
					$val1 ) clear ; deleterecord ; break;;
					$val2 ) clear ; . select2.sh ; clear ; break;;
					* ) echo "Invalid choice"
				esac
			done
		else
			check=$(awk -F : 'BEGIN {pk = '$id'}{
				if($1==pk){print $0;}
				}' $TableName)
			if [[ $check == "" ]]
			then
				echo "Invalid ID!"
				val1="Re-enter ID"
				val2="Back to MENU"
				select val in "$val1" "$val2"
				do
					case $val in
						$val1 ) clear ; deleterecord ; break;;
						$val2 ) clear ; . select2.sh ; clear ; break;;
						* ) echo "Invalid choice"
					esac
				done
            else    

               if [ "$id" = "`awk -F ":" '{NF=1; print $1}' $TableName | grep "\b$id\b" `" ]
                then 
                 row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $TableName`
                 `sed -i ''$row'd' $TableName`
                    echo "Record deleted successfully"

                else 
                   echo "This id doesn't exist"
                fi
            fi     
		fi
	fi
}

echo "Enter the name of TableName or type (back) to go back to MENU: "
read TableName
if [  $TableName == "back" ]
then
	clear 
	. selectTB.sh
else
	if  [[ -f "$TableName" ]]
	then
		selectall
		val2="Select specific record"
		val3="Back to MENU"

		select val in  "$val2" "$val3"
		do
			case $val in
				$val2 ) clear ; deleterecord         ; break;;
				$val3 ) clear ; . select2.sh ; clear ; break;;
				* ) echo "Invalid choice"
			esac
		done
	else
		echo "There is no TableName with this name!"
		val1="Re-enter name of TableName"
		val2="Back to MENU"
		select val in "$val1" "$val2"
		do
			case $val in
				$val1 ) clear ; . selectTB.sh    ; clear ; break;;
				$val2 ) clear ; . select2.sh ; clear ; break;;
				* ) echo "Invalid choice"
			esac
		done
	fi
fi