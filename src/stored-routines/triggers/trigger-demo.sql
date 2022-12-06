USE org;

DELIMITER //

CREATE TRIGGER after_worker_insert
    AFTER INSERT
    ON worker
    FOR EACH ROW
BEGIN
        INSERT INTO title
            VALUES (
                NEW.worker_id, "New Joinee", NOW()
            );
END //

INSERT INTO worker
    VALUES (
        9, 'Akash', 'Das', 1000, NOW(), 'Account'
    );

SHOW TRIGGERS;

DROP TRIGGER IF EXISTS after_worker_insert;