-- 1. Write a SQL statement to create a table countries including columns country_id, country_name, and region_id, and make sure that the combination of columns country_id and region_id will be unique.
CREATE TABLE IF NOT EXISTS countries (
    COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
    COUNTRY_NAME varchar(40) DEFAULT NULL,
    REGION_ID decimal(10, 0) NOT NULL,
    PRIMARY KEY (COUNTRY_ID, REGION_ID)
);
-- 2.