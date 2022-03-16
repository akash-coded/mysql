DELIMITER //

CREATE PROCEDURE whileLoopDemo()
BEGIN
        DECLARE x INT;
        DECLARE str VARCHAR(255);

        SET x = 0;
        SET str = '';

        WHILE x <= 5 DO
                SET x = x + 1;
                IF (x mod 2 <> 0) THEN
                        SET str = CONCAT(str, x, ', ');                        
                END IF;
        END WHILE;

        SELECT str;
END //

DELIMITER ;

CALL whileLoopDemo();

DROP PROCEDURE whileLoopDemo;