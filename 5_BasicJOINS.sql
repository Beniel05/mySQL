# BASIC JOINS;
# INNER | LEFT | RIGHT | FULL | NO JOINS

# ADVANCED JOINS;
# LEFT ANTI | RIGHT ANTI | FULL ANTI | CROSS JOINS

-- When to use JOINS (or) Why we need JOINS;
# 1. Recombine Data "Big Picture"
# 2. Data Enrichment "Extra Info"
# 3. Check Existence "Filtering"

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

SELECT * FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;