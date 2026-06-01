# SQL DML Quick Recall Table

| Command            | Purpose                           | Example                                                                         |
| ------------------ | --------------------------------- | ------------------------------------------------------------------------------- |
| INSERT             | Add new rows                      | `INSERT INTO customers VALUES(1, 'Ben', 'India', 100);`                         |
| INSERT INTO SELECT | Copy data from another table      | `INSERT INTO persons SELECT * FROM customers;`                                  |
| UPDATE             | Modify existing rows              | `UPDATE customers SET score = 0 WHERE id = 1;`                                  |
| DELETE             | Delete specific rows              | `DELETE FROM customers WHERE id = 1;`                                           |
| TRUNCATE           | Delete all rows quickly           | `TRUNCATE TABLE customers;`                                                     |
| ALTER TABLE ADD    | Add new column                    | `ALTER TABLE customers ADD email VARCHAR(100);`                                 |
| ALTER TABLE MODIFY | Modify column datatype/constraint | `ALTER TABLE persons MODIFY birth_date DATE;`                                   |
| ALTER TABLE DROP   | Remove column                     | `ALTER TABLE customers DROP COLUMN email;`                                      |
| SELECT             | Fetch data                        | `SELECT * FROM customers;`                                                      |
| WHERE              | Filter rows                       | `SELECT * FROM customers WHERE score > 100;`                                    |
| ORDER BY           | Sort rows                         | `SELECT * FROM customers ORDER BY score DESC;`                                  |
| LIMIT              | Restrict number of rows           | `SELECT * FROM customers LIMIT 5;`                                              |
| DISTINCT           | Remove duplicates                 | `SELECT DISTINCT country FROM customers;`                                       |
| GROUP BY           | Group similar rows                | `SELECT country, COUNT(*) FROM customers GROUP BY country;`                     |
| HAVING             | Filter grouped data               | `SELECT country, COUNT(*) FROM customers GROUP BY country HAVING COUNT(*) > 1;` |
| COUNT()            | Count rows                        | `SELECT COUNT(*) FROM customers;`                                               |
| SUM()              | Sum values                        | `SELECT SUM(score) FROM customers;`                                             |
| AVG()              | Average value                     | `SELECT AVG(score) FROM customers;`                                             |
| MIN()              | Smallest value                    | `SELECT MIN(score) FROM customers;`                                             |
| MAX()              | Largest value                     | `SELECT MAX(score) FROM customers;`                                             |
| IS NULL            | Check NULL values                 | `SELECT * FROM customers WHERE score IS NULL;`                                  |
| IS NOT NULL        | Check NOT NULL values             | `SELECT * FROM customers WHERE score IS NOT NULL;`                              |
| SHOW TABLES        | Show all tables                   | `SHOW TABLES;`                                                                  |
| DESC               | Show table structure              | `DESC customers;`                                                               |
| USE                | Change database                   | `USE mydatabase;`                                                               |
| SQL_SAFE_UPDATES   | Enable/disable safe mode          | `SET SQL_SAFE_UPDATES = 0;`                                                     |
