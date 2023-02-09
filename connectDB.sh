#!/bin/bash
ls DB/

read -p "name of database to start in it :  " database_Name
if [[ -z $database_Name ]]
# -z Length of string is zero ($database_Name)
then
echo "name must not be Empty"
. connectDB.sh
break

elif [[ -d DB/$database_Name ]]
then

cd ./DB/$database_Name
. ../../menutable.sh 
break

else
echo "There was no database in this name enter name of database again"
. connectDB.sh
break
fi