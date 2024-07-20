# Data Types
/*
  Textual Data Type:-
  1) CHAR - "character" used to store a fixed length string of up to 255 characters.
	 For example, if you specify a column as CHAR(5) but use it to store a string like 'NY',
     it will be stored as 'NY   '. However, when the string is subsequently retrieved, these
     spaces will not be displayed.
     
  2) VARCHAR is another data type for storing strings. It holds a variable length string and
     can store up to 255 characters. You have to specify the maximum length in parentheses.
     For example, if you specify a column as VARCHAR(5) and use it to store the string 'NY',
     it will be stored as 'NY' with no spaces added. 
     
  Numerical Data Type:-   
  3) INT - Integers that can hold numbers from -2147483648 to 2147483647. 
     If we specify a column as INT UNSIGNED, it can hold values from 0 to 4294967295.
     
  4) Float(m, d) is used to store fractional numbers. It uses 4 bytes of storage.
     For example, FLOAT(5, 4) to store 1.65486, it may be stored as 1.6549
     
  5) DOUBLE(m, d) is used to store non-integers as approx values. It uses 8 bytes of
	 storage and can be used to store numbers with higher precision. It is accurate upto
     about 14 decimal places.
     
  6) DECIMAL(m, d) is used to store non-integers as exact values.
  
  Date and Time data types:-
  7) YEAR data type is used to store a year in either a two-digit or a four-digit
     format. Values allowed in 4 digit format are 1901-2155. Values allowed in 2 digit format
     are from 1-69 (representing years from 2001-2069) and 70-99 (representing years from
     1970-1999).
     
  8) DATE data type is used to store a date in the YYYY-MM-DD format, with a supported range
     of '1000-01-01' to '9999-12-31'
     
  9) TIME data type is used to store time in the HH:MI:SS format, with a supported range
     of '-838:59:59' to '838-59-59'
     
 10) DATETIME data type isn used to store a date and time combination in the YYYY-MM-DD 
     HH:MI:SS format. The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'.
 
 11) TIMESTAMP data type is also used to store a date and time combination in the
     YYYY-MM-DD HH:MI:SS format. The supported range is from '1970-01-01 00:00:01' UTC to
     '2038-01-09 03:14:07' UTC.
     For example, if a user is in the UTC+4 time zone and stores a TIMESTAMP as
     '2018-04-11 09:00:00', someone in the UTC time zone will see this data as
     '2018-04-11 05:00:00'.
*/

# Column Constraints
/*
  1) Not Null - specifies that a column cannot be empty. In other words, it must have a 
     value for all rows.
  
  2) UNIQUE - specifies that all values in the column must be unique.
  
  3) DEFAULT - sets a default value for coulmn when no value is specified.
  
  4) Primary Key - It uniquely identifies each row in a table.
  
  5) Foreign Key - It is a column (or a collection of columns) in one table that links to
     the primary key in another table.
     
  6) Auto Increment - specifies that the values for this column should be automatically 
     increase by 1 for each new record.
     
  7) A UNIQUE constraint is the rule that the values of a key are valid only if they are unique.
     For example,
	 CREATE TABLE Students ( 	  Create table with a single field as unique 
		ID INT NOT NULL UNIQUE
		Name VARCHAR(255)
     );

     CREATE TABLE Students ( 	  Create table with multiple fields as unique 
		ID INT NOT NULL
		LastName VARCHAR(255)
		FirstName VARCHAR(255) NOT NULL
		CONSTRAINT PK_Student
		UNIQUE (ID, FirstName)
	 );
  
  8) 
	 For example,
     CREATE TABLE Students ( 	  Create table with multiple fields as unique 
		ID INT NOT NULL
		LastName VARCHAR(255)
		FirstName VARCHAR(255) NOT NULL
		CONSTRAINT PK_Student
		CONSTRAINT mm_constraint UNIQUE (ID, FirstName)
	 );
*/

# Creating Tables
CREATE TABLE co_employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
    em_name VARCHAR(255) NOT NULL,
    gender CHAR(1) NOT NULL,
    contact_number VARCHAR(255),
    age INT NOT NULL,
    date_created TIMESTAMP NOT NULL DEFAULT NOW()
);

# Clauses ON DELETE or ON UPDATE
/*
  1) CASCADE:- If a certain employee is deleted from the co-employee table 
     (the parent table), any record of that employee in the mentorships table will also be
     deleted.
     
  2) RESTRICT:- The row in the parent table cannot be deleted if a row in the child 
     table references that parent row.
     
  3) SET NULL:- The child row foreign key value will be set to NULL if the parent row is 
     deleted. For this to work, the relevant column in the child row must allow for NULL values.
     
  4) SET DEFAULT:- The child row foreign key value will be set to the default value 
     if the parent row is deleted.
*/

CREATE TABLE mentorships (
	mentor_id INT NOT NULL,
    mentee_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    project VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (mentor_id, mentee_id, project),
    CONSTRAINT fk1 FOREIGN KEY(mentor_id) REFERENCES
    co_employee(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT fk2 FOREIGN KEY(mentee_id) REFERENCES
    co_employee(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT mm_constraint UNIQUE(mentor_id, mentee_id)
);

/*
  So Far we learn to create table:-
  1) Specify the columns by stating their names, data types and constraints (if any)
  2) Specify any table constraints that the table must fulfill
*/

# Modifying Table Name
RENAME TABLE co_employee to employees;


# Columns and Table Constraints
/*
  ALTER TABLE table_name
  
  followed by
  
  1) AUTO_INCREMENT = starting_value to change the starting value of the auto increment column
  
  2) ADD CONSTRAINT [name of constraint] details_of_constraint to add a table constraint
     to add a table constraint (including foreign key constraint)

  3) DROP INDEX name_of_constraint to drop a table constraint (excluding foreign key constraints)
  
  4) DROP FOREIGN KEY name_of_foreign_key to drop a foreign key constraint
  
  5) MODIFY COLUMN column_name data_type [constraints] to modify a column
  
  6) DROP COLUMN column_name to drop a column
  
  7) ADD COLUMN column_name data_type [constraints] to add a column
*/

# Modify the employees table 
/*
  1) Drop the age column
  2) Add another column called salary which is of FLOAT type and cannot be null.
     This column should come after the contact_number column
  3) Add a new column called years_in_company which is of INT type and cannot be null.
     This column should come after the salary column
*/

ALTER TABLE employees
	DROP COLUMN age,
    ADD COLUMN salary FLOAT NOT NULL AFTER contact_number,
    ADD COLUMN years_in_company INT NOT NULL AFTER salary;
    
DESC employees;

# Modify mentorships table
/*
  1) Modify fk2 by changing ON UPDATE RESTRICT to ON UPDATE CASCADE
  2) Drop the mm_constraint constraint
*/

ALTER TABLE mentorships
	DROP foreign key FK2;
    
# NOTE: We are not allowed to to drop and add a foreign key with the same name using a
#       single ALTER statement.

# Using a new ALTER statement, we add the foreign key back with the modified condition.

ALTER TABLE mentorships
	ADD CONSTRAINT fk2 FOREIGN KEY(mentee_id) REFERENCES
    employees(id) ON DELETE CASCADE ON UPDATE CASCADE,
    DROP INDEX mm_constraint;
        

# Deleting Tables
# DROP TABLE [IF EXISTS] table_name;

# For example, if we want to delete a table called demo
# DROP TABLE IF EXISTS demp;