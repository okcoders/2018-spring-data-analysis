-- Aggregations

SELECT country, count(*) as num_recs
FROM employees
GROUP BY country;

SELECT country, count(*) as num_recs
FROM employees
WHERE total_worth > 30
GROUP BY country;

-- HAVING: like a where clause, but after the aggregation
SELECT country, count(*) as num_recs
FROM employees
WHERE total_worth > 30
GROUP BY country
HAVING num_recs > 75;


--------------------------------------------------------------------------------
-- JOINS: how to link data from multiple tables together.

SELECT *
FROM country_master

SELECT *
FROM continent_master

SELECT *
FROM country_master as ct
    INNER JOIN continent_master as cn
        ON cn.name = ct.continent

SELECT
    e.first_name,
    e.last_name,
    e.company,
    ct.population as pop_country,
    cn.population as pop_cont
FROM employees as e
    INNER JOIN country_master as ct
        ON ct.country = e.country
    INNER JOIN continent_master as cn
        ON cn.name = ct.continent
LIMIT 100;

SELECT cn.name, count(*) as num_recs
FROM employees as e
    INNER JOIN country_master as ct
        ON ct.country = e.country
    INNER JOIN continent_master as cn
        ON cn.name = ct.continent
GROUP BY cn.name;


--------------------------------------------------------------------------------
-- Types of Joins: the direction specifies how the tables connect

-- INNER: keep only matching records, based on JOIN criteria.
SELECT *
FROM country_master as ct
    INNER JOIN continent_master as cn
        ON cn.name = ct.continent

-- JOIN Criteria is kind of like a mini WHERE clause
SELECT *
FROM continent_master as cm1
    INNER JOIN continent_master as cm2
        ON cm1.name != cm2.name

-- LEFT JOIN: keep non-matching records from the source table
SELECT *
FROM continent_master as cn
    LEFT JOIN country_master as ct
        ON cn.name = ct.continent


-- RIGHT JOIN: keep non-matching records from the joining table
-- NOTE: currently SQLite does not support RIGHT JOINS, so this block can't
-- be run in your SQL environment.
SELECT *
FROM country_master as ct
    RIGHT JOIN continent_master as cn
        ON cn.name = ct.continent


-- CROSS: match all records to all records, produces all possible combinations
-- WARNING: be careful with this one, numbers can add up very quickly.
SELECT *
FROM country_master as ct
    CROSS JOIN continent_master as cn


--------------------------------------------------------------------------------
-- SubQueries: use the result of one query like it's a table in another

SELECT
    ct.country, ct.continent, ct.population, cn.population,
    (ct.population * 1.0) / cn.population as pop_ratio
FROM country_master ct
    INNER JOIN continent_master cn
        ON cn.name = ct.continent


SELECT
    e.gender,
    count(*) as num_recs,
    sum(total_worth) as total_worth,
    avg(total_worth) as mean_worth
FROM employees e
    INNER JOIN (
        SELECT
            ct.country, ct.continent, ct.population, cn.population,
            (ct.population * 1.0) / cn.population as pop_ratio
        FROM country_master ct
            INNER JOIN continent_master cn
                ON cn.name = ct.continent
    ) as sq
WHERE sq.pop_ratio > 0.03
    AND e.gender is NOT NULL
GROUP BY e.gender
ORDER BY total_worth DESC;


-- A SubQuery can also be used with an "in" statement if it has 1 column.
SELECT ct.country
     as pop_ratio
FROM country_master ct
    INNER JOIN continent_master cn
        ON cn.name = ct.continent
WHERE ((ct.population * 1.0) / cn.population) < 0.03;


SELECT
    e.gender,
    count(*) as num_recs,
    sum(total_worth) as total_worth,
    avg(total_worth) as mean_worth
FROM employees e
WHERE e.country in (
    SELECT ct.country
         as pop_ratio
    FROM country_master ct
        INNER JOIN continent_master cn
            ON cn.name = ct.continent
    WHERE ((ct.population * 1.0) / cn.population) < 0.03
)
GROUP BY e.gender
