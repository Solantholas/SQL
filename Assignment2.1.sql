/*Corey Hicks
  25 May 2018
  CIS 308
  Assignment 2.1*/
  
--Lesson 3  
--Display the employee number, name, salary, and salary increased by 15% expressed as a whole number.
    SELECT empno, ename, sal, ROUND(sal * 1.15, 0) -- Round 0 is used to round to the nearest whole number
      FROM emp;
    
--Modify the previous query to add a column that will subtract the old salary from the new salary.  Label the column Increase.
    SELECT empno, ename, sal, ROUND(sal * 1.15, 0), ROUND(sal * 1.15, 0) - sal as "Increase" -- This can also be accomplished with ROUND(sal * .15, 0)
      FROM emp;
    
/*Display the employee's name, hire date, and salary review date, which is the first Monday after six months of service.  Label the column REVIEW.  
  Format the dates to appear in the format similar to "Sunday, the Seventh of September, 1981.*/
  --TO_CHAR formatting fm returns the specified string in exact formatting, Ddth returns ordinal number suffix i.e. 4th, 2nd
  --NEXT_DAY argument returns the next consecutive day of the week specified in the argument
  --ADD_MONTHS argument returns specified number of months
    SELECT ename, hiredate, sal, TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate, 6), 'Monday'), 'fmDay, "the" Ddth "of" Month, YYYY') AS "Review"
      FROM emp;

/*For each employee display the employee name and calculate the number of months between today and the date the employee was hired.  Label the 
  column MONTHS_WORKED.  Order your results by the number of months employed.  Round the number of months up to the closest whole number.*/
  --SYSDATE is used to determine the current date of the computer running the script
    SELECT ename, ROUND(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "MONTHS_WORKED"
      FROM emp
        ORDER BY "MONTHS_WORKED"; --Able to sort by column alias after one is specified
    
/*Write a query that generates output simulate to the following:
  <employee> earns <salary> monthly but wants <3 times salary>.  Title the column Dream Salaries.
    Dream Salaries
    KING earns $5,000.00 monthly but wants $15,000.00.
    BLAKE earns $2,850.00 monthly but wants $8,550.00.
    CLARK earns $2,450.00 monthly but wants $7,350.00.
    JONES earns $2,975.00 monthly but wants $8,925.00.  Etc.*/
    --|| used to concatenate columns and strings together. fm used to format numbers exactly as specified
      SELECT (ename || ' earns ' || to_char(sal, 'fm$99,999.00') || ' monthly but wants ' || to_char(sal * 3, 'fm$99,999.00') || '.') AS "Dream Salaries"
        FROM emp;
        
--Write a query to display name and salary for all employees.  Format the salary to be 15 characters long, left-padded with $s.  Label the column SALARY.
    SELECT ename, LPAD(sal, 15, '$') as SALARY --lpad provides padding, left justified with $ as the padding
      FROM emp;
    
/*Write a query that will display the employee's name with the first letter capitalized and all other letters lowercase along with the length of their name, 
  restrict your results to include only employees whose name starts with J, A, or M.  Give each column an appropriate label.*/
    SELECT INITCAP(ename) AS "Name", LENGTH(ename) AS "Length" -- initcap capitalizes the first letter and length will provide how many characters are in the string
      FROM emp 
        WHERE ename like 'J%' OR ename like 'M%' OR ename like 'A%'; -- like 'J%' etc. will find strings that start with that letter
    
--Display the name, hire date, and day of the week on which the employee started.  Label the column DAY.  Order the results by the day of the week starting with Monday.
    SELECT ename, hiredate, TO_CHAR(hiredate, 'DAY') AS DAY -- To_Char will select the column and day of the week
      FROM emp
        ORDER BY TO_CHAR(hiredate - 1, 'D'); -- Must select hiredate - 1 to start the week on monday