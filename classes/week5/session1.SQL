-- SQL: Structured Query Language

-- Comments: single line comments use a double hyphen

/*
Multiple Line comments beqin and end
with the symbols surrounding this block.
*/

-- FROM: how you tell a database what data source to use
-- A FROM clause by itself will not execute against a dastabase

FROM table_name
FROM database_name.table_name
FROM database_name.table_name as tn


-- SELECT: which columns from the dataset specified in the FROM you want to output

SELECT col_name1, col_name2
FROM table_name;

SELECT *  -- the start is a shortcut for "all columns"
FROM table_name;


-- LIMIT: show only the specified number of records in the output set

SELECT first_name, last_name, gender
FROM employees
LIMIT 10;


-- ORDER BY: specify the order in which the results are returned

SELECT first_name, last_name, gender
FROM employees
ORDER BY last_name ASC
LIMIT 10;

SELECT first_name, last_name, total_worth
FROM employees
ORDER BY total_worth DESC
LIMIT 10;


SELECT first_name, last_name, company, total_worth
FROM employees
ORDER BY company ASC, total_worth DESC
LIMIT 25;


-- WHERE: filter out some rows based on several criteria

SELECT first_name, last_name, gender
FROM employees
WHERE gender = 'Male'
ORDER BY last_name ASC
LIMIT 10;


SELECT first_name, last_name, gender, is_management
FROM employees
WHERE is_management = 'true'
ORDER BY last_name DESC
LIMIT 10;


SELECT first_name, last_name, gender, total_worth
FROM employees
WHERE total_worth is NULL
ORDER BY last_name ASC
LIMIT 10;

SELECT first_name, last_name, gender, total_worth
FROM employees
WHERE total_worth is NOT NULL
ORDER BY last_name ASC
LIMIT 10;


SELECT first_name, last_name, company, total_worth
FROM employees
WHERE total_worth > 35
ORDER BY company DESC
LIMIT 10;


-- Compound Logic: AND, OR, NOT can be used to execute multiple tests

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE total_worth > 35
    AND gender == 'Female'
ORDER BY company DESC
LIMIT 10;

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE total_worth > 35
    OR total_worth < 15
ORDER BY company DESC
LIMIT 10;


SELECT first_name, last_name, company, total_worth
FROM employees
WHERE company = 'Agimba'
    AND total_worth > 20
ORDER BY company ASC;

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE company = 'Agimba'
    OR total_worth > 20
ORDER BY company ASC
LIMIT 25;


-- BETWEEN: shorthand for making two slices on a single column

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE total_worth > 50
    AND total_worth < 60
ORDER BY company DESC;

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE total_worth BETWEEN 50 AND 60
ORDER BY company DESC;


-- DISTINCT

SELECT DISTINCT gender
FROM employees

SELECT DISTINCT company
FROM employees

SELECT DISTINCT gender, is_management
FROM employees
ORDER BY gender ASC, is_management ASC


-- Multi-Value Inclusion

SELECT first_name, last_name, company, total_worth
FROM employees
WHERE company IN ('Agimba', 'Abata', 'BlogXS')
    OR total_worth > 20
ORDER BY company ASC;

SELECT first_name, last_name, company, total_worth, country
FROM employees
WHERE total_worth > 50
    AND country not in ('Mexico', 'United States', 'Canada')
ORDER BY company ASC;



-- functions: operations that characterize the dataset

SELECT count(id)
FROM employees;

SELECT count(*)
FROM employees;

SELECT count(*)
FROM employees
WHERE total_worth > 40;

SELECT count(DISTINCT company)
FROM employees;

SELECT
    count(*) as n_recs,
    count(DISTINCT company) as n_comp,
    count(DISTINCT company) / count(*) as ratio
FROM employees;

SELECT
    count(*) as n_recs,
    count(DISTINCT company) as n_comp,
    count(DISTINCT company) * 1.0 / count(*) as ratio,
    count(*) * 1.0 / count(DISTINCT company) as emp_comp
FROM employees;


SELECT
    count(*) as recs,
    sum(total_worth) as sum_worth
FROM employees
WHERE total_worth > 40
    AND country = 'Canada';


/*
String: although we format the query to make it easy to read and interpret, at
its core, the SQL query is just a field of test that interpreted the same without
the spacing. Meaning we can work with it and store it like any other kind of
text, and the result from the database will be the same.
*/

SELECT first_name, last_name, company, total_worth, country
FROM employees
WHERE total_worth > 50
    AND country not in ('Mexico', 'United States', 'Canada')
ORDER BY company ASC;


SELECT first_name, last_name, company, total_worth, country FROM employees WHERE total_worth > 50 AND country not in ('Mexico', 'United States', 'Canada') ORDER BY company ASC;
