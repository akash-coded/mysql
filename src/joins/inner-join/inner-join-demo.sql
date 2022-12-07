SELECT select_list
FROM t1
    INNER JOIN t2 ON join_condition;
SELECT productCode,
    productName,
    textDescription
FROM products t1
    INNER JOIN productlines t2 ON t1.productline = t2.productline;
SELECT productCode,
    productName,
    textDescription
FROM products
    INNER JOIN productlines USING (productline);
SELECT t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM orders t1
    INNER JOIN orderdetails t2 ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;
SELECT orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM orders
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;
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
SELECT orderNumber,
    productName,
    msrp,
    priceEach
FROM products p
    INNER JOIN orderdetails o ON p.productcode = o.productcode
    AND p.msrp > o.priceEach
WHERE p.productcode = 'S10_1678';