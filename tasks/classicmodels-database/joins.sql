-- 1. Write a query to display a list of customers who locate in the same city by joining the customers table to itself.
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;

-- 2. Write a query to get:
-- The productCode and productName from the products table.
-- The textDescription of product lines from the productlines table.
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;

-- 3. Write a query that returns order number, order status, and total sales from the orders and orderdetails.
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

-- 4. Write a query to fetch the complete details of orders from the orders, orderDetails, and products table, and sort them by orderNumber and orderLineNumber.
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- 5. Write a query to perform INNER JOIN of four tables and display the details sorted by orderNumber, orderLineNumber as per the following.
SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- 6. Write a query to find the sales price of the product whose code is S10_1678 that is less than the manufacturer’s suggested retail price (MSRP) for that product.
SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';

-- 7. Each customer can have zero or more orders while each order must belong to one customer. Write a query to find all the customers and their orders.
SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;

-- 8. Write a query that uses the LEFT JOIN to find customers who have no order.
SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;