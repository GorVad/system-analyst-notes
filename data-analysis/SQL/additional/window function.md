# Description
A window function is an SQL function where the input values are taken from a "window" of one or more rows in the results set of a SELECT statement.
Window functions are distinguished from other SQL functions by the presence of an OVER clause. If a function has an OVER clause, then it is a window function. If it lacks an OVER clause, then it is an ordinary aggregate or scalar function. Window functions might also have a FILTER clause in between the function and the OVER clause.

# Syntax
## The PARTITION BY Clause
For the purpose of computing window functions, the result set of a query is divided into one or more "partitions". A partition consists of all rows that have the same value for all terms of the PARTITION BY clause in the window-defn. If there is no PARTITION BY clause, then the entire result set of the query is a single partition. Window-function processing is performed separately for each partition.
### Example
``````
-- The following SELECT statement returns:
-- 
--   c     | a | b | group_concat
---------------------------------
--   one   | 1 | A | A.D.G       
--   one   | 4 | D | D.G         
--   one   | 7 | G | G           
--   three | 3 | C | C.F         
--   three | 6 | F | F           
--   two   | 2 | B | B.E         
--   two   | 5 | E | E           
-- 

SELECT c, a, b, group_concat(b, '.') OVER (
  PARTITION BY c ORDER BY a RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
) AS group_concat
FROM t1 ORDER BY c, a;
``````

## Frame Specifications
The frame-spec determines which output rows are read by an aggregate window function. The frame-spec consists of four parts:

- A *frame type* - either ROWS, RANGE or GROUPS,
- A *starting frame* boundary,
- An *ending frame* boundary,
- An *EXCLUDE* clause.

Default frame-spec
``````
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS
``````
``````
-- The following SELECT statement returns:
-- 
--   a | b | c | group_concat
-----------------------------
--   1 | A | one   | A.D.G       
--   2 | B | two   | A.D.G.C.F.B.E
--   3 | C | three | A.D.G.C.F   
--   4 | D | one   | A.D.G       
--   5 | E | two   | A.D.G.C.F.B.E
--   6 | F | three | A.D.G.C.F   
--   7 | G | one   | A.D.G       
-- 

SELECT a, b, c,
       group_concat(b, '.') OVER (ORDER BY c) AS group_concat
FROM t1 ORDER BY a;
``````

### Frame Type
The frame type determines how the starting and ending boundaries of the frame are measured
#### ROWS
The ROWS frame type means that the starting and ending boundaries for the frame are determined by counting individual rows relative to the current row
#### GROUPS
The GROUPS frame type means that the starting and ending boundaries are determine by counting "groups" relative to the current group
#### RANGE
The RANGE frame type requires that the ORDER BY clause of the window have exactly one term

### Frame Boundaries
#### UNBOUNDED PRECEDING
The frame boundary is the first row in the partition.
#### expr PRECEDING
<expr> must be a non-negative constant numeric expression

