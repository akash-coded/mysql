DELIMITER $$

CREATE PROCEDURE labelCustomerPlatinum(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20)
)
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END $$

DELIMITER ;

CALL labelCustomerPlatinum(141, @level);

SELECT @level;