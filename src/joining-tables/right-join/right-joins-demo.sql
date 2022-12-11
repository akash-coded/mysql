-- The RIGHT JOIN starts selecting data from the right table (t2). It matches each row from the right table with every row from the left table. If both rows cause the join condition to evaluate to TRUE, the RIGHT JOIN combines columns of these rows into a new row and includes this new row in the result set.
-- If a row from the right table does not have a matching row from the left table, the RIGHT JOIN combines columns of rows from the right table with NULL values for all columns of the right table into a new row and includes this row in the result set.
-- In other words, the RIGHT JOIN returns all rows from the right table regardless of having matching rows from the left table or not.
-- It’s important to emphasize that RIGHT JOIN and LEFT JOIN clauses are functionally equivalent, and they can replace each other as long as the table order is reversed.
-- Notice that the RIGHT OUTER JOIN is a synonym for RIGHT JOIN. Therefore, you can use them interchangeably.
SELECT select_list
FROM t1
    RIGHT JOIN t2 ON join_condition;
-- If the join_condition uses the equal operator (=) and the joined columns of both tables have the same name, and you can use the USING syntax like this:
SELECT select_list
FROM t1
    RIGHT JOIN t2 USING(column_name);
-- This statement uses the RIGHT JOIN clause join the table customers with the table employees.
SELECT employeeNumber,
    customerNumber
FROM customers
    RIGHT JOIN employees ON salesRepEmployeeNumber = employeeNumber
ORDER BY employeeNumber;
-- The following statement uses the RIGHT JOIN clause to find employees who do not in charge of any customers:
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;
