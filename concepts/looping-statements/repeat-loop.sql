DELIMITER //

CREATE PROCEDURE repeatLoopDemo()
BEGIN
        DECLARE x INT;
        DECLARE str VARCHAR(255);

        SET x = 0;
        SET str = '';

        REPEAT
                SET x = x + 1;
                IF (x mod 2 <> 0) THEN
                        SET str = CONCAT(str, x, ', ');                        
                END IF;
        UNTIL x > 5
        END REPEAT;

        SELECT str;
END //

DELIMITER ;

CALL repeatLoopDemo();

DROP PROCEDURE repeatLoopDemo;