-- The GROUP BY clause groups a set of rows into a set of summary rows by values of columns or expressions. The GROUP BY clause returns one row for each group. In other words, it reduces the number of rows in the result set.
-- The GROUP BY clause is an optional clause of the SELECT statement. The following illustrates the GROUP BY clause syntax:
SELECT c1,
    c2,
...,
    cn,
    aggregate_function(ci)
FROM table
WHERE where_conditions
GROUP BY c1,
    c2,
...,
    cn;
-- MySQL evaluates the GROUP BY clause after the FROM and WHERE clauses and before the HAVING, SELECT, DISTINCT, ORDER BY and LIMIT clauses:
-- In practice, you often use the GROUP BY clause with aggregate functions such as SUM, AVG, MAX, MIN, and COUNT. The aggregate function that appears in the SELECT clause provides the information of each group.
--------------------------------------------------------------------------------
-- Suppose you want to group values of the order’s status into subgroups, you use the GROUP BY clause with the status column as the following query:
SELECT status
FROM orders
GROUP BY status;
-- As you can see clearly from the output, the GROUP BY clause returns unique occurrences of status values. It works like the DISTINCT operator as shown in the following query:
SELECT DISTINCT status
FROM orders;
-- For example, if you want to know the number of orders in each status, you can use the COUNT function with the GROUP BY clause as follows:
SELECT status,
    COUNT(*)
FROM orders
GROUP BY status;
-- To get the total amount of all orders by status, you join the orders table with the orderdetails table and use the SUM function to calculate the total amount. See the following query:
SELECT status,
    SUM(quantityOrdered * priceEach) AS amount
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY status;
-- Similarly, the following query returns the order numbers and the total amount of each order.
SELECT orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM orderdetails
GROUP BY orderNumber;
-- In addition to columns, you can group rows by expressions. The following query gets the total sales for each year.
SELECT YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
WHERE status = 'Shipped'
GROUP BY YEAR(orderDate);
-- To filter the groups returned by GROUP BY clause, you use a  HAVING clause. The following query uses the HAVING clause to select the total sales of the years after 2003.
SELECT YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
WHERE status = 'Shipped'
    AND YEAR(orderDate) > 2003
GROUP BY year;
-- The following query extracts the year from the order date. It first uses the year as an alias of the expression YEAR(orderDate) and then uses the year alias in the GROUP BY clause.
SELECT YEAR(orderDate) AS year,
    COUNT(orderNumber)
FROM orders
GROUP BY year;
-- If you use the GROUP BY clause in the SELECT statement without using aggregate functions, the GROUP BY clause behaves like the DISTINCT clause.
-- The following statement uses the GROUP BY clause to select the unique states of customers from the customers table.
SELECT state
FROM customers
GROUP BY state;
-- You can achieve a similar result by using the DISTINCT clause:
SELECT DISTINCT state
FROM customers;
-- Generally speaking, the DISTINCT clause is a special case of the GROUP BY clause. The difference between DISTINCT clause and GROUP BY clause is that the GROUP BY clause sorts the result set, whereas the DISTINCT clause does not.
-- Notice that MySQL 8.0 removed the implicit sorting for the GROUP BY clause. Therefore, if you use MySQL 8.0+, you will find that the result set of the above query with the GROUP BY clause is not sorted.