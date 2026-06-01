# SQL DML (Data Manipulation Language)

DML stands for **Data Manipulation Language**.

It is used to manipulate the data stored inside tables.

## Main DML Commands

| Command  | Purpose                         |
| -------- | ------------------------------- |
| INSERT   | Add new records                 |
| UPDATE   | Modify existing records         |
| DELETE   | Delete specific records         |
| TRUNCATE | Delete all records from a table |

---

# INSERT

Used to add new rows into a table.

## Basic Syntax

```sql
INSERT INTO table_name(column1, column2)
VALUES(value1, value2);
```

---

## Insert All Columns

```sql
INSERT INTO customers(id, first_name, country, score)
VALUES(1, 'Ben', 'India', 100);
```

---

## Insert Multiple Rows

```sql
INSERT INTO customers(id, first_name, country, score)
VALUES
    (2, 'Sam', 'USA', 200),
    (3, 'Anna', 'UK', 150);
```

---

## Insert Without Specifying All Columns

```sql
INSERT INTO customers(id, first_name)
VALUES(4, 'Max');
```

### Notes

* Unspecified columns become `NULL` by default.
* Columns with `NOT NULL` constraint cannot be skipped.

---

## Insert Using Table Order

```sql
INSERT INTO customers
VALUES(5, 'Andreas', 'Germany', 300);
```

### Important

When column names are not specified:

* SQL follows the table's column order.
* Values must match the exact column sequence.

---

# INSERT INTO SELECT

Used to copy data from one table to another.

## Syntax

```sql
INSERT INTO target_table(column1, column2)
SELECT column1, column2
FROM source_table;
```

---

## Example

```sql
INSERT INTO persons(id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'Unknown'
FROM customers;
```

### Notes

* `NULL` is a static value.
* `'Unknown'` is also a static value.
* All selected values must match target column data types.

---

# UPDATE

Used to modify existing records.

## Basic Syntax

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

---

## Update Single Column

```sql
UPDATE customers
SET score = 0
WHERE id = 6;
```

---

## Update Multiple Columns

```sql
UPDATE customers
SET score = 100,
    country = 'UK'
WHERE id = 10;
```

---

## Update NULL Values

```sql
UPDATE customers
SET score = 0
WHERE score IS NULL;
```

---

## Important Warning

```sql
UPDATE customers
SET score = 0;
```

Without `WHERE`, ALL rows will be updated.

---

# SQL_SAFE_UPDATES

MySQL Workbench sometimes blocks updates/deletes without a key column condition.

## Disable Safe Update Mode

```sql
SET SQL_SAFE_UPDATES = 0;
```

### Meaning

Temporarily disables safe update restrictions.

---

## Enable Safe Update Mode

```sql
SET SQL_SAFE_UPDATES = 1;
```

### Meaning

Enables safe update restrictions again.

---

# DELETE

Used to remove specific rows from a table.

## Basic Syntax

```sql
DELETE FROM table_name
WHERE condition;
```

---

## Delete Specific Rows

```sql
DELETE FROM customers
WHERE id > 5;
```

---

## Important Warning

```sql
DELETE FROM customers;
```

Without `WHERE`, ALL rows will be deleted.

---

# TRUNCATE

Deletes all rows from a table very quickly.

## Syntax

```sql
TRUNCATE TABLE table_name;
```

---

## Example

```sql
TRUNCATE TABLE persons;
```

### Notes

* Deletes all records.
* Keeps the table structure.
* Faster than DELETE.
* Cannot use WHERE with TRUNCATE.

---

# DELETE vs TRUNCATE

| DELETE                       | TRUNCATE                |
| ---------------------------- | ----------------------- |
| Deletes selected rows        | Deletes all rows        |
| Can use WHERE                | Cannot use WHERE        |
| Slower                       | Faster                  |
| Can rollback (depends on DB) | Usually cannot rollback |
| Keeps auto increment value   | Resets auto increment   |

---

# NULL Handling

## Check NULL Values

```sql
SELECT *
FROM customers
WHERE score IS NULL;
```

---

## Check NOT NULL Values

```sql
SELECT *
FROM customers
WHERE score IS NOT NULL;
```

---

# Useful Commands

## Show All Tables

```sql
SHOW TABLES;
```

---

## Describe Table Structure

```sql
DESC customers;
```

OR

```sql
DESCRIBE customers;
```

---

## Show Current Database

```sql
SELECT DATABASE();
```

---

## Change Database

```sql
USE mydatabase;
```

---

# ALTER TABLE

Used to modify an existing table structure.

---

## Add New Column

```sql
ALTER TABLE customers
ADD email VARCHAR(100);
```

---

## Modify Column

```sql
ALTER TABLE persons
MODIFY birth_date DATE;
```

---

## Rename Column

```sql
ALTER TABLE customers
RENAME COLUMN first_name TO customer_name;
```

---

## Drop Column

```sql
ALTER TABLE customers
DROP COLUMN email;
```

---

# Constraints

## PRIMARY KEY

Uniquely identifies each row.

```sql
id INT PRIMARY KEY
```

---

## NOT NULL

Does not allow NULL values.

```sql
name VARCHAR(50) NOT NULL
```

---

## UNIQUE

Does not allow duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

---

## DEFAULT

Provides a default value.

```sql
score INT DEFAULT 0
```

---

# Notes

* SQL keywords are case-insensitive.
* Use uppercase SQL keywords for readability.
* Always use `WHERE` carefully in UPDATE and DELETE.
* `NULL` is different from `0` or empty string `''`.
* `TRUNCATE` removes all rows but keeps the table structure.
* `INSERT INTO SELECT` is useful for copying data between tables.

---