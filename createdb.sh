#!/bin/bash
# ====================== to make a new data base ==============================
read -p "Enter Database Name :  " database_Name
# =====================to check if dir is taken or not ========================
if [[ -d DB/$database_Name  ]]
then
echo "Database alredy taken"
. createdb.sh
elif [[ "$database_Name" = " "  ]] 
then
echo "Database Name Mustnot be Empty Please try again !!!!!!"
. createdb.sh

elif [ "${database_Name//[!0-9]}" != "" ]  
then

echo "Database Name Mustnot Contain Number Please try again !!!!!!!"
. createdb.sh

elif [[ $database_Name =~ ["!@#$%^&*()_\/+*/\:"] ]]
then
echo "Database Name Mustnot Contain this !@#$%^&*()_+ Please try again !!!!!!!"
. createdb.sh
		
else
mkdir DB/$database_Name

echo "Database Created Successfully ... "
. Main_Menu.sh

fi
