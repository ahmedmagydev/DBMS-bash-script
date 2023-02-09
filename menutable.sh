#!/bin/bash

echo "=============menu table======================="
echo "welcome to our dbms system"
echo "this to create table"
echo "===================================="

# ================ select menu to table =======================
select choice in Create_Table  List_Tables  Drop_Table  Insert_into_Table  Select_Table Delete_From_Table  Update_Table Main_Menu Exit
do 
case $choice in 
Create_Table ) . ../../createtable.sh  #
;;
List_Tables ) . ../../List_Tables.sh   #
;;
Drop_Table ) . ../../Drop_Table.sh     #
;;
Insert_into_Table ) . ../../insertintoTable.sh   #
;;
Select_Table ) . ../../Select_Table.sh   #
;;
Delete_From_Table ) . ../../Delete_From_Table.sh   #
;;
Update_Table ) . ../../up.sh
;;
Main_Menu ) 
clear
. ../../Main_Menu.sh  #
;;
Exit ) 
cd .. ; 
cd .. ; 
clear
break 2

;;
esac
done
