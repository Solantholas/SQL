/*  Corey Hicks
    24 June 2018
    CIS 308
    Assignment 6.1  */

--Lesson 7

/*  Write a query to display the name, department number, and salary of any 
    employee whose department number and salary match the department number and 
    salary of any employee who earns a commission.  */
    
    SELECT ename, deptno, sal
      FROM emp
        WHERE (deptno, sal) IN (SELECT deptno, sal
                                  FROM emp
                                    WHERE comm IS NOT NULL);  
    
/*  Display the name, department name, and salary of any employee whose salary 
    and commission match the salary and commission of any employee located in 
    Dallas. */  
    
    SELECT ename, dname, sal
      FROM emp e, dept d
        WHERE (sal, comm) IN (SELECT sal, comm
                                    FROM emp e 
                                      WHERE d.loc = 'DALLAS');
    
/*  Create a query to display the name, hire date, and salary for all employees 
    who have both the same salary and commission as Scott.  */
    
    SELECT ename, hiredate, sal
      FROM emp
        WHERE ename <> 'SCOTT'
          AND (sal, NVL(comm, 0)) IN (SELECT sal, NVL(comm, 0)
                                        FROM emp
                                          WHERE ename = 'SCOTT');  
    
/*  Create a query to display the employee that earns a salary that is higher 
    than the salary of all of the clerks.  Sort the results on salary from 
    highest to lowest.  */
    
    SELECT ename, job, sal
      FROM emp
        WHERE sal > ALL (SELECT sal
                          FROM emp
                            WHERE job = 'CLERK')
          ORDER BY sal DESC;   