-- The INTERSECT operator compares the result sets of two queries and returns the distinct rows that are output by both queries.
-- Syntax:
(
    SELECT column_list
    FROM table_1
)
INTERSECT
(
    SELECT column_list
    FROM table_2
);
-- The INTERSECT operator compares the result sets of two queries and returns the distinct rows that are output by both queries.
-- To use the INTERSECT operator for two queries, you follow these rules:
---- The order and the number of columns in the select list of the queries must be the same.
---- The data types of the corresponding columns must be compatible.
-- Note that the SQL standard has three set operators that include UNION, INTERSECT, and MINUS.
-- Emulating INTERSECT in MySQL
-- Unfortunately, MySQL does not support the INTERSECT operator. However, you can emulate the INTERSECT operator.
-- The following statements create tables t1 and t2, and then insert data into both tables.
CREATE TABLE t1 (id INT PRIMARY KEY);
CREATE TABLE t2 LIKE t1;
INSERT INTO t1(id)
VALUES(1),
    (2),
    (3);
INSERT INTO t2(id)
VALUES(2),
    (3),
    (4);
-- The following query returns rows from the t1 table.
SELECT id
FROM t1;
-- The following query returns the rows from the t2 table:
SELECT id
FROM t2;
-- 1) Emulate INTERSECT using DISTINCT and INNER JOIN clause
-- The following statement uses DISTINCT operator and INNER JOIN clause to return the distinct rows in both tables:
SELECT DISTINCT id
FROM t1
    INNER JOIN t2 USING(id);
-- How it works:
---- The INNER JOIN clause returns rows from both left and right tables.
---- The DISTINCT operator removes the duplicate rows.
-- 2) Emulate INTERSECT using IN and subquery
-- The following statement uses the IN operator and a subquery to return the intersection of the two result sets.
SELECT DISTINCT id
FROM t1
WHERE id IN (
        SELECT id
        FROM t2
    );
-- How it works:
---- The subquery returns the first result set.
---- The outer query uses the IN operator to select only values that exist in the first result set. The DISTINCT operator ensures that only distinct values are selected.