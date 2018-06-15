/*Corey Hicks
  17 May 2018
  CIS 308
  Assignment 1.1*/
  
--Lesson 1
--Show the structure of the DEPT table.
  describe DEPT;
  
--Select all data from the DEPT table.
  select * 
    from DEPT;
  
--Show the structure of the EMP table.
  describe EMP;
  
--Create a query to display the name, job, hire date, and employee number for each employee with the employee number appearing first.
  select EMPNO, ENAME, JOB, HIREDATE 
    from EMP;
  
--Create a query to display unique jobs from the EMP table.
  select distinct JOB 
    from EMP;
  
--Create a query to display the employee number, employee name, job, and hire date.  Name the columns: Emp #, Employee, Job, and Hire Date.
  select EMPNO as "Emp #", ENAME as "Employee", JOB as "Job", HIREDATE as "Hire Date" 
    from EMP;
  
--Create a query that displays the employee name concatenated with the job title, separated by a comma and space, name the column "Employee and Title".
  select ENAME || ', '|| JOB as "Employee and Title" --|| operator is used to concatenate strings together
      from EMP;
  
--Create a query to display all the data from the EMP table.  Separate each column by a comma.
  select EMPNO || ',' || ENAME || ','|| JOB || ',' || MGR || ',' || HIREDATE || ',' || SAL || ',' || COMM || ',' || DEPTNO as "Employee Table" 
      from EMP;
  
--Lesson 2
--Create a query to display the name and salary of employees earning more than $2850.
  select ENAME, SAL 
    from EMP 
      where SAL > 2850;
  
--Create a query to display the employee name and department number for each employee number 7566.
  select ENAME, DEPTNO 
    from EMP 
      where EMPNO = 7566;
  
--Create a query to display the employee name and salary for each employee whose salary is not in the range of $1500 and $2850. 
  select ENAME, SAL 
    from EMP 
      where SAL between 1500 and 2850; --between operator selects only variables that are between the specified range
  
--Create a query to display the employee name, job and start date of employees hired between February 20, 1981 and May 1, 1981.  Order the query in ascending order by start date.
  select ENAME, JOB, HIREDATE 
    from EMP 
      where HIREDATE between date '1981-02-20' and  date '1981-05-01'
        order by HIREDATE asc;
        
--Create a query that displays the name and department number of all employees in departments 10 and 30 in alphabetical order.
  select ENAME, DEPTNO 
    from EMP 
      where DEPTNO in (10, 30) --in condition used to determine if specified variables are 'in' the table
        order by ENAME asc;     

--Create a query to list the names and salary of employees who earn more than $1500 and are in department 10 or 30.  Label the columns Employee and Monthly Salary, respectively.
  select ENAME as "Employee", SAL as "Monthly Salary"
    from EMP
      where SAL > 1500 and DEPTNO in (10, 30);

--Display the name and hire date of every employee who was hired in 1982.
  select ENAME, HIREDATE
    from EMP
      where hiredate > date '1981-12-31';
      
--Display the name and job title of all employees who do not have a manger.
  select ENAME, JOB
    from EMP
      where MGR is null;
      
--Display the name, salary, and commission for all employees who earn commissions.  Sort in descending order of salary and commission.
  select ENAME, SAL, COMM
    from EMP
      where COMM is not null
        order by SAL desc, COMM desc;
        
--Display the names of all employees where the third letter of their name is an 'A'.
  select ENAME
    from EMP
      where substr(ENAME, 3, 1) = 'A'; --substr functions return a portion of a function 3 selects the third position and 1 selects a single variable to the right of that position
      
--Display the name of all employees who have two 'L's in their name and are in department 30 or their manager is 7782.
  select ENAME
    from EMP
      where instr(ENAME, 'LL')!= 0 and DEPTNO = 30 or MGR = 7782; --instr function determines if a string contains the specified string values
      
--Display the name, job, salary for all employees whose job is Clerk or Analyst and their salary is not equal to $1000, #3000, or $5000.
  select ENAME, JOB, SAL
    from EMP
      where JOB in ('CLERK', 'ANALYST') and SAL not in (1000, 3000, 5000);
      
--Display the name, salary, and commission for all employees whose commission amount is greater than their salary by 10%.
  select ENAME, SAL, COMM
    from EMP
      where COMM > SAL * 1.1;