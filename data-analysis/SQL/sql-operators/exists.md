The EXISTS operator is used to test for the existence of any record in a 
subquery.
The EXISTS operator returns TRUE if the subquery returns one or more records.

Structure:
```
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);
```
Example:
```
SELECT SupplierName
FROM Suppliers
WHERE EXISTS 
            (SELECT ProductName 
            FROM Products 
            WHERE Products.SupplierID = Suppliers.supplierID 
            AND Price < 20);
```

## Sources
1. [W3Schools:SQL EXISTS Operator](https://www.w3schools.com/sql/sql_exists.asp) [eng]