- ROWS → The frame boundary is the row that is <expr> rows before the current row, or the first row of the partition if there are fewer than <expr> rows before the current row
- GROUPS → A "group" is a set of peer rows - rows that all have the same values for every term in the ORDER BY clause. The frame boundary is the group that is <expr> groups before the group containing the current row, or the first group of the partition if there are fewer than <expr> groups before the current row
- RANGE → For this form, the ORDER BY clause of the window-defn must have a single term
#### CURRENT ROW
The current row
#### expr FOLLOWING
This is the same as "<expr> PRECEDING" except that the boundary is <expr> units after the current rather than before the current row.
#### UNBOUNDED FOLLOWING
The frame boundary is the last row in the partition.
#### Example
``````
-- The following SELECT statement returns:
-- 
--   c     | a | b | group_concat
---------------------------------
--   one   | 1 | A | A.D.G.C.F.B.E
--   one   | 4 | D | D.G.C.F.B.E 
--   one   | 7 | G | G.C.F.B.E   
--   three | 3 | C | C.F.B.E     
--   three | 6 | F | F.B.E       
--   two   | 2 | B | B.E         
--   two   | 5 | E | E      
--
SELECT c, a, b, group_concat(b, '.') OVER (
  ORDER BY c, a ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
) AS group_concat
FROM t1 ORDER BY c, a;
``````
### The EXCLUDE Clause
#### EXCLUDE NO OTHERS
This is the default. In this case no rows are excluded from the window frame as defined by its starting and ending frame boundaries.
#### EXCLUDE CURRENT ROW
In this case the current row is excluded from the window frame. Peers of the current row remain in the frame for the GROUPS and RANGE frame types.
#### EXCLUDE GROUP
In this case the current row and all other rows that are peers of the current row are excluded from the frame. When processing an EXCLUDE clause, all rows with the same ORDER BY values, or all rows in the partition if there is no ORDER BY clause, are considered peers, even if the frame type is ROWS.
#### EXCLUDE TIES
In this case the current row is part of the frame, but peers of the current row are excluded.
#### Example
``````
-- The following SELECT statement returns:
-- 
--   c    | a | b | no_others     | current_row | grp       | ties
--  one   | 1 | A | A.D.G         | D.G         |           | A
--  one   | 4 | D | A.D.G         | A.G         |           | D
--  one   | 7 | G | A.D.G         | A.D         |           | G
--  three | 3 | C | A.D.G.C.F     | A.D.G.F     | A.D.G     | A.D.G.C
--  three | 6 | F | A.D.G.C.F     | A.D.G.C     | A.D.G     | A.D.G.F
--  two   | 2 | B | A.D.G.C.F.B.E | A.D.G.C.F.E | A.D.G.C.F | A.D.G.C.F.B
--  two   | 5 | E | A.D.G.C.F.B.E | A.D.G.C.F.B | A.D.G.C.F | A.D.G.C.F.E
-- 

SELECT c, a, b,
  group_concat(b, '.') OVER (
    ORDER BY c GROUPS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE NO OTHERS
  ) AS no_others,
  group_concat(b, '.') OVER (
    ORDER BY c GROUPS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE CURRENT ROW
  ) AS current_row,
  group_concat(b, '.') OVER (
    ORDER BY c GROUPS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE GROUP
  ) AS grp,
  group_concat(b, '.') OVER (
    ORDER BY c GROUPS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW EXCLUDE TIES
  ) AS ties
FROM t1 ORDER BY c, a;
``````

## The FILTER Clause
If a FILTER clause is provided, then only rows for which the expr is true are included in the window frame. The aggregate window still returns a value for every row, but those for which the FILTER expression evaluates to other than true are not included in the window frame for any row
### Example
``````
SELECT c, a, b, group_concat(b, '.') FILTER (WHERE c!='two') OVER (
  ORDER BY a
) AS group_concat
FROM t1 ORDER BY a;
``````

# Functions
## Aggregate
| Function | Description                        |
|----------|------------------------------------|
| AVG()    | Shows average value of the group   |
| COUNT()  | Shows count of values in the group |
| MAX()    | Shows maximum value in the group   |
| MIN()    | Shows minimum value in the group   |
| SUM()    | Shows sum of the group             |

### Example
```
select name, subject, grade,
sum(grade) over (partition by name) as sum_grade,
avg(grade) over (partition by name) as avg_grade,
count(grade) over (partition by name) as count_grade,
min(grade) over (partition by name) as min_grade,
max(grade) over (partition by name) as max_grade
from student_grades;
```

## Ranking
| Function     | Description                                                                                                |
|--------------|------------------------------------------------------------------------------------------------------------|
| RANK()       | The row_number() of the first peer in each group - the rank of the current row with gaps                   |
| DENSE_RANK() | The number of the current row's peer group within its partition - the rank of the current row without gaps |
| NTILE(N)     | Argument N is handled as an integer                                                                        |
| ROW_NUMBER() | The number of the row within the current partition                                                         |
| CUME_DIST()  | The cumulative distribution                                                                                |

