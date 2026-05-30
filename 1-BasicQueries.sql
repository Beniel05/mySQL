# After executing the 'init-mysql-mydatabase.sql' dataset

USE mydatabase;
SHOW TABLES;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM customers WHERE score > 350 AND score IS NOT NULL;

SELECT * FROM orders;

SELECT 
	first_name,
	country,
	score
FROM customers;

SELECT * FROM customers WHERE score != 0;
SELECT * FROM customers WHERE country = 'germany';

SELECT first_name, country
FROM customers
WHERE country = 'germany';

SELECT * 
FROM customers
ORDER BY score DESC;

SELECT *
FROM customers
ORDER BY score ASC;

SELECT *
FROM customers
ORDER BY country ASC, score DESC;

SELECT 
	country,
	SUM(score) as totalScore
FROM customers
GROUP BY country;

SELECT country FROM customers GROUP BY country;

# Find the total score and total number of customers for each country.
SELECT
	country,
    SUM(score) AS totalScore,
    COUNT(id) AS numberOfCustomers
FROM customers
GROUP BY country;

SELECT first_name, COUNT(first_name) AS totalUsers FROM customers GROUP BY first_name;
SELECT country, COUNT(score) FROM customers GROUP BY country;

# Find the average score for EACH COUNTRY
# considering only customers with a SCORE NOT EQUAL TO 0
# and return only those countries with an average score greater than 430
SELECT 
	country,
	AVG(score) AS averageScore
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

SELECT DISTINCT country FROM customers
LIMIT 2;

# Retrive only 3 Customers
SELECT * FROM customers
LIMIT 3;

# Retrieve the Top 3 Customers with the Highest Scores
SELECT * FROM customers
ORDER BY score DESC
LIMIT 3;

# Retrieve the Lowest 2 Customers based on the Score
SELECT * FROM customers
-- WHERE score > 0 -- (if we want score more than 0)
ORDER BY score ASC
LIMIT 2;

# Get the Two Most Recent Orders
show tables;
SELECT * FROM orders;
-- Solution;
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 2;