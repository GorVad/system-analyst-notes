# About 
IMPALA is an open-source parallel processing query engine designed on top of clustered systems(HDFS for an example) written in C++ and java for processing of large volume of data with SQL interactions. It has interactive SQL like queries where we can fetch and work on data as needed.

# Architecture
![Alt text](data-img\impala-architecture-image.webp)

## Client
We can have many entities to interact with IMPALA such as JDBC/ODBC Client, impala-shell, Hue, these are the client for IMPALA.

## Hive Meta Store
To store information about the data available we use Hive MetaStore. It just lets impala know about the databases available and the structure for these databases.

## Daemons
It is the core part of IMPALA that runs on each node of a cluster. So basically daemons are installed on every data node. Daemons read data from HDFS / HBASE and accept queries from Hue or any Data Analytics tools via the connection. Once that is done it distributes work across the cluster and parallelizes the query.
The job launching node is called as the Coordinator Node. The daemons submit the results to these coordinator nodes only and further, the result is prepared. A query plan is made that parses the Query, a single plan is made first that is further distributed afterward. Then the Coordinator is responsible for executing the entire Query.

## StateStore Daemons
For keeping track of the daemons that are running and to report the point of failure (if any), these Daemons are used. Basically they are responsible for keeping track of the active daemons available. Only one node in the cluster needs to have this installed and working. The impala daemons continuously communicate with the State Store Daemons to confirm their health and accept the new work.

## Catalog Daemons
Catalog Daemons basically distributes the metadata information to the impala daemons and checks communicate any changes over Metadata that come over from the queries to the Impala Daemons.

## HBASE and HDFS
These are basically the storage level for the data. So basically whenever a query after planning and optimization is run over impala they come over here for data handling.

# Features
- **Faster Access**: It is comparatively much faster for SQL Queries and data processing.
- **Storage System**: Has the capability to access HDFS and HBASE as its storage system.
- **In-Memory Processing**: the data are present in memory that makes the query optimization faster and easy.
- **Secured**: It offers Kerberos Authentication making it secure.
- **Multi API Supports**: Its supports multiple API that helps it for the connection with the data sources.
- **Easily Connected**: It is easy to connect over many data visualization engines such as TABLEAU, etc.
- **Built-in Functions**: Impala comes over with several built-in Functions with which we can go over with the results we need. Some of the built-in function IMPALA supports are abs,concat, power, adddate, date_add, dayofweek, nvl, zeroifnull.

# Advantages and Disadvantages
## Advantages
- All the basic features we look over as high speed, in-memory computation all comes over as an advantage that focuses the benefits of having IMPALA.

## Disadvantages
- Refreshing every time on the metadata change. On every change in metadata or tables, we have to refresh the content that makes the changes visible in the hive.
- We can only read a text file in impala there is no scope for reading the binary files.
- We cannot update or delete individual records in impala.

# Source
1. [What is Impala?](https://www.educba.com/what-is-impala/) [eng]