### Example
```
-- The following SELECT statement returns:
-- 
--   a | row_number | rank | dense_rank | percent_rank | cume_dist
------------------------------------------------------------------
--   a |          1 |    1 |          1 |          0.0 |       0.5
--   a |          2 |    1 |          1 |          0.0 |       0.5
--   a |          3 |    1 |          1 |          0.0 |       0.5
--   b |          4 |    4 |          2 |          0.6 |       0.66
--   c |          5 |    5 |          3 |          0.8 |       1.0
--   c |          6 |    5 |          3 |          0.8 |       1.0
-- 
SELECT a                        AS a,
       row_number() OVER win    AS row_number,
       rank() OVER win          AS rank,
       dense_rank() OVER win    AS dense_rank,
       percent_rank() OVER win  AS percent_rank,
       cume_dist() OVER win     AS cume_dist
FROM t2
WINDOW win AS (ORDER BY a);
```
``````
-- The following SELECT statement returns:
-- 
--   a | b     | ntile_2 | ntile_4
----------------------------------
--   a | one   |       1 |       1
--   a | two   |       1 |       1
--   a | three |       1 |       2
--   b | four  |       2 |       2
--   c | five  |       2 |       3
--   c | six   |       2 |       4
-- 
SELECT a                        AS a,
       b                        AS b,
       ntile(2) OVER win        AS ntile_2,
       ntile(4) OVER win        AS ntile_4
FROM t2
WINDOW win AS (ORDER BY a);
``````

## Value
| Function                                          | Description                                                                                                                                                                                                                                                                                                                                                                                                                     |
|---------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| FIRST_VALUE(expr)                                 | This built-in window function calculates the window frame for each row in the same way as an aggregate window function. It returns the value of expr evaluated against the first row in the window frame for each row.                                                                                                                                                                                                          |
| LAST_VALUE(expr)                                  | This built-in window function calculates the window frame for each row in the same way as an aggregate window function. It returns the value of expr evaluated against the last row in the window frame for each row.                                                                                                                                                                                                           |
| LAG(expr, offset (optional), default (optional))  | The first form of the lag() function returns the result of evaluating expression expr against the previous row in the partition. If the offset argument is provided, then it must be a non-negative integer. If default is also provided, then it is returned instead of NULL if the row identified by offset does not exist                                                                                                    |
| LEAD(expr, offset (optional), default (optional)) | The first form of the lead() function returns the result of evaluating expression expr against the next row in the partition. If the offset argument is provided, then it must be a non-negative integer. If default is also provided, then it is returned instead of NULL if the row identified by offset does not exist.                                                                                                      |
| NTH_VALUE(expr, N)                                | This built-in window function calculates the window frame for each row in the same way as an aggregate window function. It returns the value of expr evaluated against the row N of the window frame. Rows are numbered within the window frame starting from 1 in the order defined by the ORDER BY clause if one is present, or in arbitrary order otherwise. If there is no Nth row in the partition, then NULL is returned. |

### Example
```
-- The following SELECT statement returns:
-- 
--   b | lead | lag  | first_value | last_value | nth_value_3
-------------------------------------------------------------
--   A | C    | NULL | A           | A          | NULL       
--   B | D    | A    | A           | B          | NULL       
--   C | E    | B    | A           | C          | C          
--   D | F    | C    | A           | D          | C          
--   E | G    | D    | A           | E          | C          
--   F | n/a  | E    | A           | F          | C          
--   G | n/a  | F    | A           | G          | C          
-- 
SELECT b                          AS b,
       lead(b, 2, 'n/a') OVER win AS lead,
       lag(b) OVER win            AS lag,
       first_value(b) OVER win    AS first_value,
       last_value(b) OVER win     AS last_value,
       nth_value(b, 3) OVER win   AS nth_value_3
FROM t1
WINDOW win AS (ORDER BY b ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
```

## Sources
1. [Хабр: Оконные функции SQL простым языком с примерами](https://habr.com/ru/articles/664000/) [ru]
2. [SQLite: Window Functions](https://www.sqlite.org/windowfunctions.html) [eng]
3. [ROWS vs RANGE vs GROUPS](https://data-xtractor.com/blog/query-builder/window-function-framing-rows-vs-range-vs-groups/)
4. [When Do I Use SQL Window Functions?](https://learnsql.com/blog/when-to-use-sql-window-functions/) [eng]