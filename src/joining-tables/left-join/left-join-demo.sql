-- The LEFT JOIN clause selects data starting from the left table (t1). It matches each row from the left table (t1) with every row from the right table(t2) based on the join_condition.
-- If the rows from both tables cause the join condition evaluates to true, the LEFT JOIN combine columns of rows from both tables to a new row and includes this new row in the result rows.
-- In case the row from the left table (t1) does not match with any row from the right table(t2), the LEFT JOIN still combines columns of rows from both tables into a new row and includes the new row in the result rows. However, it uses NULL for all the columns of the row from the right table.
-- In other words, LEFT JOIN returns all rows from the left table regardless of whether a row from the left table has a matching row from the right table or not.
-- If there is no match, the columns of the row from the right table will contain NULL.
SELECT select_list
FROM t1
    LEFT JOIN t2 ON join_condition;
-- Each customer can have zero or more orders while each order must belong to one customer.
-- This query uses the LEFT JOIN clause to find all customers and their orders:
SELECT customers.customerNumber,
    customerName,
    orderNumber,
    status
FROM customers
    LEFT JOIN orders ON orders.customerNumber = customers.customerNumber;
-- Alternatively, you can save some typing by using table aliases:
-- The LEFT JOIN clause returns all customers including the customers who have no order. If a customer has no order, the values in the column orderNumber and status are NULL.
SELECT c.customerNumber,
    customerName,
    orderNumber,
    status
FROM customers c
    LEFT JOIN orders o ON c.customerNumber = o.customerNumber;
-- Because both table customers and orders have the same column name ( customerNumber) in the join condition with the equal operator, you can use the USING syntax as follows:
SELECT customerNumber,
    customerName,
    orderNumber,
    status
FROM customers
    LEFT JOIN orders USING (customerNumber);
-- The LEFT JOIN clause is very useful when you want to find rows in a table that doesn’t have a matching row from another table.
-- The following example uses the LEFT JOIN to find customers who have no order:
SELECT c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM customers c
    LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NOT NULL;
-- This example uses two LEFT JOIN clauses to join the three tables: employees, customers, and payments.
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
-- This example used the LEFT JOIN clause to query data from the tables orders and  orderDetails. The query returns the order and its line items of the order number 10123.
SELECT o.orderNumber,
    customerNumber,
    productCode
FROM orders o
    LEFT JOIN orderDetails USING (orderNumber)
WHERE orderNumber = 10123;
-- However, if you move the condition from the WHERE clause to the ON clause, it will have a different meaning.
-- In this case, the query returns all orders but only the order 10123 will have line items associated with it as in the following picture:
SELECT o.orderNumber,
    customerNumber,
    productCode
FROM orders o
    LEFT JOIN orderDetails d ON o.orderNumber = d.orderNumber
    AND o.orderNumber = 10123;