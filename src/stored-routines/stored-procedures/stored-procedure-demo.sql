DELIMITER / / CREATE PROCEDURE getAllProducts() BEGIN
SELECT *
FROM products
LIMIT 1;
SELECT *
FROM products
LIMIT 1, 1;
END / / DELIMITER;
CALL getAllProducts();
SHOW CREATE PROCEDURE getAllProducts;
SHOW PROCEDURE STATUS LIKE 'getAllProducts';