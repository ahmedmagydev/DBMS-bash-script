echo "===============welcome You Should  update Data to===================="  
read -p "Enter Table Name : " TableName
if [[ -f "$TableName" ]]
then
cat $TableName
echo "==================="
read -p "number of record you want to update : " number
roww=$(awk -F : 'END{print $1}' $TableName)
if [[ number -le roww  ]]
then 
sed -i "${number}d" $TableName
cat $TableName
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
echo "Insert another record?"
select check in "Yes" "No"
do
case $check in
"Yes" ) clear ; . ../../insertintoTable.sh  ; clear ; break;;
"No" )  clear ; . ../../menutable.sh  ; clear ; break;;
* ) echo "Invalid choice";
esac
done
else 
echo "fuck bash "
fi