# Selecting Everything
SELECT * FROM employees;

# Filtering Columns
SELECT em_name, gender FROM employees;

# Using Aliases (Changing the name of column)
SELECT em_name as "Employee Name", gender as Gender FROM employees;

# Filtering Rows
# LIMIT
SELECT em_name as "Employee Name", gender as Gender FROM employees 
LIMIT 3;

# DISTINCT
SELECT DISTINCT(gender) AS Gender FROM employees;

# WHERE clause
# COMPARISION like (!=), (=), (>), (<), (>=), (<=)
SELECT * FROM employees where id != 1;

# BETWEEN
SELECT * FROM employees WHERE id BETWEEN 1 AND 3;

# LIKE
SELECT * FROM employees WHERE em_name LIKE '%er';
/*Note: The % symbol is used to indicate that there can be an unknown number of 
        Characters in front of 'er'. */
        
SELECT * FROM employees WHERE em_name LIKE '%er%';
/*Note: We add the % symbol in front of and behind 'er' to indicate that there 
        can be any number of characters before and after it. */
        
SELECT * FROM employees WHERE em_name LIKE '____e%';
/*Note: We want to select the rows of all employees that have 'e' as the fifth
        letter in their names. */
        
# IN
SELECT * FROM employees WHERE id IN (6, 7, 9);

# NOT IN
SELECT * FROM employees WHERE id NOT IN (7, 8);

# AND, OR
SELECT * FROM employees WHERE (years_in_company > 5 OR salary > 5000) AND gender = 'F';


# Subqueries
/*Subqueries are commonly used to filter the results of one table based on the 
  results of a query on another table. */
SELECT em_name from employees WHERE id IN
(SELECT mentor_id FROM mentorships WHERE project = 'SQF Limited');

# Sorting Rows
SELECT * FROM employees ORDER BY gender, em_name;

SELECT * FROM employees ORDER BY gender DESC, em_name;