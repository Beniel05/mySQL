# BASIC JOINS;
# INNER | LEFT | RIGHT | FULL | NO JOINS

# ADVANCED JOINS;
# LEFT ANTI | RIGHT ANTI | FULL ANTI | CROSS JOINS

-- WHEN TO USE JOINS / WHY WE NEED JOINS;
# 1. Recombine Data (Get the "Big Picture")
#    Used when related data is stored in multiple tables.
#    Common Joins: INNER, LEFT, RIGHT, FULL

# 2. Data Enrichment (Add Extra Information)
#    Used when one table contains additional details.
#    Common Join: LEFT JOIN

# 3. Check Existence / Non-Existence (Filtering)
#    Used to find matching or non-matching records.
#    Common Joins:
#       INNER JOIN              --> Matching records only
#       LEFT JOIN + IS NULL     --> Non-matching records (LEFT ANTI JOIN)
#       LEFT JOIN + IS NOT NULL --> Matching records (LEFT SEMI JOIN)

######
USE mydatabase;
SHOW TABLES;

# TASK (NO JOIN): Retrieve all data from
# customers and orders as SEPARATE RESULTS;

SELECT * FROM customers;
SELECT * FROM orders;

# INNER JOIN: Returns ONLY MATCHING rows from BOTH tables
-- SYNTAX;
# SELECT *
# FROM A
# INNER JOIN B -- the default is INNER - mentioning is good practice
# ON A.key = B.key
-- This will return the matching records

# TASK (INNER JOIN): Get all customers along with their orders,
# but only for customers WHO HAVE PLACED AN ORDER.

SELECT * FROM customers; 
SELECT * FROM orders;

SELECT * FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

# Getting only specific columns;
SELECT id, first_name, o.order_id, o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;


## LEFT JOIN

# TASK: Get all customers along with their orders,
# INCLUDING THOSE WITHOUT ORDERS

SELECT c.id, c.first_name, o.order_id, o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

## RIGHT JOIN

# Get all customers along with their orders,
# including orders WITHOUT MATCHING CUSTOMERS;

SELECT c.id, c.first_name, o.order_id, o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;


## TASK;
# Get all customers along with their orders,
# including orders without matching customers
# (USING LEFT JOIN)
SELECT c.id, c.first_name, o.order_id, o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id;

# Right join is used rarely in the industry
# So with LEFT Join just switch the declaration of tables

## FULL JOIN

-- MySql don't have default keyword for FULL JOIN
-- we have to use set operation - UNION / UNION ALL to attain (FULL JOIN)

SELECT * FROM customers AS c LEFT JOIN orders AS o ON c.id = o.customer_id
UNION
SELECT * FROM customers AS c RIGHT JOIN orders AS o ON c.id = o.customer_id; 