DELIMITER / / CREATE PROCEDURE forLoopDemo() BEGIN
DECLARE x INT;
DECLARE str VARCHAR(255);
SET x = 0;
SET str = '';
loop_label: LOOP IF x > 5 THEN LEAVE loop_label;
END IF;
SET x = x + 1;
IF (x mod 2 = 0) THEN ITERATE loop_label;
ELSE
SET str = CONCAT(str, x, ', ');
END IF;
END LOOP;
SELECT str;
END / / DELIMITER;
CALL forLoopDemo();
DROP PROCEDURE forLoopDemo;