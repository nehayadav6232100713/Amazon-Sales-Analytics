-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Filtering and Sorting
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- ==========================================================
-- ==========================================================
-- Query 1 : Display all shipped orders
-- Purpose : Filter only shipped orders
-- SQL Concept Used : WHERE
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE status = 'Shipped';

-- ==========================================================
-- Query 2 : Display products with amount greater than 1000
-- Purpose : Identify high-value orders
-- SQL Concept Used : WHERE (>)
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount > 1000;

-- ==========================================================
-- Query 3 : Display products with amount less than 500
-- Purpose : Identify low-value orders
-- SQL Concept Used : WHERE (<)
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount < 500;

-- ==========================================================
-- Query 4 : Display orders with amount greater than or equal to 2000
-- Purpose : Identify premium value orders
-- SQL Concept Used : WHERE (>=)
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount >= 2000;

-- ==========================================================
-- Query 5 : Display orders with amount less than or equal to 300
-- Purpose : Identify very low-value orders
-- SQL Concept Used : WHERE (<=)
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount <= 300;

-- ==========================================================
-- Query 6 : Display orders except Cancelled
-- Purpose : Exclude cancelled orders
-- SQL Concept Used : WHERE (<>)
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE status <> 'Cancelled';

-- ==========================================================
-- Query 7 : Shipped orders with amount greater than 1000
-- Purpose : Find high-value shipped orders
-- SQL Concept Used : AND
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE status = 'Shipped'
AND amount > 1000;

-- ==========================================================
-- Query 8 : Display Shipped or Cancelled orders
-- Purpose : Retrieve multiple order statuses
-- SQL Concept Used : OR
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE status = 'Shipped'
OR status = 'Cancelled';

-- ==========================================================
-- Query 9 : Orders with amount between 500 and 1000
-- Purpose : Identify medium-value orders
-- SQL Concept Used : BETWEEN
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount BETWEEN 500 AND 1000;

-- ==========================================================
-- Query 10 : Display selected categories
-- Purpose : Filter multiple categories
-- SQL Concept Used : IN
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE category IN ('Kurta', 'Set', 'Western Dress');

-- ==========================================================
-- Query 11 : Find cities starting with 'M'
-- Purpose : Search city names
-- SQL Concept Used : LIKE
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE ship_city LIKE 'M%';

-- ==========================================================
-- Query 12 : Display records where Amount is NULL
-- Purpose : Identify missing amount values
-- SQL Concept Used : IS NULL
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount IS NULL;

-- ==========================================================
-- Query 13 : Display records where Amount is available
-- Purpose : Identify complete amount records
-- SQL Concept Used : IS NOT NULL
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount IS NOT NULL;

-- ==========================================================
-- Query 14 : Sort amount in ascending order
-- Purpose : View lowest to highest amount
-- SQL Concept Used : ORDER BY ASC
-- ==========================================================

SELECT order_id, amount
FROM amazon_sales
ORDER BY amount ASC;

-- ==========================================================
-- Query 15 : Sort amount in descending order
-- Purpose : View highest-value orders first
-- SQL Concept Used : ORDER BY DESC
-- ==========================================================

SELECT order_id, amount
FROM amazon_sales
ORDER BY amount DESC;

-- ==========================================================
-- Query 16 : Display top 10 highest-value orders
-- Purpose : Preview top records
-- SQL Concept Used : LIMIT
-- ==========================================================

SELECT order_id, amount
FROM amazon_sales
ORDER BY amount DESC
LIMIT 10;

-- ==========================================================
-- End of File
-- Phase Completed : Filtering and Sorting
-- Total Queries Executed : 16
-- Status : Completed Successfully
-- ==========================================================




