#### mysql使用sql语句查询数据库所有表注释等 ##

> 1、/* 查询数据库 test 所有表注释 */

		select 
		TABLE_NAME, 
		TABLE_COMMENT 
	from 
		INFORMATION_SCHEMA.Tables
	where 
		table_schema = '某数据库名称'

> 2、要查询表字段的注释

		select 
		COLUMN_NAME，
		COLUMN_COMMENT 
	from 
		INFORMATION_SCHEMA.Columns
	where 
		table_name = '表名'  
		and table_schema='数据库名'

https://www.cnblogs.com/007sx/p/7093429.html