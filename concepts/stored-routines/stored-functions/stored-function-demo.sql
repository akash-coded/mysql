DELIMITER //

CREATE FUNCTION customerLevel(
    credit DECIMAL(10, 2)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
        SET customerLevel = 'PLATINUM';
    ELSEIF (credit <= 50000 AND credit >= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSE
        SET customerLevel = 'SILVER';
    END IF;

    RETURN customerLevel;
END //

DELIMITER ;

SELECT customerName, creditLimit, customerLevel(creditLimit)
FROM customers
ORDER BY customerName;

SHOW FUNCTION STATUS WHERE db = 'classicmodels';