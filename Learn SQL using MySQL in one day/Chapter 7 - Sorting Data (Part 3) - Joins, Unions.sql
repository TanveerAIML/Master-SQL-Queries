# What is Join
/* A join is used to join data from different tables based on a related column between the tables.*/

# 3 Main Types of Join
# 1) Inner Join
# 2) Right Join
# 3) Left Join

SELECT employees.id, mentorships.mentor_id, employees.em_name AS 'Mentor', mentorships.project AS 'Project Name'
FROM mentorships
JOIN employees
ON employees.id = mentorships.mentor_id;


SELECT employees.em_name AS 'Mentor', mentorships.project AS 'Project Name'
FROM mentorships
JOIN employees
ON employees.id = mentorships.mentor_id;


# Unions
/* The Union keyword is used to combine the results of two or more SELECT statements.
   Each SELECT statement must have the same number of columns.
*/

SELECT em_name, salary FROM employees WHERE gender = 'M'
UNION
SELECT em_name, years_in_company FROM employees WHERE gender = 'F';