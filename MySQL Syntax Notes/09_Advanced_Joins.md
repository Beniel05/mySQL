# SQL Advanced Joins (MySQL)

## What are Advanced Joins?

Advanced joins are special join patterns used to answer questions like:

```text
Who has placed an order?
Who has never placed an order?
Which records exist in one table but not another?
Return every possible combination of rows.
```

Most advanced joins are built using:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL JOIN (simulated in MySQL)
```

---

# LEFT ANTI JOIN

## Definition

Returns rows from the LEFT table that do NOT have a matching row in the RIGHT table.

### Visualization

```text
Customers - Orders
```

Keep only unmatched rows from the LEFT side.

---

## Syntax

```sql
SELECT c.*
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
```

---

## Example

Find customers who never placed an order.

```sql
SELECT c.*
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
```

---

## Industry Use Cases

```text
Customers without orders
Employees without departments
Students without enrollments
Products never sold
```

---

# RIGHT ANTI JOIN

## Definition

Returns rows from the RIGHT table that do NOT have a matching row in the LEFT table.

### Visualization

```text
Orders - Customers
```

Keep only unmatched rows from the RIGHT side.

---

## Syntax

```sql
SELECT o.*
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;
```

---

## Example

Find orders that do not belong to any customer.

```sql
SELECT o.*
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;
```

---

# Alternative To RIGHT ANTI JOIN

## Preferred Industry Approach

Instead of using RIGHT JOIN:

```sql
SELECT o.*
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;
```

Use LEFT JOIN by swapping table positions.

```sql
SELECT o.*
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL;
```

---

## Why?

```text
RIGHT JOIN is uncommon in production code.

Most SQL developers prefer:
LEFT JOIN + table swap
```

---

# FULL ANTI JOIN

## Definition

Returns rows that exist in ONLY one table.

Removes all matching rows.

### Visualization

```text
(A - B)
UNION
(B - A)
```

---

## MySQL Implementation

MySQL does not support FULL JOIN directly.

```sql
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;
```

---

## Result

Returns:

```text
Customers without orders
+
Orders without customers
```

Matching records are excluded.

---

# ADVANCED INNER JOIN (SEMI JOIN)

## Definition

Returns rows from the LEFT table that have a matching row in the RIGHT table.

Unlike a normal INNER JOIN, we usually return only LEFT table columns.

### Visualization

```text
Customers ∩ Orders
```

---

## Using INNER JOIN

```sql
SELECT DISTINCT c.*
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

---

## Using EXISTS (Preferred)

```sql
SELECT *
FROM customers AS c
WHERE EXISTS (
    SELECT 1
    FROM orders AS o
    WHERE c.id = o.customer_id
);
```

---

## Example

Find customers who have placed at least one order.

---

## Industry Use Cases

```text
Customers with orders
Students with enrollments
Products that were sold
Employees assigned to projects
```

---

# CROSS JOIN

## Definition

Returns every possible combination of rows from both tables.

### Formula

```text
Rows Returned

=
Rows in Table A
×

Rows in Table B
```

---

## Example

### customers

```text
John
Ben
Alice
```

### products

```text
Laptop
Phone
```

Result:

```text
John  Laptop
John  Phone
Ben   Laptop
Ben   Phone
Alice Laptop
Alice Phone
```

---

## Syntax

```sql
SELECT *
FROM customers
CROSS JOIN products;
```

---

## Alternative Syntax

```sql
SELECT *
FROM customers,
     products;
```

The explicit `CROSS JOIN` is preferred.

---

## Industry Use Cases

```text
Generate all possible combinations
Calendar generation
Test data creation
Product variants
Size × Color combinations
```

---

# Join Type Summary

| Join Type       | Returns                         |
| --------------- | ------------------------------- |
| INNER JOIN      | Matching rows only              |
| LEFT JOIN       | All left rows + matches         |
| RIGHT JOIN      | All right rows + matches        |
| FULL JOIN       | All rows from both tables       |
| LEFT ANTI JOIN  | Left rows without matches       |
| RIGHT ANTI JOIN | Right rows without matches      |
| FULL ANTI JOIN  | Unmatched rows from both tables |
| SEMI JOIN       | Rows that have a match          |
| CROSS JOIN      | Every possible combination      |

---

# Industry Usage Order

```text
1. INNER JOIN       ⭐⭐⭐⭐⭐
2. LEFT JOIN        ⭐⭐⭐⭐⭐
3. LEFT ANTI JOIN   ⭐⭐⭐⭐
4. SEMI JOIN        ⭐⭐⭐⭐
5. CROSS JOIN       ⭐⭐⭐
6. FULL ANTI JOIN   ⭐⭐
7. RIGHT JOIN       ⭐
8. RIGHT ANTI JOIN  ⭐
```

In real-world MySQL projects, the most commonly used patterns after basic joins are:

```text
INNER JOIN
LEFT JOIN
LEFT ANTI JOIN
EXISTS (SEMI JOIN)
```

These four cover the majority of reporting, analytics, and backend application queries.
