# What are indexes?
Indexes are a powerful tool used in the background of a database to speed up querying. Indexes power queries by providing a method to quickly lookup the requested data.

Simply put, an index is a pointer to data in a table. An index in a database is very similar to an index in the back of a book.

# Why are indexes needed?

In a database, data is stored in rows which are organized into tables. Each row has a unique key which distinguishes it from all other rows and those keys are stored in an index for quick retrieval.

Since keys are stored in indexes, each time a new row with a unique key is added, the index is automatically updated. However, sometimes we need to be able to quickly lookup data that is not stored as a key. For example, we may need to quickly lookup customers by telephone number. It would not be a good idea to use a unique constraint because we can have multiple customers with the same phone number. In these cases, we can create our own indexes.

## Sources
1. [What is a Database Index?](https://www.codecademy.com/article/sql-indexes) [eng]
