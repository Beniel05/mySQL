# Selecting Columns After Joins

## Why This Matters

When joining tables, you can choose which table's columns to return.

This helps reduce unnecessary data and makes queries easier to read.

---

## Select All Columns From All Joined Tables

```sql
SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

### Returns

```text
All columns from customers
+
All columns from orders
```

---

## Select All Columns From One Table Only

### Customer Columns Only

```sql
SELECT c.*
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

### Returns

```text
All columns from customers table only
```

---

### Order Columns Only

```sql
SELECT o.*
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

### Returns

```text
All columns from orders table only
```

---

## Common Patterns

### Customers Who Have Orders (SEMI JOIN)

```sql
SELECT DISTINCT c.*
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

Returns:

```text
Customer records only
```

---

### Customers Without Orders (LEFT ANTI JOIN)

```sql
SELECT c.*
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;
```

Returns:

```text
Customer records only
```

---

## Quick Recall

| Syntax | Meaning                               |
| ------ | ------------------------------------- |
| `*`    | All columns from all tables           |
| `c.*`  | All columns from customers table only |
| `o.*`  | All columns from orders table only    |

---

## Best Practice

Use:

```sql
SELECT c.*
```

or

```sql
SELECT o.*
```

when you only need data from one table.

Avoid:

```sql
SELECT *
```

in production queries unless you genuinely need every column from every joined table.
