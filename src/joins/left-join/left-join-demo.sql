SELECT select_list
FROM t1
    LEFT JOIN t2 ON join_condition;
SELECT customers.customerNumber,
    customerName,
    orderNumber,
    status
FROM customers
    LEFT JOIN orders ON orders.customerNumber = customers.customerNumber;
SELECT c.customerNumber,
    customerName,
    orderNumber,
    status
FROM customers c
    LEFT JOIN orders o ON c.customerNumber = o.customerNumber;
SELECT customerNumber,
    customerName,
    orderNumber,
    status
FROM customers
    LEFT JOIN orders USING (customerNumber);
SELECT c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM customers c
    LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;
SELECT lastName,
    firstName,
    customerName,
    checkNumber,
    amount
FROM employees
    LEFT JOIN customers ON employeeNumber = salesRepEmployeeNumber
    LEFT JOIN payments ON payments.customerNumber = customers.customerNumber
ORDER BY customerName,
    checkNumber;
SELECT o.orderNumber,
    customerNumber,
    productCode
FROM orders o
    LEFT JOIN orderDetails USING (orderNumber)
WHERE orderNumber = 10123;
SELECT o.orderNumber,
    customerNumber,
    productCode
FROM orders o
    LEFT JOIN orderDetails d ON o.orderNumber = d.orderNumber
    AND o.orderNumber = 10123;