DELIMITER $$

CREATE PROCEDURE getDeliveryStatus(
	IN pOrderNumber INT,
    OUT pDeliveryStatus VARCHAR(100)
)
BEGIN
	DECLARE waitingDay INT DEFAULT 0;
    SELECT 
		DATEDIFF(requiredDate, shippedDate)
	INTO waitingDay
	FROM orders
    WHERE orderNumber = pOrderNumber;
    
    CASE 
		WHEN waitingDay = 0 THEN 
			SET pDeliveryStatus = 'On Time';
        WHEN waitingDay >= 1 AND waitingDay < 5 THEN
			SET pDeliveryStatus = 'Late';
		WHEN waitingDay >= 5 THEN
			SET pDeliveryStatus = 'Very Late';
		ELSE
			SET pDeliveryStatus = 'No Information';
	END CASE;	
END $$

DELIMITER ;

CALL getDeliveryStatus(10100,@delivery);

SELECT @delivery;