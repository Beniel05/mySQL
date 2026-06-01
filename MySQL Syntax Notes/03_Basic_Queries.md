# SQL Query Execution Order

Even though we write SQL queries in one order, SQL executes them internally in another order.

## Coding Order vs Execution Order

| Coding Order (How We Write) | Execution Order (How SQL Runs) |
| --------------------------- | ------------------------------ |
| 1. SELECT                   | 1. FROM                        |
| 2. DISTINCT                 | 2. WHERE                       |
| 3. Column Names             | 3. GROUP BY                    |
| 4. FROM                     | 4. HAVING                      |
| 5. WHERE                    | 5. SELECT                      |
| 6. GROUP BY                 | 6. DISTINCT                    |
| 7. HAVING                   | 7. ORDER BY                    |
| 8. ORDER BY                 | 8. LIMIT                       |
| 9. LIMIT                    |                                |

---

## Example Query

```sql
SELECT department, COUNT(*)
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY department
LIMIT 5;
```

---

## Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT

---

## How SQL Executes It

### 1. FROM

Chooses the table.

```sql
FROM employees
```

### 2. WHERE

Filters rows before grouping.

```sql
WHERE salary > 30000
```

### 3. GROUP BY

Groups rows with same values.

```sql
GROUP BY department
```

### 4. HAVING

Filters grouped data.

```sql
HAVING COUNT(*) > 2
```

### 5. SELECT

Chooses columns to display.

```sql
SELECT department, COUNT(*)
```

### 6. ORDER BY

Sorts the final result.

```sql
ORDER BY department
```

### 7. LIMIT

Limits number of rows returned.

```sql
LIMIT 5
```

---

# Basic Query Syntax

## Select All Columns

```sql
SELECT * FROM table_name;
```

---

## Select Specific Columns

```sql
SELECT column1, column2
FROM table_name;
```

---

## Where Clause

```sql
SELECT *
FROM table_name
WHERE condition;
```

### Example

```sql
SELECT *
FROM students
WHERE age > 18;
```

---

## AND Operator

```sql
SELECT *
FROM table_name
WHERE condition1 AND condition2;
```

---

## OR Operator

```sql
SELECT *
FROM table_name
WHERE condition1 OR condition2;
```

---

## NOT Operator

```sql
SELECT *
FROM table_name
WHERE NOT condition;
```

---

## DISTINCT

Removes duplicate values.

```sql
SELECT DISTINCT column_name
FROM table_name;
```

---

## ORDER BY

### Ascending Order (Default)

```sql
SELECT *
FROM table_name
ORDER BY column_name ASC;
```

### Descending Order

```sql
SELECT *
FROM table_name
ORDER BY column_name DESC;
```

---

## LIMIT

```sql
SELECT *
FROM table_name
LIMIT number;
```

### Example

```sql
SELECT *
FROM students
LIMIT 5;
```

---

# Aggregate Functions

## COUNT()

```sql
SELECT COUNT(column_name)
FROM table_name;
```

---

## SUM()

```sql
SELECT SUM(column_name)
FROM table_name;
```

---

## AVG()

```sql
SELECT AVG(column_name)
FROM table_name;
```

---

## MIN()

```sql
SELECT MIN(column_name)
FROM table_name;
```

---

## MAX()

```sql
SELECT MAX(column_name)
FROM table_name;
```

---

# GROUP BY

Groups rows with same values.

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
```

### Example

```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department;
```

---

# HAVING Clause

Used with GROUP BY to filter grouped data.

```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

### Example

```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;
```

---

# Aliases

## Column Alias

```sql
SELECT column_name AS alias_name
FROM table_name;
```

### Example

```sql
SELECT name AS student_name
FROM students;
```

---

# Notes

* SQL keywords are case-insensitive.
* Use semicolon `;` after every query.
* Use uppercase for SQL keywords for better readability.
* `WHERE` filters rows before grouping.
* `HAVING` filters rows after grouping.

---
