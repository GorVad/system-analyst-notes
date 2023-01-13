# Functions
In general, a function is a set of SQL statements that carried out any operation, such as select, insert delete, and update. There are two types of functions in PostgreSQL "system-defined functions" and "user-defined functions". In this article, we discuss the user-defined function.
Syntax:
```
CREATE OR REPLACE FUNCTION function_name (parameters-list)  
RETURNS return_type  
LANGUAGE plpgsql  
AS  
$$  
    DECLARE  
    --- variables  
    BEGIN  
        --- SQL statements (logic)  
    END  
$$  
```
Example 1:
```
CREATE OR REPLACE FUNCTION GetAllEmployees()  
RETURNS Employees  
LANGUAGE SQL   
AS   
$$  
    SELECT * FROM Employees;  
$$;  
```
Example 2:
```
CREATE OR REPLACE FUNCTION GetEmployeeAge(EmpId INT, Age OUT VARCHAR(100))  
LANGUAGE plpgsql   
AS   
$$  
BEGIN  
    SELECT AGE(NOW()::Date,DateOfBirth) into Age FROM Employees WHERE Id = EmpId;  
END;  
$$  
```
Execute example:
```
SELECT * FROM GetEmployeeById(3)  
```

# Stored procedures
To overcome the limitations of a function, PostgreSQL has a procedure that supports transactions. In the procedure, we can start, commit, rollback the transaction. However, the procedure can not return a result set like a table. It can only return the INOUT parameters.  
Example 1:
```
CREATE OR REPLACE PROCEDURE AddEmployee  
(  
    EmpId INOUT INT,  
    EmpName VARCHAR(100),  
    EmpDob DATE,  
    EmpCity VARCHAR(100),  
    EmpDesignation VARCHAR(100),  
    EmpJoiningDate DATE  
)  
LANGUAGE plpgsql AS  
$$  
BEGIN         
   INSERT INTO Employees (Name,DateOfBirth,City,Designation,JoiningDate) VALUES   
    (EmpName,  
     EmpDob,  
     EmpCity,  
     EmpDesignation,  
     EmpJoiningDate  
    ) RETURNING Id INTO EmpId;  
END  
$$;  
```
Example 2:
```
CREATE OR REPLACE PROCEDURE UpdateEmployee  
(  
    EmpId INT,  
    EmpName VARCHAR(100),  
    EmpDob DATE,  
    EmpCity VARCHAR(100),  
    EmpDesignation VARCHAR(100),  
    EmpJoiningDate DATE  
)  
LANGUAGE plpgsql AS  
$$  
BEGIN         
   UPDATE Employees SET   
   Name = EmpName,  
   DateOfBirth = EmpDob,  
   City = EmpCity,  
   Designation = EmpDesignation,  
   JoiningDate = EmpJoiningDate  
   Where Id = EmpId;  
END  
$$; 
```
Execute example:
```
CALL AddEmployee(null,'Peter Parker','1997-10-01','New York' ,'Web Developer','2020-11-01')  
```
## Sources
1. [Proglib: Функции и хранимые процедуры в SQL: зачем нужны и как применять в реальных примерах](https://proglib.io/p/funkcii-i-hranimye-procedury-v-sql-zachem-nuzhny-i-kak-primenyat-v-realnyh-primerah-2022-10-07) [ru]
2. [How To Create And Use Procedure And Function In PostgreSQL](https://www.c-sharpcorner.com/article/how-to-create-and-use-procedure-and-function-postgresql/) [eng]