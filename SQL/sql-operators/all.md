The ALL operator:

- returns a boolean value as a result
- returns TRUE if ALL of the subquery values meet the condition
- is used with SELECT, WHERE and HAVING  

ALL means that the condition will be true only if the operation is true for all values in the range.

Structure in cause:
```
SELECT column_name(s)
FROM table_name
WHERE column_name operator ALL
  (SELECT column_name
  FROM table_name
  WHERE condition);
```
Example:
```
SELECT ALL ProductName
FROM Products
WHERE TRUE;
```
Structure in select:
```
SELECT ALL column_name(s)
FROM table_name
WHERE condition;
```
Example:
```
SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM OrderDetails
  WHERE Quantity = 10);
```