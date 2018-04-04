-- In-Class Exercises

/*
Build a list of the 25 employees that appear first alphabetically by the name
of their country, and then by their last name. Include the ID, and both names,
but rename the id field to be called EmployeeID.
*/
SELECT id as EmployeeID, first_name, last_name
FROM employees
ORDER BY country ASC, last_name ASC
LIMIT 25;


/*
How Many records are there in the set if all NULL values are excluded from the
total_worth and is_management fields?
*/
SELECT count(*)
FROM employees
WHERE total_worth is NOT NULL
    AND is_management is NOT NULL;


/*
Create a list of the 5 highest worth employees from Canada, from most to least.
*/
SELECT id, first_name, last_name, total_worth
FROM employees
WHERE country = 'Canada'
ORDER BY total_worth DESC
LIMIT 5;


/*
How many countries are represented in the data? What is the ratio of the unique
number of last names to the unique number of countries? Name the output columns:
countries, last_names, and ratio.
*/
SELECT
    count(DISTINCT country) as countries,
    count(DISTINCT last_name) as last_names,
    count(DISTINCT last_name) * 1.0 / count(DISTINCT country) as ratio
FROM employees;


/*
How many employees are either from Kenya or have a total worth greater than 47
but less than 51?
*/
SELECT count(*)
FROM employees
WHERE country = 'Kenya'
    OR total_worth BETWEEN 47 and 51;


/*
Produce a list of employees by last name, id, and email address only; where
*/
SELECT id, last_name, email
FROM employees
WHERE country not in ('Kenya', 'Canada')
    AND is_management = 'true'
    AND gender = 'Female'
ORDER BY email DESC;


-- BONUS -----------------------------------------------------------------------

/*
I would like to give a 10% worth raise plus an extra 5 on top to all Canadian
employees who either have a current worth less than 10, or are not management.
Please produce a list of all employees meeting that criteria with their id, their
name, their current worth, and their future worth once they get the raise.
*/
SELECT
    id, first_name, last_name, total_worth,
    (total_worth * 1.10) as future_worth
FROM employees
WHERE country = 'Canada'
    AND (
        total_worth < 10
        OR is_management = 'false'
    )
ORDER BY future_worth DESC;


/*
If I gave a 12% raise, how many new management employees would be in the
above 50 category?
*/
SELECT count(*)
FROM employees
WHERE is_management = 'true'
    AND total_worth < 50
    AND total_worth * 1.10 >= 50;
