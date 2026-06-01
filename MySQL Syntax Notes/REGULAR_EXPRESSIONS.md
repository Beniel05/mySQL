# SQL Regular Expressions (REGEXP)

Regular Expressions are used to search patterns in text more powerfully than LIKE.

In MySQL:

```sql
WHERE column_name REGEXP 'pattern'
```

---

# Regular Expression Quick Recall Table

| Symbol   | Meaning                            | Example     | Matches           |       |               |
| -------- | ---------------------------------- | ----------- | ----------------- | ----- | ------------- |
| `^`      | Starts with                        | `^M`        | Maria, Max        |       |               |
| `$`      | Ends with                          | `n$`        | John, Ben         |       |               |
| `.`      | Any single character               | `a.`        | an, ax            |       |               |
| `*`      | Zero or more characters            | `ab*`       | a, ab, abb        |       |               |
| `+`      | One or more characters             | `ab+`       | ab, abb           |       |               |
| `?`      | Zero or one character              | `colou?r`   | color, colour     |       |               |
| `[abc]`  | Any one character inside brackets  | `[MJ]`      | Maria, John       |       |               |
| `[^abc]` | NOT the characters inside brackets | `[^M]`      | John, Peter       |       |               |
| `[a-z]`  | Character range                    | `[a-z]`     | lowercase letters |       |               |
| `[A-Z]`  | Uppercase range                    | `[A-Z]`     | uppercase letters |       |               |
| `[0-9]`  | Number range                       | `[0-9]`     | digits            |       |               |
| `        | `                                  | OR operator | `Maria            | John` | Maria or John |
| `{n}`    | Exactly n times                    | `a{3}`      | aaa               |       |               |
| `{n,m}`  | Between n and m times              | `a{2,4}`    | aa, aaa, aaaa     |       |               |

---

# REGEXP Syntax

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'pattern';
```

---

# Start With (^)

## Starts with 'M'

```sql
SELECT * FROM customers
WHERE first_name REGEXP '^M';
```

Matches:

* Maria
* Max
* Martin

Does Not Match:

* Emma
* John

---

# Ends With ($)

## Ends with 'n'

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'n$';
```

Matches:

* Ben
* John

Does Not Match:

* Maria
* Max

---

# Any Single Character (.)

`.` represents exactly one character.

## Example

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'a.';
```

Matches:

* an
* ax
* ab

---

# Zero or More (*)

`*` means the previous character can appear zero or more times.

## Example

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'ab*';
```

Matches:

* a
* ab
* abb
* abbb

---

# One or More (+)

`+` means the previous character must appear at least once.

## Example

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'ab+';
```

Matches:

* ab
* abb
* abbb

Does Not Match:

* a

---

# Optional Character (?)

`?` means the previous character is optional.

## Example

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'colou?r';
```

Matches:

* color
* colour

---

# Character List ([])

## Match M or J

```sql
SELECT * FROM customers
WHERE first_name REGEXP '^[MJ]';
```

Matches:

* Maria
* John

---

# NOT Characters ([^])

`[^]` means NOT those characters.

## Example

```sql
SELECT * FROM customers
WHERE first_name REGEXP '^[^M]';
```

Matches:

* John
* Peter

Does Not Match:

* Maria

---

# Character Ranges

## Lowercase Letters

```sql
[a-z]
```

## Uppercase Letters

```sql
[A-Z]
```

## Numbers

```sql
[0-9]
```

---

# OR Operator (|)

## Match Maria OR John

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'Maria|John';
```

Matches:

* Maria
* John

---

# Exact Repetition ({n})

## Exactly 3 a's

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'a{3}';
```

Matches:

* aaa

---

# Range Repetition ({n,m})

## Between 2 and 4 a's

```sql
SELECT * FROM customers
WHERE first_name REGEXP 'a{2,4}';
```

Matches:

* aa
* aaa
* aaaa

---

# REGEXP Functions in MySQL

MySQL also provides built-in REGEXP functions for searching, replacing, and extracting text using regular expressions.

---

# 1. REGEXP_LIKE()

Checks whether a string matches a pattern.

## Syntax

```sql
REGEXP_LIKE(expression, pattern)
```

## Example

