USE `hr`;
-- 1. Write a query to list the number of jobs available in the employees table.
SELECT COUNT(DISTINCT job_id) FROM employees;
-- 2. Write a query to get the total salaries payable to employees.
SELECT SUM(salary) AS total_salary FROM employees;
-- 3. Write a query to get the minimum salary from employees table.
SELECT MIN(salary) AS min_salary FROM employees;
-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT MAX(SALARY) AS MAX_PROGRAMMER_SALARY
FROM employees
WHERE JOB_ID = (
        SELECT JOB_ID
        FROM jobs
        WHERE JOB_TITLE = 'Programmer'
    );
-- 5. Write a query to get the average salary and number of employees working the department 90.
SELECT AVG(SALARY) AS AVG_SALARY,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM employees
WHERE DEPARTMENT_ID = 90;
-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees
SELECT MAX(SALARY) AS HIGHEST_SAL,
    MIN(SALARY) AS LOWEST_SAL,
    SUM(SALARY) AS TOTAL_SAL,
    AVG(SALARY) AS AVERAGE_SAL
FROM employees;
-- 7. Write a query to get the number of employees with the same job.
SELECT JOB_ID,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM employees
GROUP BY JOB_ID;
8.Write a query to get the difference between the highest and lowest salaries.
SELECT MAX(SALARY),
    MIN(SALARY),
    MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
FROM employees;
-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT T1.MANAGER_ID,
    T1.EMPLOYEE_ID,
    CONCAT(T1.FIRST_NAME, " ", T1.LAST_NAME) AS NAME,
    T1.SALARY
FROM employees T1,
    (
        SELECT MANAGER_ID,
            MIN(SALARY) AS LOWEST_SALARY
        FROM employees
        WHERE MANAGER_ID IS NOT NULL
        GROUP BY MANAGER_ID
    ) AS T2
WHERE T1.SALARY = T2.LOWEST_SALARY
    AND T1.MANAGER_ID = T2.MANAGER_ID;
-- 10. Write a query to get the department ID and the total salary payable in each department.
SELECT DEPARTMENT_ID,
    SUM(SALARY) AS TOTAL_SAL_PAYABLE
FROM employees
GROUP BY DEPARTMENT_ID;
-- 11. Write a query to get the average salary for each job ID excluding programmer.
SELECT JOB_ID,
    AVG(SALARY) AS AVG_SALARY
FROM employees
GROUP BY JOB_ID
HAVING JOB_ID <> (
        SELECT JOB_ID
        FROM jobs
        WHERE JOB_TITLE = 'Programmer'
    );
-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT SUM(SALARY) AS TOTAL_SALARY,
    MAX(SALARY) AS HIGHEST_SAL,
    MIN(SALARY) AS LOWEST_SAL,
    AVG(SALARY) AS AVERAGE_SAL,
    JOB_ID,
    DEPARTMENT_ID
FROM employees
GROUP BY JOB_ID,
    DEPARTMENT_ID
HAVING DEPARTMENT_ID = 90;
SELECT SUM(SALARY) AS TOTAL_SALARY,
    MAX(SALARY) AS HIGHEST_SAL,
    MIN(SALARY) AS LOWEST_SAL,
    AVG(SALARY) AS AVERAGE_SAL,
    JOB_ID
FROM employees
WHERE DEPARTMENT_ID = 90
GROUP BY JOB_ID;
-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT JOB_ID,
    MAX(SALARY) AS HIGHEST_SAL_FOR_THE_JOB
FROM employees
WHERE SALARY >= 4000
GROUP BY JOB_ID;
-- 14. Write a query to get the average salary for all departments employing more than 10 employees.
SELECT DEPARTMENT_ID,
    AVG(SALARY) AS AVERAGE_SAL,
    COUNT(*) AS NO_OF_EMPLOYEES
FROM employees
HAVING COUNT(*) > 10;