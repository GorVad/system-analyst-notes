# What is it?
You often need to check the performance of a PostgreSQL query you just wrote to look for some way to improve performance. In order to do this, you need a report of the query execution, which is called the execution plan). The query execution plan gives you the entire summary of the query execution with the detailed report of time taken at each step and cost incurred to finish it.

## Base syntax 
```
EXPLAIN [ ( OPTION [, ...] ) ] YOUR_SQL_QUERY;
```

# EXPLAIN Options
## ANALYZE 
When you use the EXPLAIN keyword, your PostgreSQL query  is executed first. Once the query has been successfully executed, all the the run time statistics, including the total time elapsed against every plan node and the total number of rows the query fetched, is returned. The ANALYZE keyword will actually execute the query in real time to collect and prepare the execution plan.
```
EXPLAIN ANALYZE YOUR_SQL_QUERY;
```
## VERBOSE
This keyword will show additional information regarding the query execution plan.
```
EXPLAIN (VERBOSE TRUE) YOUR_SQL_QUERY;
```
## COSTS 
The COSTS option will return a cost value to each step in the query. The estimates made are arbitrary values that are assigned to each step in any query execution based on the expected resource load it may create.
This keyword will show additional information regarding the query execution plan.
```
EXPLAIN YOUR_SQL_QUERY;
```
## BUFFERS 
The BUFFERS keyword is one of the most interesting one to check in the query execution plan. It basically comprises of 2 parts - the shared read and the shared hit. Shared read is the number of blocks the PostgreSQL reads from the disk. Shared hit is the number of blocks the PostgreSQL reads from it's cache. The PostgreSQL maintains it's own cache. It's kind of a memory for the earlier queries it ran. So every time you run a query, the PostgreSQL first looks in it's cache and if needed, it reads from the disk.

This keyword has a dependency on the ANALYZE keyword and can only be used when the ANALYZE keyword is used.
```
EXPLAIN (ANALYZE, BUFFERS) YOUR_SQL_QUERY;
```
## TIMING 
The TIMING  keyword details out the startup time and the execution time taken at each node. TRUE is the default value for it. ANALYZE keyword should be used to use this keyword.
```
EXPLAIN (ANALYZE, TIMING) YOUR_SQL_QUERY;
```
## SUMMARY 
This keyword adds the summary information to the execution query plan. You should use it with the ANALYZE keyword.
```
EXPLAIN (ANALYZE, SUMMARY) YOUR_SQL_QUERY;
```
## FORMAT 
This keyword is of much interest if you need to prepare a report to showcase the query performance or you need to capture the details of the query execution plan for future reference. You need to specify the format in which you want the result. TEXT is the default value. The other choices are: XML, JSON and YAML.
```
EXPLAIN (FORMAR FORMAT_NEEDED) YOUR_SQL_QUERY;
```

# What is Hints?
Postgres Pro Enterprise uses cost-based optimizer, which utilizes data statistics, not static rules. The planner (optimizer) estimates costs of each possible execution plans for a SQL statement then the execution plan with the lowest cost finally be executed. The planner does its best to select the best execution plan, but not perfect, since it doesn't count some properties of the data, for example, correlation between columns.

pg_hint_plan makes it possible to tweak execution plans using so-called “hints”, which are simple descriptions in the SQL comment of special form.

## Table scan hints
- SeqScan (table name)
- TidScan (table name)
- IndexScan (table name [index name])
- IndexOnlyScan (table name [index name])
- BitmapScan (table name [index name])
- NoSeqScan (table name)
- NoTidScan (table name)
- NoIndexScan (table name)
- NoIndexOnlyScan (table name)
- NoBitmapScan (table name)

## Join scan hints
- NestLoop (table name list)
- HashJoin (table name list)
- MergeJoin (table name list)
- NoNestLoop (table name list)
- NoHashJoin (table name list)
- NoMergeJoin (table name list)


# Sources
1. [Getting a Query Execution Plan in PostgreSQL](https://www.sqlservercentral.com/articles/getting-a-query-execution-plan-in-postgresql) (eng)
2. [Получение плана выполнения запроса в PostgreSQL](https://sql-ex.ru/blogs/?/Poluchenie_plana_vypolneniJa_zaprosa_v_PostgreSQL.html&ysclid=li1qwx4nzh235623703) (rus)
3. [Habr: Хинты планера в PostgreSQL](https://habr.com/ru/articles/169751/) (rus)
4. [PostgressPro:pg_hint_plan](https://postgrespro.com/docs/enterprise/10/pg-hint-plan.html) (eng)