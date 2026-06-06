# Important Note About FULL JOIN in MySQL

## Does MySQL Support FULL JOIN?

No.

MySQL does not provide a built-in:

```sql
FULL JOIN
```

keyword like PostgreSQL or SQL Server.

To achieve FULL JOIN behavior in MySQL, we combine:

```sql
LEFT JOIN
```

and

```sql
RIGHT JOIN
```

using a set operator.

---

## Why UNION is Used?

A FULL JOIN should return:

* Matching rows from both tables
* Rows that exist only in the left table
* Rows that exist only in the right table

To get all of these records:

```sql
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id

UNION

SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.id = o.customer_id;
```

---

## UNION vs UNION ALL

### UNION

```sql
SELECT ...
UNION
SELECT ...
```

Removes duplicate rows automatically.

---

### UNION ALL

```sql
SELECT ...
UNION ALL
SELECT ...
```

Keeps duplicate rows.

No duplicate checking is performed.

---

## Why UNION is Slower Than UNION ALL

### UNION

After combining results, MySQL must:

1. Compare every row
2. Detect duplicates
3. Remove duplicates
4. Return final result

Extra work = Slower

---

### UNION ALL

After combining results:

1. Return everything immediately

No duplicate checking.

Less work = Faster

---

## Simple Example

### UNION

```sql
SELECT 'A'
UNION
SELECT 'A';
```

Result:

```text
A
```

Duplicate removed.

---

### UNION ALL

```sql
SELECT 'A'
UNION ALL
SELECT 'A';
```

Result:

```text
A
A
```

Duplicates preserved.

---

## Real World Example

### E-Commerce Website

Tables:

```text
customers
orders
```

Business Requirement:

Show

* Customers who placed orders
* Customers who never ordered
* Orders whose customer record is missing

This requires FULL JOIN behavior.

```sql
SELECT *
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id

UNION

SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.id = o.customer_id;
```

---

### Employee Management System

Tables:

```text
employees
departments
```

Requirement:

Show

* Employees assigned to departments
* Employees without departments
* Departments without employees

A FULL JOIN is needed.

---

## Industry Tip

For FULL JOIN simulation:

```sql
UNION
```

is usually preferred because matching rows appear in both joins and duplicates must be removed.

Using:

```sql
UNION ALL
```

may produce duplicate matching rows.

Therefore:

```sql
LEFT JOIN + RIGHT JOIN + UNION
```

is the standard FULL JOIN implementation in MySQL.

---

# FULL JOIN

## Definition

Returns:

* All matching rows
* All customers without orders
* All orders without customers

---

## MySQL FULL JOIN

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

## Why UNION Instead of UNION ALL?

Matching rows appear in:

```text
LEFT JOIN Result
```

and

```text
RIGHT JOIN Result
```

Using:

```sql
UNION ALL
```

would return those matching rows twice.

Using:

```sql
UNION
```

removes duplicates and gives true FULL JOIN behavior.

---

## Visualization

```text
LEFT JOIN
+
RIGHT JOIN
-
Duplicate Matches
=
FULL JOIN
```
