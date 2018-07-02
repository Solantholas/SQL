/*  Corey Hicks
    1 July 2018
    CIS 308
    Assignment 7.1  */

--Lesson 9
--Describe the structure of the MY_EMPLOYEE table to identify the column names.

  DESC my_employee;
  
/*Add the following row of data to the MY_EMPLOYEE table without listing the columns in the INSERT clause:
  LAST_NAME  FISRT_NAME  USERID  SALARY
  Patel  Ralph  rpatel  795 */
  
  INSERT INTO my_employee
    VALUES (0001, 'Patel', 'Ralph', 'rpatel', 795);

/*Add the following row of data to the MY_EMPLOYEE table listing the columns in the INSERT clause:
  LAST_NAME  FISRT_NAME  USERID  SALARY
  Dancs  Betty  bdancs  860*/
  
  INSERT INTO my_employee (ID, last_name, first_name, userid, salary)
    VALUES (0002, 'Dancs', 'Betty', 'bdancs', 860);
  
--Confirm your additions to the table.

  SELECT * FROM my_employee;

/*Create a SQL statement that prompts the user for the employee's id, first name, 
last name, and salary.  Concatenate the first letter of the first name and the f
irst seven characters of the last name to produce the userid. */

  SET ECHO OFF;
  SET VERIFY OFF;
  
  INSERT INTO my_employee VALUES (&id, '&&last_name', '&&first_name', 
                                  lower(substr('&first_name', 1, 1) || 
                                  substr('&last_name', 1, 7)), &salary); 
  SET VERIFY ON;
  SET ECHO ON;
  
  UNDEFINE first_name;
  UNDEFINE last_name;

/*Add the following rows of data to the MY_EMPLOYEE table:
LAST_NAME  FISRT_NAME  USERID  SALARY
Biri  Ben  bbiri  1100
Newman Chad  cnewman 750*/

  INSERT ALL
  INTO my_employee (ID, last_name, first_name, userid, salary)
    VALUES (0003, 'Biri', 'Ben', 'bbiri', 1100)
  INTO my_employee (ID, last_name, first_name, userid, salary)  
    VALUES (0004, 'Newman', 'Chad', 'cnewman', 750)
  SELECT * FROM dual;

--Confirm your additions to the table.

  SELECT * FROM my_employee;

--Make the data additions permanent.

  COMMIT;

--Change the name of employee 3 (Biri) to Drexler.

  UPDATE my_employee 
    SET last_name = 'Drexler' 
      WHERE id = 3;

--Change the salary to 1000 for all employees with a salary less than 900.

  UPDATE my_employee 
    SET salary = 1000 
      WHERE salary < 900;

--Verify your changes to the table.

  SELECT * FROM my_employee;

--Delete Betty Dancs from the MY_EMPLOYEE table.

  DELETE FROM my_employee 
    WHERE last_name = 'Dancs'
      AND first_name = 'Betty'; 

--Make all changes permanent.

  COMMIT;

/*Add the following row of data to the MY_EMPLOYEE table:
LAST_NAME  FISRT_NAME  USERID  SALARY
Ropeburn Audry  aropebur 1550*/

  INSERT INTO my_employee (ID, last_name, first_name, userid, salary)
    VALUES (0005, 'Ropeburn', 'Audry', 'aropebur', 1550);
  
--Mark an intermediate point in the process of the transaction.

  SAVEPOINT one;

--Empty the entire table.

  DELETE FROM my_employee;

--Confirm the table is empty.

  SELECT * FROM my_employee;

--Discard the DELETE operation.

  ROLLBACK TO one;
  
--Make the data addition permanent.

  COMMIT;
