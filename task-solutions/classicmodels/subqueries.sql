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