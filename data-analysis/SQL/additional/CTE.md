The WITH clause in SQL was introduced in standard SQL to
simplify complex long queries, especially those with JOINs and
subqueries. Often interchangeably called CTE or subquery refactoring,
a WITH clause defines a temporary data set whose output is available
to be referenced in subsequent queries.

Structure:
```
--CTE
WITH expression_name_1 (column_1, column_2,…,column_n)
AS
(CTE query definition 1),
expression_name_2 (column_1, column_2,…,column_n)
AS
(CTE query definition 2)
 
--Final query using CTE
SELECT expression_A, expression_B, ...
FROM expression_name_2
```

Example:
```
--1st CTE
WITH cte_sales
AS
(SELECT
    EmployeeID,
    COUNT(OrderID) as Orders,
    ShipperID
FROM Orders
GROUP BY EmployeeID, ShipperID),
 
--2nd CTE (nested)
shipper_cte
AS
(SELECT *
FROM cte_sales
WHERE ShipperID=2 or ShipperID=3)
 
--Query using CTE
SELECT
    ShipperID, AVG(Orders) average_order_per_employee
FROM
shipper_cte
```

## Sources
1. [LearnSQL:Introduction to the SQL WITH Clause](https://learnsql.com/blog/what-is-with-clause-sql/) [eng]