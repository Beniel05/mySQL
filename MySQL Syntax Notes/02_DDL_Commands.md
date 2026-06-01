# DDL Commands (Data Definition Language)

| Command  | Purpose                            |
| -------- | ---------------------------------- |
| CREATE   | Create database objects            |
| ALTER    | Modify existing database objects   |
| DROP     | Delete database objects            |
| TRUNCATE | Delete all records from a table    |
| RENAME   | Rename database objects            |

## Create Table

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype
);
```

### Example

```sql
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT
);
```

---

## Show Tables

```sql
SHOW TABLES;
```

---

## Describe Table

```sql
DESC table_name;
```

OR

```sql
DESCRIBE table_name;
```

---

## Alter Table

### Add Column

```sql
ALTER TABLE table_name
ADD column_name datatype;
```

### Example

```sql
ALTER TABLE students
ADD email VARCHAR(100);
```

---

### Drop Column

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

### Example

```sql
ALTER TABLE students
DROP COLUMN email;
```

---

### Modify Column Datatype

```sql
ALTER TABLE table_name
MODIFY COLUMN column_name new_datatype;
```

### Example

```sql
ALTER TABLE students
MODIFY COLUMN name VARCHAR(100);
```

---

### Rename Column

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

### Example

```sql
ALTER TABLE students
RENAME COLUMN name TO student_name;
```

---

### Rename Table

```sql
ALTER TABLE old_table_name
RENAME TO new_table_name;
```

---

## Drop Table

```sql
DROP TABLE table_name;
```

---

## Truncate Table

Deletes all records but keeps table structure.

```sql
TRUNCATE TABLE table_name;
```