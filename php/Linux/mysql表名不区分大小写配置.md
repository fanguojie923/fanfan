# linux下MySQL表名忽略大小写 #

 

## 用命令查看当前是否区分大小写： ##

***************************************
**> mysqlshow variables like "%case%";**

	+------------------------+-------+
	| Variable_name          | Value |
	+------------------------+-------+
	| lower_case_file_system | OFF   | 
	| lower_case_table_names | 0     | 
	+------------------------+-------+
	2 rows in set (0.00 sec)

******************************************

 

	lower_case_file_system | OFF         说明当前区分大小写

 
## 修改方法 ##
	- 1.root登录，vi /etc/my.cnf
	- 2.在[mysqld]下加入一行：lower_case_table_names=1     //（为0时区分）
	- 3.保存退出，重启mysql。**

*********************************
	mysql> show variables like "%case%";
	+------------------------+-------+
	| Variable_name          | Value |
	+------------------------+-------+
	| lower_case_file_system | OFF   |
	| lower_case_table_names | 1     |
	+------------------------+-------+
	2 rows in set (0.00 sec)
*******************************


