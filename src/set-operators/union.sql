-- MySQL UNION operator allows you to combine two or more result sets of queries into a single result set. 
-- Syntax:
SELECT column_list
UNION
[DISTINCT | ALL]
SELECT column_list
UNION
[DISTINCT | ALL]
SELECT column_list...;
-- By default, the UNION operator removes duplicate rows even if you don’t specify the DISTINCT operator explicitly.
-- To combine result set of two or more queries using the UNION operator, these are the basic rules that you must follow:
---- First, the number and the orders of columns that appear in all SELECT statements must be the same.
---- Second, the data types of columns must be the same or compatible.
-- Let’s see the following sample tables: t1 and t2:
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
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
-- The following statement combines result sets returned from t1 and t2 tables:
SELECT id
FROM t1
UNION
SELECT id
FROM t2;
-- If you use the UNION ALL explicitly, the duplicate rows, if available, remain in the result. Because UNION ALL does not need to handle duplicates, it performs faster than UNION DISTINCT
SELECT id
FROM t1
UNION ALL
SELECT id
FROM t2;
-- UNION vs. JOIN: A JOIN combines result sets horizontally, a UNION appends result set vertically.
-- Suppose that you want to combine the first name and last name of employees and customers into a single result set, you can use the UNION operator as follows:
SELECT firstName,
    lastName
FROM employees
UNION
SELECT contactFirstName,
    contactLastName
FROM customers;
-- If you want to use other column headings, you need to use column aliases explicitly in the first SELECT statement as shown in the following example:
SELECT CONCAT(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName)
FROM customers;
-- If you want to sort the result set of a union, you use an ORDER BY clause in the last SELECT statement as shown in the following example:
SELECT concat(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT concat(contactFirstName, ' ', contactLastName)
FROM customers
ORDER BY fullname;
-- To differentiate between employees and customers, you can add a column as shown in the following query:
SELECT CONCAT(firstName, ' ', lastName) fullname,
    'Employee' as contactType
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName),
    'Customer' as contactType
FROM customers
ORDER BY fullname;
-- MySQL also provides you with an alternative option to sort a result set based on column position using ORDER BY clause as follows:
SELECT CONCAT(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName)
FROM customers
ORDER BY 1;