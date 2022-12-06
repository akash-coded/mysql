DELIMITER //
CREATE PROCEDURE getTotalOrders()
BEGIN
        DECLARE totalOrders INT DEFAULT 0;

        SELECT COUNT(*) INTO totalOrders FROM orders;

        SELECT totalOrders;
END //
DELIMITER ;
CALL getTotalOrders();
DROP PROCEDURE getTotalOrders;
