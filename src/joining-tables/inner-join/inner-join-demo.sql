-- Active: 1647295028338@@127.0.0.1@3307@classicmodels
-- The INNER JOIN clause compares each row in the t1 table with every row in the t2 table based on the join condition.
SELECT select_list
FROM t1
    INNER JOIN t2 ON join_condition;
-- If rows from both tables cause the join condition to evaluate to TRUE, the INNER JOIN creates a new row whose columns contain all columns of rows from the tables and includes this new row in the result set. Otherwise, the INNER JOIN just ignores the rows.
-- In case no row between tables causes the join condition to evaluate to TRUE, the INNER JOIN returns an empty result set. This logic is also applied when you join more than 2 tables.
------------------------------------------------------------
-- Suppose you want to get:
-- The productCode and productName from the products table.
-- The textDescription of product lines from the productlines table.
-- To do this, you need to select data from both tables by matching rows based on values in the productline column using the INNER JOIN clause as follows:
SELECT productCode,
    productName,
    textDescription
FROM products t1
    INNER JOIN productlines t2 ON t1.productline = t2.productline;
-- Because the joined columns of both tables have the same name  productline, you can use the USING syntax:
SELECT productCode,
    productName,
    textDescription
FROM products
    INNER JOIN productlines USING (productline);
-- This query returns order number, order status, and total sales from the orders and orderdetails tables using the INNER JOIN clause with the GROUP BY clause:
SELECT t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM orders t1
    INNER JOIN orderdetails t2 ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;
-- Similarly, the following query uses the INNER JOIN with the USING syntax:
SELECT orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;
-- This query uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products:
SELECT orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
ORDER BY orderNumber,
    orderLineNumber;
-- This example uses three INNER JOIN clauses to query data from the four tables above:
SELECT orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
    INNER JOIN products USING (productCode)
    INNER JOIN customers USING (customerNumber)
ORDER BY orderNumber,
    orderLineNumber;
-- In addition to the equal operator (=), you can use other operators such as greater than ( >), less than ( <), and not-equal ( <>) operator to form the join condition.
-- The following query uses a less-than ( <) join to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
SELECT orderNumber,
    productName,
    msrp,
    priceEach
FROM products p
    INNER JOIN orderdetails o ON p.productcode = o.productcode
    AND p.msrp > o.priceEach
WHERE p.productcode = 'S10_1678';