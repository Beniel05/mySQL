# DDL stands for DATA DEFINITION LANGUAGE
-- CREATE
-- ALTER
-- DROP
-- TRUNCATE
-- RENAME

USE mydatabase;

/* Create a new table called persons
with columns: id, person_name, birth_date, and phone */

CREATE TABLE persons (
	id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
	phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
);

SHOW TABLES;

SELECT * FROM persons;

# Add a NEW COLUMN called email to the persons table;
ALTER table persons
	ADD email VARCHAR(50) NOT NULL;
    
SELECT * FROM persons; -- email column added (after executing the alter command)

/* By default, ALTER TABLE ADD COLUMN adds the new column at the end of the table.
To place it in a specific position, use;
AFTER existing_column (eg: AFTER first_name)
or FIRST.
*/

# Remove the column phone from the persons table
ALTER TABLE persons
DROP COLUMN phone;

SELECT * FROM persons; -- after removing phone column from the existing table

## DELETE THE TABLE persons from the database
DROP TABLE persons;

SHOW TABLES;