# What is a Function?
/*
  A function is a block of code that does a certain job for us. For example, think of the mathematical
  functions available in MS Excel. To add numbers, we can use the sum() function and type sum(A1:A5)
  instead of typing A1+A2+A3+A4+A5
*/

# CONCAT()
SELECT CONCAT('Hello', ' World');

# SUBSTRING()
SELECT SUBSTRING('Programming', 2);

SELECT SUBSTRING('Programming', 2, 6);


# NOW()
/* This function gives us current data and time as we used in Chapter 3. */


# CURDATE() - This gives us the current date.
SELECT CURDATE();


# CURTIME() - This gives us the current time.
SELECT CURTIME();


# Aggregate Functions
/* This is the function that performs calculations on a set of values and returns the result of 
   the calculations on the data in our tables. */

# COUNT() - It returns the number of rows in the table
SELECT COUNT(*) FROM employees;

SELECT COUNT(contact_number) FROM employees;

SELECT COUNT(gender) FROM employees;

SELECT COUNT(DISTINCT(gender)) FROM employees;


# AVG() - This function returns the average of a set of values
SELECT AVG(salary) FROM employees; # Result - 6487.77777777777

SELECT ROUND(AVG(salary), 2) FROM employees; # Result - 6487.78


# MAX()
SELECT MAX(salary) FROM employees;


# MIN()
SELECT MIN(salary) FROM employees;


# SUM()
SELECT SUM(salary) FROM employees;


# GROUP BY
SELECT gender, MAX(salary) FROM employees GROUP BY gender;
/*
  gender    MAX(salary)
  M         7980
  F         12000
*/


# HAVING
SELECT gender, MAX(salary) FROM employees GROUP BY gender HAVING MAX(salary) > 10000;
/*
   gender    MAX(salary)
   F         12000
*/