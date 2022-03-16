-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
SELECT location_id,
    street_address,
    city,
    state_province,
    country_name
FROM locations
    NATURAL JOIN countries;
-- 2. Write a query to find the name (first_name, last name), department ID and department name of all the employees.
SELECT CONCAT(e.First_name, " ", e.Last_name),
    d.department_id,
    d.department_name
FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id;
or USING(department_id) -- 3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME),
    JOB_TITLE,
    DEPARTMENT_ID,
    DEPARTMENT_NAME
FROM employees
    INNER JOIN departments using(DEPARTMENT_ID)
    INNER JOIN jobs using(JOB_ID)
WHERE LOCATION_ID = (
        SELECT LOCATION_ID
        FROM locations
        where CITY = "London"
    );
-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT e.employee_id,
    e.last_name,
    e.manager_id,
    m.last_name
FROM employees e
    LEFT JOIN employees m ON m.employee_id = e.manager_id;
-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
SELECT CONCAT(E1.first_name, ' ', E1.last_name) AS name,
    E1.hire_date
FROM employees AS E1
    INNER JOIN employees AS E2 ON E1.hire_date > E2.hire_date
    AND E2.last_name = 'Jones';
-- 6. Write a query to get the department name and number of employees in the department.
SELECT D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME,
    COUNT(E.EMPLOYEE_ID) AS NO_OF_EMPLOYEES
FROM employees E
    RIGHT JOIN departments D USING(DEPARTMENT_ID)
GROUP BY D.DEPARTMENT_ID;
-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
SELECT employee_id,
    job_title,
    department_id,
    TO_DAYS(end_date) - TO_DAYS(start_date) no_of_days
FROM jobs
    NATURAL JOIN job_history
WHERE department_id = 90;
SELECT employee_id,
    job_title,
    department_id,
    DATEDIFF(end_date, start_date) no_of_days
FROM jobs
    NATURAL JOIN job_history
WHERE department_id = 90;
-- 8. Write a query to display the department ID and name and first name of manager.
SELECT d.department_id,
    d.department_name,
    e.first_name
FROM departments d
    INNER JOIN employees e ON d.manager_id = e.employee_id;
-- 9. Write a query to display the department name, manager name, and city.
SELECT d.department_name,
    CONCAT(e.First_name, " ", e.Last_name) AS name,
    l.city
FROM departments d
    INNER JOIN employees e ON d.manager_id = e.employee_id
    NATURAL JOIN locations l;
-- 10. Write a query to display the job title and average salary of employees.
SELECT JOB_TITLE,
    AVG(SALARY)
FROM employees
    NATURAL JOIN jobs
GROUP BY JOB_TITLE;
-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
SELECT JOB_TITLE,
    CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
    SALARY - MIN_SALARY AS DIFF_FROM_MIN
FROM employees
    NATURAL JOIN jobs;
-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
SELECT jh.*
FROM job_history jh
    INNER JOIN employees e ON (jh.employee_id = e.employee_id)
WHERE e.salary > 10000;
-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
SELECT DISTINCT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
    HIRE_DATE,
    SALARY,
    TIMESTAMPDIFF(YEAR, HIRE_DATE, CURDATE()) AS EXPERIENCE
FROM employees E
    INNER JOIN departments D ON (E.employee_id = D.manager_id)
WHERE TIMESTAMPDIFF(YEAR, HIRE_DATE, CURDATE()) > 15;
SELECT DISTINCT NAME,
    HIRE_DATE,
    SALARY,
    EXPERIENCE
FROM (
        SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
            HIRE_DATE,
            SALARY,
            TIMESTAMPDIFF(YEAR, HIRE_DATE, CURDATE()) AS EXPERIENCE
        FROM employees
        WHERE EMPLOYEE_ID IN (
                SELECT MANAGER_ID
                FROM departments
            )
    ) T1
WHERE EXPERIENCE > 15;