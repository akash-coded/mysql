DELIMITER //
CREATE PROCEDURE getAllProducts()
BEGIN
        SELECT * FROM products;
END //
DELIMITER ;
CALL getAllProducts();