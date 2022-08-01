-- Active: 1647295028338@@127.0.0.1@3307@hr
SELECT *
FROM employees;
SELECT CONCAT(`first_name`, " ", `last_name`) AS name,
    job_id,
    department_id
FROM employees
WHERE job_id LIKE "IT\_%";
SELECT *
FROM departments;
SELECT department_id
FROM departments
WHERE department_name LIKE "IT";
SELECT CONCAT(`first_name`, " ", `last_name`) AS name,
    job_id,
    department_id
FROM employees
WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name LIKE "IT"
    );
-- Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their jobs.
SELECT CONCAT(`first_name`, " ", `last_name`) AS name,
    salary,
    job_id
FROM employees e
WHERE salary = (
        SELECT min_salary
        FROM jobs j
        WHERE e.job_id = j.job_id
    );