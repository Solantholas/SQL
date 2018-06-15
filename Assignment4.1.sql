/*Corey Hicks
  10 June 2018
  CIS 308
  Assignment 4.1*/

--Lesson 5
/*Display the highest, lowest, sum, and average salary of all employees.  Label 
the columns Maximum, Minimum, Sum, and Average, respectively.  Round your 
results to the nearest whole number.*/

SELECT ROUND(MAX(sal), 0) AS "Maximum", ROUND(MIN(sal), 0) AS "Minimum",
  ROUND(SUM(sal), 0) AS "Sum", ROUND(AVG(sal), 0) AS "Average"
    FROM emp;

/*Modify the previous SQL statement to display the minimum, maximum, sum and 
average salary for each job type.*/

SELECT job AS "Job", ROUND(MAX(sal), 0) AS "Maximum", ROUND(MIN(sal), 0) AS "Minimum",
  ROUND(SUM(sal), 0) AS "Sum", ROUND(AVG(sal), 0) AS "Average"
    FROM emp
      GROUP BY job;

/*Write a query to display the number of people with the same job.  Example:
Analyst 2
Clerk 4*/

SELECT job, COUNT(*) 
  FROM emp 
    GROUP BY job; 

/*Determine the number of managers without listing them.  Label the column 
Number of Managers.*/

SELECT COUNT(DISTINCT mgr) AS "Number of Managers" 
  FROM emp;

/*Write a query that will display the difference between the highest and lowest 
salaries.  Label the column DIFFERENCE.*/

SELECT MAX(sal) - MIN(sal) AS "DIFFERENCE"
  FROM emp;

/*Display the manager number and the salary of the lowest paid employee for that 
manager.  Exclude anyone whose manager is not known.  Exclude any group where 
the minimum salary is less than $1000.  Sort the output in descending order of 
salary.*/

SELECT mgr, MIN(sal) 
  FROM emp 
    WHERE mgr IS NOT NULL 
      GROUP BY mgr 
        HAVING MIN (sal) > 1000 
          ORDER BY MIN (sal) DESC;

/*Write a query to display the department name, location name, number of 
employees, and the average salary for all employees in that department. Label 
the columns DName, Loc, Number of People, and Salary, respectively.  Round the 
average salary to two decimal places.*/

SELECT d.dname AS "DName", d.loc AS "Loc", COUNT(*) AS "Number of People", ROUND(AVG(sal), 2) AS "Salary" 
  FROM emp e JOIN dept d 
    ON e.deptno = d.deptno 
      GROUP BY d.dname, d.loc;

/*Create a query that will display the total number of employees and of that 
total the number who were hired in 1980, 1981, 1982, and 1983.  Use appropriate 
column heading.*/

SELECT COUNT(*) AS "Total Emp", 
  SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1980, 1, 0)) AS "Hired 1980", 
  SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1981, 1, 0)) AS "Hired 1981", 
  SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1982, 1, 0)) AS "Hired 1982", 
  SUM(DECODE(TO_CHAR(hiredate, 'YYYY'), 1983, 1, 0)) AS "Hired 1983" 
      FROM emp;

/*Create a matrix query to display the job, the salary for that job based on 
department number, and the total salary for that job for all departments, giving 
each column an appropriate heading.*/

SELECT job AS "Job", 
  SUM(DECODE(deptno, 10, sal)) AS "Dept 10", 
  SUM(DECODE(deptno, 20, sal)) AS "Dept 20", 
  SUM(DECODE(deptno, 30, sal)) AS "Dept 30", 
  SUM(sal) AS "Total Sal" 
    FROM emp 
      GROUP BY job;