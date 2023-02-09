#!/bin/bash
read -p "Enter name of database you want to delete it >>  " database_Name
if [[ -d DB/$database_Name ]]
then
rm -r ./DB/$database_Name
echo " Database removed Successfully !"
else
echo "There was no database in this name enter name of database again"
. Main_Menu.sh
fi
