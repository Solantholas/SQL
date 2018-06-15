/*  Write a query to display the employees name and hire date for all employees 
in the same department as 'Blake'.  Exclude 'Blake'. */

  SELECT ename, hiredate
    FROM emp
      WHERE deptno = (SELECT deptno
                        FROM emp
                          WHERE ename = 'BLAKE')
        AND ename NOT IN 'BLAKE';

/*  Create a query to display the employee number and name for all employees who 
earn more than the average salary.  Sort the results in descending order of 
salary. */
    
  SELECT empno, ename
    FROM emp
      WHERE SAL > (SELECT AVG(sal)
                    FROM emp)
        ORDER BY sal DESC;
    
/*  Write a query that will display the employee number and name for all 
employees who work in a department with any employee whose name contains a 'T'. */

  SELECT empno, ename
    FROM emp
      WHERE deptno IN (SELECT deptno
                        FROM emp
                          WHERE INSTR(ename, 'T') != 0);                       

/*  Display the employee name, department number, and job title for all 
employees whose department location is Dallas. */
    
  SELECT ename, deptno, job
    FROM emp
      WHERE deptno IN (SELECT deptno
                        FROM dept
                          WHERE loc IN 'DALLAS');                     
    
/*  Display the employee name and salary of all employees who report to 'King'. */

  SELECT ename, sal
    FROM emp
      WHERE mgr = (SELECT empno 
                    FROM emp 
                      WHERE ename IN 'KING');    

/*  Display the department number, name, and job for all employees in the Sales 
department. */

  SELECT deptno, ename, job
    FROM emp
      WHERE deptno = (SELECT deptno 
                        FROM dept 
                          WHERE dname IN 'SALES');

/*  Display the employee number, name, and salary for all employees who earn 
more than the average salary and who work in a department with any employee with 
a 'T' in their name. */

  SELECT empno, ename, sal
    FROM emp
      WHERE sal > (SELECT AVG(sal) 
                    FROM emp)
        AND deptno IN (SELECT deptno 
                        FROM emp 
                          WHERE INSTR(ename, 'T') != 0);                        