```sql
SELECT REGEXP_LIKE('Maria', '^M');
```

Output:

```sql
1
```

Explanation:

* `1` = TRUE
* `0` = FALSE

---

## Find Names Starting with M

```sql
SELECT *
FROM customers
WHERE REGEXP_LIKE(first_name, '^M');
```

Matches:

* Maria
* Max

---

# 2. REGEXP_REPLACE()

Replaces matching text using regex patterns.

## Syntax

```sql
REGEXP_REPLACE(expression, pattern, replacement)
```

---

## Replace Numbers

```sql
SELECT REGEXP_REPLACE('Phone: 9876543210', '[0-9]', '*');
```

Output:

```sql
Phone: **********
```

---

## Remove Spaces

```sql
SELECT REGEXP_REPLACE('Hello World', ' ', '');
```

Output:

```sql
HelloWorld
```

---

## Replace Multiple Spaces

```sql
SELECT REGEXP_REPLACE('Hello     World', '[ ]+', ' ');
```

Output:

```sql
Hello World
```

---

# 3. REGEXP_SUBSTR()

Extracts the matching substring.

## Syntax

```sql
REGEXP_SUBSTR(expression, pattern)
```

---

## Extract Numbers

```sql
SELECT REGEXP_SUBSTR('Order123Placed', '[0-9]+');
```

Output:

```sql
123
```

---

## Extract Gmail Address

```sql
SELECT REGEXP_SUBSTR(
'Contact: abc@gmail.com',
'[a-zA-Z0-9._%+-]+@gmail\\.com'
);
```

Output:

```sql
abc@gmail.com
```

---

# 4. REGEXP_INSTR()

Returns the starting position of a regex match.

## Syntax

```sql
REGEXP_INSTR(expression, pattern)
```

---

## Find Position of Number

```sql
SELECT REGEXP_INSTR('Order123Placed', '[0-9]');
```

Output:

```sql
6
```

Explanation:

* First number starts at position 6.

---

# Common REGEXP Examples

## Check if String Contains Only Numbers

```sql
SELECT REGEXP_LIKE('12345', '^[0-9]+$');
```

Output:

```sql
1
```

---

## Validate Email Format

```sql
SELECT REGEXP_LIKE(
'abc@gmail.com',
'^[a-zA-Z0-9._%+-]+@gmail\\.com$'
);
```

---

## Remove All Special Characters

```sql
SELECT REGEXP_REPLACE(
'Hello@123!',
'[^a-zA-Z0-9]',
''
);
```

Output:

```sql
Hello123
```

---

# LIKE vs REGEXP

| LIKE                    | REGEXP                    |
| ----------------------- | ------------------------- |
| Simple pattern matching | Advanced pattern matching |
| Uses `%` and `_`        | Uses regex symbols        |
| Easier for beginners    | More powerful             |
| Limited searching       | Flexible searching        |

---

# Difference Between REGEXP and REGEXP Functions

| Feature              | REGEXP Operator | REGEXP Functions |
| -------------------- | --------------- | ---------------- |
| Used in WHERE clause | Yes             | Yes              |
| Pattern matching     | Yes             | Yes              |
| Replace text         | No              | Yes              |
| Extract text         | No              | Yes              |
| Return positions     | No              | Yes              |
| Modern MySQL support | Basic           | Advanced         |

---

# Quick Revision

| Function           | Purpose               |
| ------------------ | --------------------- |
| `REGEXP_LIKE()`    | Check pattern match   |
| `REGEXP_REPLACE()` | Replace matching text |
| `REGEXP_SUBSTR()`  | Extract matching text |
| `REGEXP_INSTR()`   | Find match position   |

---

# Notes

* REGEXP is more powerful than LIKE.
* `^` checks the beginning.
* `$` checks the ending.
* `.` means exactly one character.
* `[]` is used for character groups.
* `|` acts like OR.
* `REGEXP_REPLACE()` modifies text.
* `REGEXP_SUBSTR()` extracts matching parts.
* `REGEXP_INSTR()` gives match position.
* Most REGEXP functions are available in MySQL 8+.
* Regular expressions are widely used in:

  * SQL
  * Java
  * Python
  * JavaScript
  * Linux commands
