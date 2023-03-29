-- Active: 1647295028338@@127.0.0.1@3307@classicmodels
DELIMITER / / CREATE PROCEDURE getCustomerLevel(
    IN pCutomerNumber INT,
    OUT pCustomerLevel VARCHAR(20)
) BEGIN
DECLARE credit DECIMAL(10, 2) DEFAULT 0;
SELECT creditLimit INTO credit
FROM customers
WHERE customerNumber = pCutomerNumber;
IF credit > 50000 THEN
SET pCustomerLevel = 'PLATINUM';
ELSEIF credit <= 50000
AND credit > 10000 THEN
SET pCustomerLevel = 'GOLD';
ELSE
SET pCustomerLevel = 'SILVER';
END IF;
END / / DELIMITER;
CALL getCustomerLevel(125, @level);
SELECT @level;
DROP PROCEDURE getCustomerLevel;
SELECT customerNumber,
    creditLimit
FROM customers
WHERE creditLimit > 50000
ORDER BY creditLimit DESC;