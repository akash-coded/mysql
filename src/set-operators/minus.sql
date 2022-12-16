-- The MINUS operator is one of three set operators in the SQL standard that includes UNION, INTERSECT, and MINUS.
-- The MINUS compares the results of two queries and returns distinct rows from the result set of the first query that does not appear in the result set of the second query.
-- The basic rules for a query that uses MINUS operator are the following:
---- The number and order of columns in both select_list1 and select_list2 must be the same.
---- The data types of the corresponding columns in both queries must be compatible.
-- Suppose that we have two tables t1 and t2 with the following structure and data:
CREATE TABLE t1 (id INT PRIMARY KEY);
CREATE TABLE t2 (id INT PRIMARY KEY);
INSERT INTO t1
VALUES (1),
    (2),
    (3);
INSERT INTO t2
VALUES (2),
    (3),
    (4);
-- The following query returns distinct values from the query of the t1 table that is not found in the result of the query of the t2 table.
SELECT id
FROM t1
MINUS
SELECT id
FROM t2;
-- Note that some database systems e.g., Microsoft SQL Server and PostgreSQL use the EXCEPT instead of MINUS. They have the same function.
-- MySQL MINUS operator emulation
-- Unfortunately, MySQL does not support MINUS operator. However, you can use join to emulate it.
-- Syntax:
SELECT select_list
FROM table1
    LEFT JOIN table2 ON join_predicate
WHERE table2.column_name IS NULL;
-- For example, the following query uses the LEFT JOIN clause to return the same result as the MINUS operator:
SELECT id
FROM t1
    LEFT JOIN t2 USING (id)
WHERE t2.id IS NULL;