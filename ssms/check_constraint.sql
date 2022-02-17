USE DataBase_Name;

SELECT *
FROM SYS.CHECK_CONSTRAINTS
WHERE parent_object_id = OBJECT_ID('dbo.Table_Name')
