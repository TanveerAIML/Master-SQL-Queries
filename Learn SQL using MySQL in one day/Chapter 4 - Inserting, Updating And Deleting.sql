# Inserting Data

INSERT INTO employees (em_name, gender, contact_number, salary, years_in_company) VALUES
					  ('James Lee', 'M', '516-514-6568', 3500, 11),
                      ('Peter Pasternak', 'M', '845-644-7919', 6010, 10),
                      ('Clara Couto', 'F', '845-641-5236', 3900, 8),
                      ('Walker Welch', 'M', NULL, 2500, 4),
                      ('Li Xiao Ting', 'F', '646-218-7733', 5600, 4),
                      ('Joyce Jones', 'F', '523-172-2191', 8000, 3),
                      ('Jason Cerrone', 'M', '725-441-7172', 7980, 2),
                      ('Prudence Phelps', 'F', '546-312-5112', 11000, 2),
                      ('Larry Zucker', 'M', '817-267-9799', 3500, 1),
                      ('Serena Parker', 'F', '621-211-7342', 12000, 1);
                      
SELECT * FROM employees;

INSERT INTO mentorships (mentor_id, mentee_id, status, project) VALUES
						(1, 2, 'Ongoing', 'SQF Limited'),
                        (1, 3, 'Past', 'Wayne Fibre'),
                        (2, 3, 'Ongoing', 'SQF Limited'),
                        (3, 4, 'Ongoing', 'SQF Limited'),
                        (6, 5, 'Past', 'Flynn Tech');
                        
SELECT * FROM mentorships;


# Updating Data
# Changing the contact number of James Lee from '516-514-6568' to '516-514-1729'
UPDATE employees
SET contact_number = '516-514-1729'
WHERE id = 1;


# Deleting Data
# Delete 'Li Xiao Ting' (id = 5) from the employees table
DELETE FROM employees
WHERE id = 5;
