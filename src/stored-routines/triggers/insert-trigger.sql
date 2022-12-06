CREATE TRIGGER after_worker_update 
    AFTER UPDATE ON worker
    FOR EACH ROW 
UPDATE title
SET 
    worker_ref_id = NEW.worker_id
WHERE
    worker_ref_id = OLD.worker_id;


UPDATE worker 
SET 
    worker_id = 100,
WHERE
    first_name = 'Niharika';

