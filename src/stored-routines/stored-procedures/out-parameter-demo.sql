DELIMITER //
CREATE PROCEDURE getOrderCountByStatus(
        IN orderStatus VARCHAR(255),
        OUT total INT
)
BEGIN
        SELECT COUNT(orderNumber) INTO total 
        FROM orders 
        WHERE status = orderStatus;
END //
DELIMITER ;
CALL getOrderCountByStatus('Shipped', @total);
SELECT @total;
CALL getOrderCountByStatus('Cancelled', @total_cancelled);
SELECT @total_cancelled;
CALL getOrderCountByStatus('in process', @total_in_process);
SELECT @total_in_process AS orders_in_progress;