-- To get the whole organization structure, you can join the employees table to itself using the employeeNumber and reportsTo columns. The table employees has two roles: one is the Manager and the other is Direct Reports.
SELECT CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM employees e
    INNER JOIN employees m ON m.employeeNumber = e.reportsTo
ORDER BY Manager;
-- The President is the employee who does not have any manager or value in the reportsTo column is NULL. The following statement uses the LEFT JOIN clause instead of INNER JOIN to include the President:
SELECT IFNULL(
        CONCAT(m.lastname, ', ', m.firstname),
        'Top Manager'
    ) AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM employees e
    LEFT JOIN employees m ON m.employeeNumber = e.reportsto
ORDER BY manager DESC;
-- By using the MySQL self join, you can display a list of customers who locate in the same city by joining the customers table to itself. In this example, the table customers is joined to itself using the following join conditions:
-- c1.city = c2.city makes sure that both customers have the same city.c.customerName > c2.customerName ensures that no same customer is included.
SELECT c1.city,
    c1.customerName,
    c2.customerName
FROM customers c1
    INNER JOIN customers c2 ON c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY c1.city;