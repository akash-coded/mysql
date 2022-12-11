CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);
CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);
INSERT INTO members(name)
VALUES('John'),
    ('Jane'),
    ('Mary'),
    ('David'),
    ('Amelia');
INSERT INTO committees(name)
VALUES('John'),
    ('Mary'),
    ('Amelia'),
    ('Joe');
SELECT *
FROM members;
SELECT *
FROM committees;
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    INNER JOIN committees c ON c.name = m.name;
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    INNER JOIN committees c USING(name);
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    LEFT JOIN committees c USING(name);
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    RIGHT JOIN committees c on c.name = m.name;
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    RIGHT JOIN committees c USING(name);
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;
SELECT m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members m
    CROSS JOIN committees c;