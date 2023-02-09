#!/bin/bash
echo "=============menu DataBase ======================="

echo "welcome to our dbms system"
echo "this to create database"
echo "===================================="
# ================ select menu to DB =======================
select choice in Create_Database  List_Databases  Connect_To_Databases  Drop_Database Exit
do 
case $choice in 
Create_Database ) . createdb.sh
;;
List_Databases ) . listDB.sh
;;
Connect_To_Databases ) . connectDB.sh
;;
Drop_Database ) . dropDB.sh
;;
Exit )
clear
break
esac
done
