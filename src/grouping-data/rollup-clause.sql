-- MySQL ROLLUP clause is used to generate subtotals and grand totals.
-- The following statement creates a new table named sales that stores the order values summarized by product lines and years.
CREATE TABLE sales;
SELECT productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM orderDetails
    INNER JOIN orders USING (orderNumber)
    INNER JOIN products USING (productCode)
GROUP BY productLine,
    YEAR(orderDate);
------------------------------------------------------------
SELECT *
FROM sales;
------------------------------------------------------------
-- A grouping set is a set of columns to which you want to group. For example, the following query creates a grouping set denoted by (productline)
SELECT productline,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productline;
-- The following query creates an empty grouping set denoted by the ():
SELECT SUM(orderValue) totalOrderValue
FROM sales;
-- If you want to generate two or more grouping sets together in one query, you may use the UNION ALL operator as follows:
SELECT productline,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productline
UNION ALL
SELECT NULL,
    SUM(orderValue) totalOrderValue
FROM sales;
-- Because the UNION ALL requires all queries to have the same number of columns, we added NULL in the select list of the second query to fulfill this requirement.
-- The NULL in the productLine column identifies the grand total super-aggregate line.
-- This query is able to generate the total order values by product lines and also the grand total row. However, it has two problems:
---- The query is quite lengthy.
---- The performance of the query may not be good since the database engine has to internally execute two separate queries and combine the result sets into one.
------------------------------------------------------------
-- To fix these issues, you can use the ROLLUP clause.
-- The ROLLUP clause is an extension of the GROUP BY clause with the following syntax:
SELECT select_list
FROM table_name
GROUP BY c1,
    c2,
    c3 WITH ROLLUP;
-- The ROLLUP generates multiple grouping sets based on the columns or expressions specified in the GROUP BY clause. For example:
SELECT productLine,
    SUM(orderValue) totalOrderValue
FROM sales
GROUP BY productline WITH ROLLUP;
-- The ROLLUP clause generates not only the subtotals but also the grand total of the order values.