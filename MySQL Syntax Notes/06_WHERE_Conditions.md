# SQL WHERE Operators Quick Recall Table

| Operator Type | Operators | Purpose | Example |
|---|---|---|---|
| Comparison | = | Equal To | `WHERE country = 'Germany'` |
| Comparison | != / <> | Not Equal To | `WHERE country != 'USA'` |
| Comparison | > | Greater Than | `WHERE score > 500` |
| Comparison | >= | Greater Than or Equal To | `WHERE score >= 500` |
| Comparison | < | Less Than | `WHERE score < 500` |
| Comparison | <= | Less Than or Equal To | `WHERE score <= 500` |
| Logical | AND | Both conditions must be true | `WHERE country = 'USA' AND score > 500` |
| Logical | OR | Any one condition must be true | `WHERE country = 'USA' OR score > 500` |
| Logical | NOT | Negates a condition | `WHERE NOT score < 500` |
| Range | BETWEEN | Inclusive range | `WHERE score BETWEEN 100 AND 500` |
| Membership | IN | Match multiple values | `WHERE country IN ('USA', 'Germany')` |
| Membership | NOT IN | Exclude multiple values | `WHERE country NOT IN ('USA', 'Germany')` |
| Search | LIKE | Pattern matching | `WHERE first_name LIKE 'M%'` |
| LIKE Symbol | % | 0, 1, or many characters | `'%a%'` |
| LIKE Symbol | _ | Exactly one character | `'__r%'` |

---

# WHERE Operators

## Comparison Operators
-- ( =, <>, >, >=, <, <= )

### Operators

| Operator | Meaning |
|---|---|
| = | Equal To |
| != | Not Equal To |
| <> | Not Equal To |
| > | Greater Than |
| < | Less Than |
| >= | Greater Than or Equal To |
| <= | Less Than or Equal To |

---

## Logical Operators
-- AND, OR, NOT

---

## Range Operator
-- BETWEEN

---

## Membership Operator
-- IN, NOT IN

---

## Search Operator
-- LIKE

---

# Comparison Operators

-- SYNTAX:
```sql
<Expression> <Operator> <Expression>
```

### Examples

```sql
-- Column = Column
first_name = last_name

-- Column = Value
first_name = 'John'

-- Function = Value
UPPER(first_name) = 'JOHN'

-- Expression = Value
price * quantity = 1000

-- Subquery = Value
(SELECT AVG(sales) FROM orders) = 1000
```

---

```sql
USE mydatabase;

SHOW TABLES;
```

---

## TASK (=)
Retrieve all customers from Germany

```sql
SELECT * FROM customers
WHERE country = 'Germany';
```

---

## TASK (!= or <>)
Retrieve all customers who are NOT from Germany

```sql
SELECT * FROM customers
WHERE country != 'Germany';

-- WHERE country <> 'Germany';
-- both statements work as NOT EQUAL TO
```

---

## TASK (>)
Retrieve all customers with a score greater than 500

```sql
SELECT * FROM customers
WHERE score > 500;
```

---

## TASK (>=)
Retrieve all customers with a score of 500 or more

```sql
SELECT * FROM customers
WHERE score >= 500;
```

---

## TASK (<)
Retrieve all customers with a score less than 500

```sql
SELECT * FROM customers
WHERE score < 500;
```

---

## TASK (<=)
Retrieve all customers with a score of 500 or less

```sql
SELECT * FROM customers
WHERE score <= 500;
```

---

# Logical Operators (AND, OR, NOT)

## TASK (AND)
Retrieve all customers who are from the USA AND have a score greater than 500

```sql
SELECT * FROM customers
WHERE country = 'USA' AND score > 500;
```

---

## TASK (OR)
Retrieve all customers who are either from USA OR have a score greater than 500

```sql
SELECT * FROM customers
WHERE country = 'USA' OR score > 500;
```

---

## TASK (NOT)
Retrieve all customers with a score NOT less than 500

```sql
SELECT * FROM customers
WHERE NOT score < 500;
```

---

# Range Operator (BETWEEN)

-- BETWEEN uses an inclusive range

```sql
score BETWEEN 100 AND 500
```

Includes:
- 100
- 500
- everything in between

---

## TASK (BETWEEN)
Retrieve all customers whose score falls in the range BETWEEN 100 AND 500

```sql
SELECT * FROM customers
WHERE score BETWEEN 100 AND 500;
```

---

## Without BETWEEN

```sql
SELECT * FROM customers
WHERE score >= 100 AND score <= 500;
```

---

# Membership Operator (IN / NOT IN)

## TASK (IN)
Retrieve all customers from either Germany or USA

```sql
SELECT * FROM customers
WHERE country IN ('Germany', 'USA');
```

---

## Without IN

```sql
SELECT * FROM customers
WHERE country = 'Germany'
OR country = 'USA';
```

---

## TASK (NOT IN)
Retrieve all customers who are not from either Germany or USA

```sql
SELECT * FROM customers
WHERE country NOT IN ('Germany', 'USA');
```

---

# Search Operator (LIKE)

-- LIKE is used with WHERE to search patterns in text

## Symbols

| Symbol | Meaning |
|---|---|
| % | Any number of characters (0, 1, or many) |
| _ | Exactly one character |

---

## Examples

### Starts with 'M'

```sql
M%
```

Matches:
- Maria
- Martin
- Maria Albert

---

### Contains 'in'

```sql
%in%
```

Matches:
- Vin
- Rayn

---

### Ends with 'b'

```sql
%b
```

Matches:
- Rob
- Jacob

---

### Starts with '5'

```sql
5%
```

---

### Exactly 3 characters starting with 'A'

```sql
A__
```

Matches:
- Abel ✓
- Anna ✓

Does Not Match:
- Emma ✗
- Jasmine ✗

---

### Exactly 3 characters ending with 'n'

```sql
__n
```

---

### Contains 'a'

```sql
%a%
```

Matches:
- a
- Max
- Harry
- Maria

Does Not Match:
- John
- Peter

-- % can also represent zero characters
-- so even a single 'a' matches with %a%

---

# LIKE Tasks

## TASK 1
Find all customers whose first name starts with 'M'

```sql
SELECT * FROM customers
WHERE first_name LIKE 'M%';
```

---

## TASK 2
Find all customers whose first name ends with 'n'

```sql
SELECT * FROM customers
WHERE first_name LIKE '%n';
```

---

## TASK 3
Find all customers whose first name contains 'r'

```sql
SELECT * FROM customers
WHERE first_name LIKE '%r%';
```

---

## TASK 4 (_)
Find all customers whose first name has 'r' in the third position

```sql
SELECT * FROM customers
WHERE first_name LIKE '__r%';

-- _ _ -> first two positions can be anything
-- r   -> third position must be 'r'
-- %   -> anything after that
```