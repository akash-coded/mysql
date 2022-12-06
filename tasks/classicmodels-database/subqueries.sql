-- 1. Write a query to find customers whose payments are greater than the average payment using a subquery.
SELECT customerNumber,
    checkNumber,
    amount
FROM payments
WHERE amount > (
        SELECT AVG(amount)
        FROM payments
    );
-- 2. Use a subquery with NOT IN operator to find the customers who have not placed any orders.
SELECT customerName
FROM customers
WHERE customerNumber NOT IN (
        SELECT DISTINCT customerNumber
        FROM orders
    );
-- 3. Write a subquery that finds the maximum, minimum, and average number of items in sale orders
SELECT MAX(items),
    MIN(items),
    FLOOR(AVG(items))
FROM (
        SELECT orderNumber,
            COUNT(orderNumber) AS items
        FROM orderdetails
        GROUP BY orderNumber
    ) AS lineitems;
-- 4. Use a correlated subquery to select products whose buy prices are greater than the average buy price of all products in each product line.
SELECT productname,
    buyprice
FROM products p1
WHERE buyprice > (
        SELECT AVG(buyprice)
        FROM products
        WHERE productline = p1.productline
    );
-- 5. Write a query that finds sales orders whose total values are greater than 60K.
SELECT orderNumber,
    SUM(priceEach * quantityOrdered) total
FROM orderdetails
    INNER JOIN orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;
-- 6. Use the query in question no. 5 as a correlated subquery to find customers who placed at least one sales order with the total value greater than 60K by using the `EXISTS` operator:
SELECT customerNumber,
    customerName
FROM customers
WHERE EXISTS(
        SELECT orderNumber,
            SUM(priceEach * quantityOrdered)
        FROM orderdetails
            INNER JOIN orders USING (orderNumber)
        WHERE customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000
    );
-- 7. Write a query that gets the top five products by sales revenue in 2003 from the orders and orderdetails tables
SELECT 
    productCode, 
    ROUND(SUM(quantityOrdered * priceEach)) sales
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;
-- 8. use the result of the previous query as a derived table called top5product2003 and join it with the products table using the productCode column.. Then, find out the productName and sales of the top 5 products in 2003.
SELECT 
    productName, sales
FROM
    (SELECT 
        productCode, 
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) top5products2003
INNER JOIN
    products USING (productCode);
-- 9. Suppose you have to label the customers who bought products in 2003 into 3 groups: platinum, gold, and silver with the following conditions:
-- Platinum customers who have orders with the volume greater than 100K.
-- Gold customers who have orders with the volume between 10K and 100K.
-- Silver customers who have orders with the volume less than 10K.
-- To form this query, you first need to put each customer into the respective group using CASE expression and GROUP BY
SELECT 
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY customerNumber;
-- 10.Use the previous query as the derived table to know the number of customers in each group: platinum, gold, and silver
SELECT 
    customerGroup, 
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;
  