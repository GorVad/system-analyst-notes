# What is it?
Temporary Tables are most likely as Permanent Tables. Temporary Tables are Created in TempDB and are automatically deleted as soon as the last connection is terminated. Temporary Tables helps us to store and process intermediate results. Temporary tables are very useful when we need to store temporary data.

# Syntax
## Create
Need to use "#" to determine table as temporary
```
CREATE TABLE #EmpDetails (id INT, name VARCHAR(25))  
```
## Insert values
```
INSERT INTO #EmpDetails VALUES (01, 'Lalit'), (02, 'Atharva') 
```
## Select
```
SELECT * FROM #EmpDetails ```
```

# Sources
1. (Geek for geeks: Temporary table)[https://www.geeksforgeeks.org/what-is-temporary-table-in-sql] (eng)
2. (Metanit: Временные таблицы)[https://metanit.com/sql/sqlserver/10.4.php?ysclid=li0el6zkzp428353693] (rus)