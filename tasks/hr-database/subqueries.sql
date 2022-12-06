-- Active: 1647295028338@@127.0.0.1@3307@hr
USE `hr`;
-- 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY > (
    SELECT SALARY
    FROM employees
    WHERE LAST_NAME = "Bull"
  );
-- 2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME),
  DEPARTMENT_ID AS NAME
FROM employees
WHERE DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID FR OM departments
    WHERE DEPARTMENT_NAME = 'IT'
  );
-- 3. Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  MANAGER_ID
FROM employees
WHERE MANAGER_ID IN (
    SELECT EMPLOYEE_ID
    FROM employees
    WHERE DEPARTMENT_ID IN (
        SELECT DEPARTMENT_ID
        FROM departments
        WHERE LOCATION_ID IN (
            SELECT LOCATION_ID
            FROM locations
            WHERE COUNTRY_ID = 'US'
          )
      )
  );
-- 4. Write a query to find the name (first_name, last_name) of the employees who are managers.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME
FROM employees
WHERE EMPLOYEE_ID IN (
    SELECT MANAGER_ID
    FROM employees
  );
-- 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM employees
  );
-- 6. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their jobs.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY,
  JOB_ID
FROM employees E1
WHERE SALARY =(
    SELECT MIN(SALARY)
    FROM employees
    WHERE JOB_ID = E1.JOB_ID
  );
-- 7. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY,
  DEPARTMENT_ID
FROM employees E1
WHERE SALARY >(
    SELECT AVG(SALARY)
    FROM employees
  )
  AND DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM departments
    WHERE DEPARTMENT_NAME LIKE 'IT%'
  );
-- 8. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Ms. Bell.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY >(
    SELECT SALARY
    FROM employees
    WHERE LAST_NAME = 'Bell'
  );
-- 9. Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY =(
    SELECT MIN(SALARY)
    FROM employees
  );
-- 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY >(
    SELECT AVG(SALARY) AS AVERAGE_SAL
    FROM employees
    GROUP BY DEPARTMENT_ID
    ORDER BY AVERAGE_SAL DESC
    LIMIT 1
  );
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY > ALL(
    SELECT AVG(SALARY) AS AVERAGE_SAL
    FROM employees
    GROUP BY DEPARTMENT_ID
  );
-- 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary from the lowest to highest.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY > ALL(
    SELECT SALARY
    FROM employees
    WHERE job_id = 'SH_CLERK'
  )
ORDER BY SALARY;
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  SALARY
FROM employees
WHERE SALARY >(
    SELECT MAX(SALARY)
    FROM employees
    WHERE JOB_ID = 'SH_CLERK'
  )
ORDER BY SALARY;
-- 12. Write a query to find the name (first_name, last_name) of the employees who are not managers.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  EMPLOYEE_ID
FROM employees
WHERE EMPLOYEE_ID NOT IN (
    SELECT MANAGER_ID
    FROM employees
  );
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS NAME,
  EMPLOYEE_ID
FROM employees E1
WHERE NOT EXISTS (
    SELECT 'X'
    FROM employees E2
    WHERE E1.EMPLOYEE_ID = E2.MANAGER_ID
  );
-- 13. Write a query to display the employee ID, first name, last name, and department names of all employees.
SELECT E.EMPLOYEE_ID,
  E.FIRST_NAME,
  E.LAST_NAME,
  D.DEPARTMENT_NAME
FROM employees E,
  (
    SELECT DEPARTMENT_ID,
      DEPARTMENT_NAME
    FROM departments
  ) D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;
SELECT employee_id,
  first_name,
  last_name,
  (
    SELECT department_name
    FROM departments D
    WHERE E.department_id = D.department_id
  ) department_name
FROM employees E;
-- 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
SELECT employee_id,
  first_name,
  last_name,
  salary,
  department_id
FROM employees E1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees E2
    WHERE E1.department_id = E2.department_id
  );
-- EXTRA -
SELECT employee_id,
  first_name,
  last_name,
  department_id,
  salary,
  (
    SELECT AVG(salary)
    from employees E
    WHERE E.department_id = E1.department_id
  ) dept_avg_salary
FROM employees E1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees E2
    WHERE E1.department_id = E2.department_id
  );
-- 15. Write a query to fetch even numbered records from employees table.
SELECT row_no,
  employee_id
FROM (
    SELECT @x: = @x + 1 AS row_no,
      employee_id
    FROM employees
  ) E
WHERE MOD(E.row_no, 2) = 0;
-- 16. Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT SALARY
FROM employees
ORDER BY SALARY DESC
LIMIT 1 OFFSET 4;
SELECT DISTINCT SALARY
FROM employees E1
WHERE 4 = (
    SELECT COUNT(DISTINCT SALARY)
    FROM employees E2
    WHERE E2.SALARY > E1.SALARY
  );
-- 17. Write a query to find the 4th minimum salary in the employees table.
SELECT DISTINCT SALARY
FROM employees
ORDER BY SALARY
LIMIT 1 OFFSET 3;
-- 18. Write a query to select last 10 records from a table.
SELECT *
FROM (
    SELECT *
    FROM employees
    ORDER BY employee_id DESC
    LIMIT 10
  ) E
ORDER BY employee_id ASC;
-- 19. Write a query to list the department ID and name of all the departments where no employee is working.
SELECT DEPARTMENT_ID,
  DEPARTMENT_NAME
FROM departments D
WHERE NOT EXISTS (
    SELECT 'X'
    FROM employees E
    WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID
  );
SELECT DEPARTMENT_ID,
  DEPARTMENT_NAME
FROM departments D
WHERE DEPARTMENT_ID NOT IN (
    SELECT DEPARTMENT_ID
    FROM employees
  );
-- 20. Write a query to get 3 maximum salaries.
SELECT DISTINCT SALARY
FROM employees
ORDER BY SALARY DESC
LIMIT 3;
-- 21. Write a query to get 3 minimum salaries.
SELECT DISTINCT SALARY
FROM employees
ORDER BY SALARY
LIMIT 3;
-- 22. Write a query to get nth max salaries of employees.
SELECT SALARY
FROM employees E1
WHERE (N -1) = (
    SELECT COUNT(DISTINCT(E2.SALARY))
    FROM employees E2
    WHERE E2.SALARY > E1.SALARY
  );