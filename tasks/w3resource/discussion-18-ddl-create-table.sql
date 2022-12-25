-- 1. Write a SQL statement to create a table countries including columns country_id, country_name, and region_id, and make sure that the combination of columns country_id and region_id will be unique.
CREATE TABLE IF NOT EXISTS countries (
    COUNTRY_ID varchar(2) NOT NULL UNIQUE DEFAULT '',
    COUNTRY_NAME varchar(40) DEFAULT NULL,
    REGION_ID decimal(10, 0) NOT NULL,
    PRIMARY KEY (COUNTRY_ID, REGION_ID)
);
-- 2. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE IF NOT EXISTS jobs (
    JOB_ID varchar(10) NOT NULL UNIQUE,
    JOB_TITLE varchar(35) NOT NULL DEFAULT ' ',
    MIN_SALARY decimal(6, 0) DEFAULT 8000,
    MAX_SALARY decimal(6, 0) DEFAULT NULL
);
-- 3. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.
-- Here is the structure of the table jobs;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | JOB_ID     | varchar(10)  | NO   | PRI |         |       |
-- | JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
-- | MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- | MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
CREATE TABLE job_history (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    START_DATE date NOT NULL,
    END_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    DEPARTMENT_ID decimal(4, 0) DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
) ENGINE = InnoDB;
-- 4. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.
-- Assume the structure of departments table below.
-- +-----------------+--------------+------+-----+---------+-------+
-- | Field           | Type         | Null | Key | Default | Extra |
-- +-----------------+--------------+------+-----+---------+-------+
-- | DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
-- | DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
-- | MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
-- | LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
-- +-----------------+--------------+------+-----+---------+-------+
CREATE TABLE IF NOT EXISTS employees (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) NOT NULL,
    LAST_NAME varchar(25) DEFAULT NULL,
    EMAIL varchar(25) NOT NULL,
    PHONE_NUMBER varchar(20) DEFAULT NULL,
    HIRE_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    SALARY decimal(8, 2) DEFAULT NULL,
    COMMISSION_PCT decimal(2, 2) DEFAULT NULL,
    MANAGER_ID decimal(6, 0) DEFAULT NULL,
    DEPARTMENT_ID decimal(4, 0) DEFAULT NULL,
    FOREIGN KEY(DEPARTMENT_ID, MANAGER_ID) REFERENCES departments(DEPARTMENT_ID, MANAGER_ID)
) ENGINE = InnoDB;
-- 5. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.
-- "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual effect, and serves only as a memo or comment to you that the column which you are currently defining is intended to refer to a column in another table." - Reference dev.mysql.com
-- Assume that the structure of two tables departments and jobs.
-- +-----------------+--------------+------+-----+---------+-------+
-- | Field           | Type         | Null | Key | Default | Extra |
-- +-----------------+--------------+------+-----+---------+-------+
-- | DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
-- | DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
-- | MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
-- | LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
-- +-----------------+--------------+------+-----+---------+-------+
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | JOB_ID     | varchar(10)  | NO   | PRI |         |       |
-- | JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
-- | MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- | MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
CREATE TABLE IF NOT EXISTS employees (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) DEFAULT NULL,
    LAST_NAME varchar(25) NOT NULL,
    EMAIL varchar(25) NOT NULL,
    PHONE_NUMBER varchar(20) DEFAULT NULL,
    HIRE_DATE date NOT NULL,
    JOB_ID varchar(10) NOT NULL,
    SALARY decimal(8, 2) DEFAULT NULL,
    COMMISSION_PCT decimal(2, 2) DEFAULT NULL,
    MANAGER_ID decimal(6, 0) DEFAULT NULL,
    DEPARTMENT_ID decimal(4, 0) DEFAULT NULL,
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
    FOREIGN KEY(JOB_ID) REFERENCES jobs(JOB_ID)
) ENGINE = InnoDB;
-- 6. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.
-- Assume that the structure of the table jobs and InnoDB Engine have been used to create the table jobs.
-- CREATE TABLE IF NOT EXISTS jobs ( 
-- JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
-- JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
-- MIN_SALARY decimal(6,0) DEFAULT 8000, 
-- MAX_SALARY decimal(6,0) DEFAULT NULL
-- )ENGINE=InnoDB;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
-- | JOB_TITLE  | varchar(35)  | NO   |     |         |       |
-- | MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
-- | MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
CREATE TABLE IF NOT EXISTS employees (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) DEFAULT NULL,
    LAST_NAME varchar(25) NOT NULL,
    JOB_ID INTEGER NOT NULL,
    SALARY decimal(8, 2) DEFAULT NULL,
    FOREIGN KEY(JOB_ID) REFERENCES jobs(JOB_ID) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB;
-- 7. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.
-- Assume that the structure of two table jobs and InnoDB Engine have been used to create the table jobs.
-- CREATE TABLE IF NOT EXISTS jobs ( 
-- JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
-- JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
-- MIN_SALARY decimal(6,0) DEFAULT 8000, 
-- MAX_SALARY decimal(6,0) DEFAULT NULL
-- )ENGINE=InnoDB;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
-- | JOB_TITLE  | varchar(35)  | NO   |     |         |       |
-- | MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
-- | MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
CREATE TABLE IF NOT EXISTS employees (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) DEFAULT NULL,
    LAST_NAME varchar(25) NOT NULL,
    JOB_ID INTEGER,
    SALARY decimal(8, 2) DEFAULT NULL,
    FOREIGN KEY(JOB_ID) REFERENCES jobs(JOB_ID) ON DELETE
    SET NULL ON UPDATE
    SET NULL
) ENGINE = InnoDB;
-- 8. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.
-- Assume that the structure of two table jobs and InnoDB Engine have been used to create the table jobs.
-- CREATE TABLE IF NOT EXISTS jobs ( 
-- JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
-- JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
-- MIN_SALARY decimal(6,0) DEFAULT 8000, 
-- MAX_SALARY decimal(6,0) DEFAULT NULL
-- )ENGINE=InnoDB;
-- +------------+--------------+------+-----+---------+-------+
-- | Field      | Type         | Null | Key | Default | Extra |
-- +------------+--------------+------+-----+---------+-------+
-- | JOB_ID     | int(11)      | NO   | PRI | NULL    |       |
-- | JOB_TITLE  | varchar(35)  | NO   |     |         |       |
-- | MIN_SALARY | decimal(6,0) | YES  |     | 8000    |       |
-- | MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
-- +------------+--------------+------+-----+---------+-------+
CREATE TABLE IF NOT EXISTS employees (
    EMPLOYEE_ID decimal(6, 0) NOT NULL PRIMARY KEY,
    FIRST_NAME varchar(20) DEFAULT NULL,
    LAST_NAME varchar(25) NOT NULL,
    JOB_ID INTEGER NOT NULL,
    SALARY decimal(8, 2) DEFAULT NULL,
    FOREIGN KEY(JOB_ID) REFERENCES jobs(JOB_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;