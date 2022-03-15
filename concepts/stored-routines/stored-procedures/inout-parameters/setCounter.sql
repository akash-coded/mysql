DELIMITER //
CREATE PROCEDURE setCounter(
        INOUT counter INT,
        IN step INT
)
BEGIN
        SET counter = counter + step;
END //
DELIMITER ;
SET @myCounter = 1;
CALL setCounter(@myCounter, 2);
CALL setCounter(@myCounter, 3);
CALL setCounter(@myCounter, 4);
SELECT @myCounter;