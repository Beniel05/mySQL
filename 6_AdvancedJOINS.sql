# ADVANCED JOINS;
# LEFT ANTI JOIN | RIGHT ANTI JOIN | FULL ANTI JOIN | CROSS JOINS

USE mydatabase;
SHOW TABLES;

SELECT * FROM customers;
SELECT * FROM orders;

# LEFT ANTI JOIN: Returns ONLY rows from table A that DO NOT have a matching row in table B
-- SYNTAX;
# SELECT *
# FROM A
# LEFT JOIN B
# ON A.key = B.key
# WHERE B.key IS NULL;
-- This returns records from A that have no matching record in B
-- Example: Find inactive customers (customers who never placed an order)

#### LEFT ANTI JOIN
## TASK: Get all customers who HAVEN'T PLACED ANY ORDER

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

# RIGHT ANTI JOIN: Returns ONLY rows from table B that DO NOT have a matching row in table A
-- SYNTAX;
# SELECT *
# FROM A
# RIGHT JOIN B
# ON A.key = B.key
# WHERE A.key IS NULL;
-- This returns records from B that have no matching record in A
-- Example: Find orphan orders (orders that do not belong to any customer)

#### RIGHT ANTI JOIN
## TASK: Get all order WITHOUT MATCHING CUSTOMERS
SELECT * 
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- SAME ABOVE TASK WITHOUT RIGHT ANTI JOIN (using LEFT ANTI JOIN )
-- Just switch table positions
## TASK: Get all orders without matching customers (USING LEFT JOIN)

SELECT * 
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL;


#### FULL ANTI JOIN: Returns ONLY rows that exist in ONE table but NOT in BOTH tables

-- SYNTAX;
# SELECT *
# FROM A
# LEFT JOIN B
# ON A.key = B.key
# WHERE B.key IS NULL

# UNION

# SELECT *
# FROM A
# RIGHT JOIN B
# ON A.key = B.key
# WHERE A.key IS NULL;

-- This returns non-matching records from both tables
-- Example: Find inactive customers and orphan orders

## TASK: Find customers WITHOUT ORDERS and orders WITHOUT CUSTOMERS

SELECT * 
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL 

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON o.customer_id = c.id
WHERE c.id IS NULL; 

/*
INNER JOIN → Matching records only
LEFT ANTI JOIN  → A - B
-- (Inactive customers)
RIGHT ANTI JOIN → B - A
-- (Orphan orders)
FULL ANTI JOIN  → (A - B) + (B - A)
-- (Inactive customers + Orphan orders)
FULL ANTI JOIN → Find records that exist in only one table and not the other.
*/


