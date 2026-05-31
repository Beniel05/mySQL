# DML stands for DATA MANIPULATION LANGUAGE
-- INSERT, UPDATE, DELETE, TRUNCATE

/* # MANUAL INSERTION */

use mydatabase;
SELECT * FROM customers;
 
-- if we're going to add add column no need to specify all columns
-- we can just use - INSERT INTO COLUMN_NAME VALUES()

INSERT INTO customers (id, first_name, country, score) -- for learning purpose i add all columns
VALUES
	(6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100);
    
SELECT * FROM customers;

-- Sql will follow that specified column order;
INSERT INTO customers (id, first_name, country, score)
VALUES 
	(8, 'USA', 'MAX', NULL);
    -- First name: USA, Country: MAX
    -- because both having varchar this will not arise any error

INSERT INTO customers
VALUES
	(9, 'Andreas', 'Germany', NULL);
    -- table's column order will the followed while inserting this data;
    
SELECT * FROM customers;

# If only want to add 2 values and others are null;
INSERT INTO customers (id, first_name) -- country and score will be NULL by default
VALUES
	(10, 'Sahra');
    
SELECT * FROM customers;

### we can't skip the column which is set to be NOT NULL in DDL (eg: id in this customers table).


/* # INSERTION USING SELECT */

# Copy data from CUSTOMERS table into PERSONS
-- Source table: CUSTOMERS

SELECT * FROM PERSONS; -- There is no persons table right now
-- so lets create the PERSONS table;
CREATE TABLE persons (
	id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY(id)
);

SELECT * FROM persons; -- now we get an empty table with 4 specified columns
# Since all the columns in the persons table;
-- id, person_name, phone - can't be NULL. ONLY birth_date can be null.
-- So while copy from the source table except the birth_date column - no other column can't be having null values.
-- we need to add condition while selecting from the SOURCE table.

SELECT * FROM customers; -- SOURCE
SELECT * FROM persons; -- wants to store the valid data from the SOURCE

-- customers (id, first_name, country, score) only is NOT NULL (PK)
-- persons (id, person_name, birth_date, phone) only birth_date can be NULL.

INSERT INTO persons(id, person_name, birth_date, phone)
SELECT
	id, 
    first_name, -- to person_name
    NULL, -- birth_date
    'Unknown' -- (varchar) to phone - since we have only (int) score in the source table customers
	-- this Unknown is a static value - all rows in that 4th column (phone) will have the same value - Unkown
FROM customers;

SELECT * FROM customers; -- Source table
SELECT * FROM persons; -- Value Copied Table from the Source Table


/* # UPDATE (used to modify the existing data values/rows) */

-- Syntax:
# UPDATE table_name
# SET column1 = value1,
#	  column2 = value2
# WHERE <condition>

## Task: Change the SCORE of customer with ID 6 to 0.
SELECT * FROM customers;

UPDATE customers
SET score = 0 -- if we execute after score = 0; // This static score will be applied to all the records (rows)
WHERE id = 6;

SELECT * FROM customers WHERE id = 6;

# TASK: Change the SCORE of customer with ID 10 to 0,
# and update the country to 'UK'.

SELECT * FROM customers;

UPDATE customers
SET score = 0, country = 'UK'
WHERE id = 10;

SELECT * FROM customers;

# TASK: Update all customers with a NULL score
# by setting their score to 0.

SELECT * FROM customers;

SET SQL_SAFE_UPDATES = 0; -- Disables safe update mode temporarily.

UPDATE customers
SET score = 0
WHERE score IS NULL;

SET SQL_SAFE_UPDATES = 1; -- Enables safe update mode again.

SELECT * FROM customers;


/* # DELETE (used to delete the existing records) */

-- Syntax:
# DELETE FROM table_name
# WHERE <condition>

# TASK: DELETE all customers with an ID GREATER THAN 5

SELECT * FROM customers WHERE id > 5; -- checking before Deleting

DELETE FROM customers -- without the WHERE all the rows of that table will be deleted.
WHERE id > 5;

SELECT * FROM customers;

# TASK: DELETE all data from the PERSONS TABLE

SELECT * FROM persons;

TRUNCATE TABLE persons; -- Truncate will delete all the records but have that table's structure (columns).

SELECT * FROM persons;
