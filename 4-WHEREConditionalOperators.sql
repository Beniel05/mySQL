### WHERE Operators

# Comparison operators
-- ( =, <>, >, >=, <, <= )
-- Operators
-- =    Equal To
-- !=   Not Equal To
-- <>   Not Equal To
-- >    Greater Than
-- <    Less Than
-- >=   Greater Than or Equal To
-- <=   Less Than or Equal To

# Logical Operators
-- AND, OR, NOT

# Range Operator
-- BETWEEN

# Membership Operator
-- IN, NOT IN

# Search Operator
-- LIKE

###

# Comparison Operators
-- SYNTAX: <Expression> <Operator> <Expression>

-- Column = Column [first_name = last_name]
-- Column = Value [first_name = 'John']
-- Function = Value [UPPER(first_name) = 'JOHN']
-- Expression = Value [price * quantity = 1000]
-- Subquery = Value [(SELECT AVG(sales) FROM orders) = 1000]

USE mydatabase;
SHOW TABLES;

# TASK (=): Retrieve all customers from GERMANY
SELECT * FROM customers;
SELECT * FROM customers WHERE country = 'Germany';

# TASK (<> [or] !=): Retrieve all customers who are NOT FROM GERMANY
SELECT * FROM customers
WHERE country != 'Germany';
-- WHERE country <> 'Germany'; -- both statements work as NOT EQUAL TO

# TASK (>): Retrieve all customers with a score GREATER THAN 500
SELECT * FROM customers
WHERE score > 500;

# TASK (>=): Retrieve all customer with a SCORE OF 500 OR MORE
SELECT * FROM customers
WHERE score >= 500;

# TASK (<): Retrieve all customers with a SCORE LESS THAN 500
SELECT * FROM customers
WHERE score < 500;

# TASK (<=): Retrieve all customers with a SCORE of 500 or less
SELECT * FROM customers
WHERE score <= 500;


# Logical Operators (AND, OR, NOT)

# TASK (AND): Retrieve all customers
# who are from the USA AND
# have a score greater than 500
SELECT * FROM customers
WHERE country = 'USA' and score > 500;

# TASK (OR): Retrieve all customers
# who are either from USA OR
# have a score greater than 500
SELECT * FROM customers
WHERE country = 'USA' OR score > 500;

# TASK (NOT): Retrieve all customers
# with a score NOT less than 500
SELECT * FROM customers
WHERE NOT score < 500;


# Range Operator (BETWEEN)
-- BETWEEN wants a range and that range is inclusive!. eg: score between 100 and 500

# TASK (BETWEEN): Retrieve all customers
# whose score falls in the RANGE
# BETWEEN 100 AND 500
SELECT * FROM customers
WHERE score BETWEEN 100 AND 500;

-- without BETWEEN and using the RELATIONAL/COMPARISON operator;
SELECT * FROM customers
WHERE score >= 100 AND score <= 500;

# MEMBERSHIP Operator (IN [and] NOT IN)

# TASK (IN): Retrieve all customers from
# either Germany OR USA
SELECT * FROM customers
WHERE country IN ('Germany', 'USA');

# Without using IN;
SELECT * FROM customers
WHERE country = 'Germany' OR country = 'USA';

# TASK (NOT IN): Retrieve all the customers
# who are not from either Germany or USA
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'USA');


# SEARCH Operator (LIKE);

-- LIKE Operator
-- Used with WHERE to search patterns in text

-- Symbols:
-- %  -> Any number of characters (0, 1, or many)
-- _  -> Exactly one character

-- Examples

-- Starts with 'M'
-- M%
-- Maria
-- Martin
-- Maria Albert

-- Contains 'in'
-- %in%
-- Vin
-- Rayn

-- Ends with 'b'
-- %b
-- Rob
-- Jacob

-- Starts with '5'
-- 5%

-- Exactly 3 characters starting with 'A'
-- A__
-- Abel   ✓
-- Anna   ✓
-- Emma   ✗
-- Jasmine ✗

-- Exactly 3 characters ending with 'n'
-- __n

-- Contains 'a'
-- %a%

-- Matches:
-- a
-- Max
-- Harry
-- Maria

-- Does Not Match:
-- John
-- Peter

-- % can also represent zero characters
-- So even a single 'a' gets matched by %a%

-- Example Queries

-- WHERE name LIKE 'M%'
-- WHERE name LIKE '%in%'
-- WHERE name LIKE 'A__'
-- WHERE name LIKE '%a%'

# TASK (LIKE): Find all customers whose
# first name STARTS WITH 'M';
SELECT * FROM customers
WHERE first_name LIKE 'M%';

# TASK 2: Find all customers whose
# first name ENDS WITH 'n'
SELECT * FROM customers
WHERE first_name LIKE '%n';

# TASK 3: Find all customers whose
# first name CONTAINS 'r'
SELECT * FROM customers
WHERE first_name LIKE '%r%'; -- -- all customers who have 'r' in their first_name

# TASK ( _ ): Find all customers whose
# first name has 'r' IN THE THIRD POSITION
SELECT * FROM customers
WHERE first_name LIKE '__r%';
-- _ _ first two position can be anything,
-- 'r' in the third position,
-- after that anything is fine so -> %