DELIMITER $$

CREATE PROCEDURE findPlatinumOrNot(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20)
)
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$

DELIMITER ;

CALL findPlatinumOrNot(447, @level);
SELECT @level;