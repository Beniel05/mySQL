# SQL Basic Joins

## SQL JOINS Quick Recall Table

| Join Type  | Returns                                                   | Matching Rows | Non-Matching Rows |
| ---------- | --------------------------------------------------------- | ------------- | ----------------- |
| INNER JOIN | Common records from both tables                           | ✅             | ❌                 |
| LEFT JOIN  | All rows from Left Table + matching rows from Right Table | ✅             | Left only ✅       |
| RIGHT JOIN | All rows from Right Table + matching rows from Left Table | ✅             | Right only ✅      |
| FULL JOIN  | All rows from both tables                                 | ✅             | Both sides ✅      |

---

> FULL JOIN is not a default keyword in mysql. So we need to use a SET operator. COVERED IN;
[How to use FULL JOIN in MySql](08_FULL_JOIN_inMySql.md) 

# Basic Joins

## INNER JOIN

-- Returns ONLY matching rows from both tables

### Syntax

```sql
SELECT *
FROM tableA
INNER JOIN tableB
ON tableA.id = tableB.id;
```

---

## LEFT JOIN

-- Returns ALL rows from Left Table
-- Returns matching rows from Right Table
-- Returns NULL when no match exists

### Syntax

```sql
SELECT *
FROM tableA
LEFT JOIN tableB
ON tableA.id = tableB.id;
```

---

## RIGHT JOIN

-- Returns ALL rows from Right Table
-- Returns matching rows from Left Table
-- Returns NULL when no match exists

### Syntax

```sql
SELECT *
FROM tableA
RIGHT JOIN tableB
ON tableA.id = tableB.id;
```

---

## FULL JOIN

-- Returns ALL rows from BOTH tables
-- Matching rows appear once
-- Non-matching rows from both sides are included

### MySQL

```sql
SELECT *
FROM tableA
LEFT JOIN tableB
ON tableA.id = tableB.id

UNION

SELECT *
FROM tableA
RIGHT JOIN tableB
ON tableA.id = tableB.id;
```

---

# Why We Need Joins

## 1. Recombine Data

-- Data is usually stored in multiple tables

Example:

```text
customers
orders
products
payments
```

Joins help combine them into one result.

---

## 2. Data Enrichment

-- Add extra information from another table

Example:

```text
orders table
```

Contains:

```text
customer_id
sales
```

Join with:

```text
customers table
```

To get:

```text
customer_name
country
sales
```

---

## 3. Check Existence

-- Find records that have matching records in another table

Example:

```text
Customers who placed orders
Orders that have valid customers
```

---

# Setup

```sql
USE mydatabase;

SHOW TABLES;
```

---

# No Join Example

## TASK

Retrieve all data from customers and orders as separate results

```sql
SELECT * FROM customers;

SELECT * FROM orders;
```

---

# INNER JOIN

## Definition

Returns ONLY customers who have placed an order.

---

## TASK

Get all customers along with their orders,
but only for customers who have placed an order.

```sql
SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

---

## Selecting Specific Columns

```sql
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

---

# LEFT JOIN

## Definition

Returns ALL customers.

If a customer has no order:

```text
order_id = NULL
sales = NULL
```

---

## TASK

Get all customers along with their orders,
including customers without orders.

```sql
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;
```

---

# RIGHT JOIN

## Definition

Returns ALL orders.

If an order has no matching customer:

```text
customer columns = NULL
```

---

## TASK

Get all customers along with their orders,
including orders without matching customers.

```sql
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;
```

---

# RIGHT JOIN Using LEFT JOIN

-- RIGHT JOIN is rarely used in industry

Instead, switch the table order and use LEFT JOIN.

```sql
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id;
```

---

# FULL JOIN

## Definition

Returns:

* All matching rows
* All customers without orders
* All orders without customers

---

## MySQL Full Join

```sql
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;
```

---

# Join Visualization

## INNER JOIN

```text
Customers ∩ Orders
```

Only matching records.

---

## LEFT JOIN

```text
Customers + Matching Orders
```

Everything from Customers.

---

## RIGHT JOIN

```text
Matching Customers + Orders
```

Everything from Orders.

---

## FULL JOIN

```text
Customers + Orders
```

Everything from both tables.

---

# Industry Usage Order

```text
1. INNER JOIN  ⭐⭐⭐⭐⭐
2. LEFT JOIN   ⭐⭐⭐⭐⭐
3. FULL JOIN   ⭐⭐
4. RIGHT JOIN  ⭐
```

Most real-world projects mainly use:

```text
INNER JOIN
LEFT JOIN
```

RIGHT JOIN is usually replaced by LEFT JOIN by swapping table positions.
