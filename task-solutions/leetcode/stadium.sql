-- Simple Approach using JOINS
SELECT id,
    date1,
    people
FROM stadium a
WHERE people >= 100
    AND (
        SELECT people
        FROM stadium b
        WHERE b.id = a.id + 1
    ) >= 100
    AND (
        SELECT people
        FROM stadium c
        WHERE c.id = a.id + 2
    ) >= 100
    OR people >= 100
    AND (
        SELECT people
        FROM stadium e
        WHERE e.id = a.id - 1
    ) >= 100
    AND (
        SELECT people
        FROM stadium f
        WHERE f.id = a.id + 1
    ) >= 100
    OR people >= 100
    AND (
        SELECT people
        FROM stadium g
        WHERE g.id = a.id - 1
    ) >= 100
    AND (
        SELECT people
        FROM stadium h
        WHERE h.id = a.id - 2
    ) >= 100
order by id;
-- Alternatively, using COUNT
SELECT DISTINCT SS.*
FROM STADIUM SS
    INNER JOIN (
        SELECT S1.ID
        FROM STADIUM S1
        WHERE 3 = (
                SELECT COUNT(1)
                FROM STADIUM S2
                WHERE (
                        S2.ID = S1.ID
                        OR S2.ID = S1.ID + 1
                        OR S2.ID = S1.ID + 2
                    )
                    AND S2.PEOPLE >= 100
            )
    ) AS SS2 ON SS.ID >= SS2.ID
    AND SS.ID < SS2.ID + 3