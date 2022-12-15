-- Suppose that you want to combine the first name and last name of employees and customers into a single result set, you can use the UNION operator as follows:
SELECT firstName,
    lastName
FROM employees
UNION
SELECT contactFirstName,
    contactLastName
FROM customers;
-- If you want to use other column headings, you need to use column aliases explicitly in the first SELECT statement as shown in the following example:
SELECT CONCAT(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName)
FROM customers;
-- If you want to sort the result set of a union, you use an ORDER BY clause in the last SELECT statement as shown in the following example:
SELECT concat(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT concat(contactFirstName, ' ', contactLastName)
FROM customers
ORDER BY fullname;
-- To differentiate between employees and customers, you can add a column as shown in the following query:
SELECT CONCAT(firstName, ' ', lastName) fullname,
    'Employee' as contactType
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName),
    'Customer' as contactType
FROM customers
ORDER BY fullname;
-- MySQL also provides you with an alternative option to sort a result set based on column position using ORDER BY clause as follows:
SELECT CONCAT(firstName, ' ', lastName) fullname
FROM employees
UNION
SELECT CONCAT(contactFirstName, ' ', contactLastName)
FROM customers
ORDER BY 1;