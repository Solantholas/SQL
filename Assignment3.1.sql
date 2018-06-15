/*Corey Hicks
  3 June 2018
  CIS 308
  Assignment 3.1*/

--Lesson 4
/* Write a query to display the name, department number, and department name for 
   all employees.*/
    SELECT e.ename, e.deptno, d.dname
      FROM emp e JOIN dept d
        ON e.deptno = d.deptno;  

/* Create a unique listing of all jobs that are in department 30.  Include the 
   location of the department 30 in the output.*/
    SELECT DISTINCT e.job, e.deptno, d.loc
      FROM emp e JOIN dept d
        ON e.deptno = d.deptno
          AND d.deptno = '30';

/* Write a query to display the employee name, department name, and location of 
   all employees who earn a commission.*/
    SELECT e.ename, d.dname, d.loc
      FROM emp e JOIN dept d
        ON e.deptno = d.deptno
          AND e.comm IS NOT NULL;

/* Display the employee name and department name for all employees who have an 
   'A' in their name.*/
    SELECT e.ename, d.dname
      FROM emp e JOIN dept d
        ON e.deptno = d.deptno
          AND INSTR(e.ename, 'A') != 0;

/* Write a query to display the name, job, department number, and department 
   name for all employees who work in DALLAS.*/
    SELECT e.ename, e.job, e.deptno, d.dname
      FROM emp e JOIN dept d
        ON e.deptno = d.deptno
          AND d.loc IN ('DALLAS');

/* Display the employee name and employee number along with their manager's name 
   and manager number.  Label the columns Employee, Emp#, Manager, and Mgr#, 
   respectively.*/
    SELECT e.ename AS "Employee", e.empno AS "Emp#", m.ename AS "Manager", e.mgr AS "Mgr#"
      FROM emp e JOIN emp m
        ON e.mgr = m.empno;

/* Modify the previous query to display all employees including King, who has no 
   manager.  Note, the 3rd and 4th fields for King will display as empty.*/
    SELECT e.ename AS "Employee", e.empno AS "Emp#", m.ename AS "Manager", e.mgr AS "Mgr#"
      FROM emp e JOIN emp m
        ON e.mgr = m.empno(+);

/* Create a query that will display the employee name, department number, and 
   all the employees that work in the same department as a given employee.  Give 
   each column an appropriate label.*/
    SELECT e.ename AS "Employee", e.deptno AS "Department #", c.ename AS "Colleagues" 
      FROM emp e JOIN emp c
        ON e.deptno = c.deptno
          AND e.empno <> c.empno;

--Show the structure of the SALGRADE table.
    DESCRIBE salgrade;

/* Create a query that will display the name, job, department name, salary, and 
   grade for all employees.*/
    SELECT e.ename, d.dname, e.sal, s.grade
      FROM emp e, dept d, salgrade s
        WHERE e.deptno = d.deptno
          AND e.sal BETWEEN s.losal AND s.hisal;
          
/* Create a query to display the name and hire date of any employee hired after 
   employee Blake.*/
    SELECT e.ename, e.hiredate
      FROM emp e JOIN emp blake
        ON blake.ename IN ('BLAKE')
          AND blake.hiredate < e.hiredate;

/* Display all employees' names and hire dates along with their manager's name 
   and hire date for all employees who were hired before their managers.  Label 
   the columns Employee, Emp Hire Date, Manager, and Mgr Hire Date, 
   respectively.*/

    SELECT e.ename AS "Employee", e.hiredate AS "Emp Hire Date", m.ename AS "Manager", m.hiredate AS "Mgr Hire Date" 
      FROM emp e JOIN emp m 
        ON e.mgr = m.empno 
          AND e.hiredate < m.hiredate;