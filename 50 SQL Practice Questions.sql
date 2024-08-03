# Creating Database
CREATE DATABASE employee;

# Using Database
USE employee;

# Preparing Sample Data

# Sample Worker Table
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');


# Sample Bonus Table
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');


# Sample Title Table
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');
    
    

# 20 Basic SQL Questions

# Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias 
#      name <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM worker;


# Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM worker;


# Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
SELECT DISTINCT(DEPARTMENT) FROM worker;


# Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the 
#      Worker table.
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM worker;


# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name 
#      column ‘Amitabh’ from the Worker table.
SELECT LOCATE('a', FIRST_NAME) AS position
FROM Worker
WHERE FIRST_NAME = 'Amitabh';

SELECT first_name,
	LOCATE('a', first_name, LOCATE('a', first_name) + 1) AS second_position
FROM Worker
WHERE first_name = 'Amitabh';


SELECT INSTR(FIRST_NAME, 'a') AS position
FROM Worker 
WHERE FIRST_NAME = 'Amitabh';


# Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces 
#      from the right side.
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME
FROM worker;


# Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces 
#      from the left side
SELECT LTRIM(DEPARTMENT) AS FIRST_NAME
FROM worker;


# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and 
#      prints its length.
SELECT DISTINCT(DEPARTMENT), LENGTH(DEPARTMENT) FROM worker;


# Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
Select REPLACE(FIRST_NAME,'a','A') from Worker;


# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single 
#       column COMPLETE_NAME. A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS COMPLETE_NAME
FROM worker;


# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM worker
ORDER BY FIRST_NAME;


# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending 
#       and DEPARTMENT Descending.
SELECT * FROM worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;


# Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from 
#       the Worker table.
SELECT * FROM worker
WHERE FIRST_NAME IN ('Vipul', 'Satish');


# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from 
#       the Worker table.
SELECT * FROM worker
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');


# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
SELECT * FROM worker
WHERE DEPARTMENT = 'Admin';


# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM worker
WHERE FIRST_NAME LIKE '%a%';


# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM worker
WHERE FIRST_NAME LIKE '%a';


# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ 
#       and contains six alphabets.
SELECT * FROM worker
WHERE FIRST_NAME LIKE '_____h';


# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 
#       100000 and 500000.
SELECT * FROM worker
WHERE SALARY BETWEEN 100000 AND 500000;


# Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.
SELECT * FROM worker
WHERE YEAR(JOINING_DATE) = 2021
	AND MONTH(JOINING_DATE) = 02;
    


# 12 Medium SQL Questions

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM worker
WHERE DEPARTMENT = 'Admin';


# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT * FROM worker
where SALARY BETWEEN 50000 AND 100000;


# Q-23. Write an SQL query to fetch the number of workers for each department in descending order.
SELECT DEPARTMENT,
	   COUNT(WORKER_ID) AS No_Of_Workers
FROM worker
GROUP BY DEPARTMENT
ORDER BY No_Of_Workers DESC;


# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.first_name, T.worker_title
FROM worker W
join title T 
ON W.worker_id = T.worker_ref_id
WHERE T.worker_title = 'Manager';


# Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT worker_title, affected_from, count(*)
FROM title
GROUP BY worker_title, affected_from
HAVING count(*) > 1;


# Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM worker
WHERE worker_id % 2 != 0;


# Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM worker
WHERE worker_id % 2 = 0;


# Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE WorkerClone 
AS SELECT * FROM Worker;


# Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker
inner join title t
on w.worker_id = t.worker_ref_id;


# Q-30. Write an SQL query to show records from one table that another table does not have.
select w.worker_id, concat(first_name,' ',last_name) as full_name,
	   w.salary, w.department, b.bonus_amount
from worker w
left join bonus b
on w.worker_id = b.worker_ref_id
group by w.worker_id, b.bonus_amount;


# Q-31. Write an SQL query to show the current date and time.
SELECT CURRENT_TIMESTAMP;


# Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker
order by salary desc
limit 10;



# 18 Complex SQL Queries for Practice

# Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select distinct salary from worker
order by salary desc
limit 1 offset 4;


# Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
SELECT Salary FROM Worker W1 # Doubt
WHERE 4 = (SELECT COUNT(DISTINCT W2.Salary) 
FROM Worker W2 
WHERE W2.Salary >= W1.Salary);


# Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary and W.WORKER_ID != W1.WORKER_ID;


# Q-36. Write an SQL query to show the second-highest salary from a table.
select distinct salary from worker
order by salary desc
limit 1 offset 1;


# Q-37. Write an SQL query to show one row twice in the results from a table.
select * from worker w, worker w1
where w.department = 'HR' and w1.department = 'HR';


# Q-38. Write an SQL query to fetch intersecting records of two tables.
SELECT w.*
FROM Worker w
INNER JOIN WorkerClone wc ON w.WORKER_ID = wc.WORKER_ID;


# Q-39. Write an SQL query to fetch the first 50% of records from a table.
select * from worker
where worker_id <= (select round(count(worker_id)/2, 0) 
from worker);


# Q-40. Write an SQL query to fetch the departments that have less than five people in them.
select department, count(worker_id) as number_of_workers 
from worker
group by department
having count(worker_id) < 5;


# Q-41. Write an SQL query to show all departments along with the number of people in there.
select department, count(worker_id) as number_of_workers from worker
group by department;


# Q-42. Write an SQL query to show the last record from a table.
select * from worker
order by worker_id desc
limit 1;

# alternate
Select * from Worker 
where WORKER_ID = (SELECT max(WORKER_ID) from Worker);


# Q-43. Write an SQL query to fetch the first row of a table.
select * from worker
where worker_id = (select min(worker_id) from worker);


# Q-44. Write an SQL query to fetch the last five records from a table.
select * from worker
order by worker_id desc
limit 5;


# Q-45. Write an SQL query to print the names of employees having the highest salary in each department.



# Q-46. Write an SQL query to fetch three max salaries from a table.
select distinct salary from worker
order by salary desc
limit 3;


# Q-47. Write an SQL query to fetch three min salaries from a table.
select distinct salary from worker
order by salary asc
limit 3;


# Q-48. Write an SQL query to fetch nth max salaries from a table.



# Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department, sum(salary) from worker
group by department;


# Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker
where salary = (select max(salary) from worker);
