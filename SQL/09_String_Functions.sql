-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : String Functions
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Convert city names to uppercase
-- Purpose : Standardize text format
-- SQL Concept Used : UPPER()
-- ==========================================================

SELECT
order_id,
ship_city,
UPPER(ship_city) AS city_upper
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Convert state names to lowercase
-- Purpose : Standardize text format
-- SQL Concept Used : LOWER()
-- ==========================================================

SELECT
order_id,
ship_state,
LOWER(ship_state) AS state_lower
FROM amazon_sales;

-- ==========================================================
-- Query 3 : Convert city names into proper case
-- Purpose : Improve text readability
-- SQL Concept Used : INITCAP()
-- ==========================================================

SELECT
order_id,
ship_city,
INITCAP(ship_city) AS proper_city
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Find length of SKU
-- Purpose : Measure text length
-- SQL Concept Used : LENGTH()
-- ==========================================================

SELECT
sku,
LENGTH(sku) AS sku_length
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Remove extra spaces from city names
-- Purpose : Clean text values
-- SQL Concept Used : TRIM()
-- ==========================================================

SELECT
ship_city,
TRIM(ship_city) AS cleaned_city
FROM amazon_sales;

-- ==========================================================
-- Query 6 : Display first three letters of SKU
-- Purpose : Extract prefix
-- SQL Concept Used : LEFT()
-- ==========================================================

SELECT
sku,
LEFT(sku,3) AS sku_prefix
FROM amazon_sales;

-- ==========================================================
-- Query 7 : Display last three letters of SKU
-- Purpose : Extract suffix
-- SQL Concept Used : RIGHT()
-- ==========================================================

SELECT
sku,
RIGHT(sku,3) AS sku_suffix
FROM amazon_sales;

-- ==========================================================
-- Query 8 : Extract characters from SKU
-- Purpose : Extract specific part of text
-- SQL Concept Used : SUBSTRING()
-- ==========================================================

SELECT
sku,
SUBSTRING(sku FROM 1 FOR 5) AS sku_part
FROM amazon_sales;

-- ==========================================================
-- Query 9 : Combine city and state
-- Purpose : Create complete location
-- SQL Concept Used : CONCAT()
-- ==========================================================

SELECT
CONCAT(ship_city,' - ',ship_state) AS full_location
FROM amazon_sales;


-- ==========================================================
-- Query 10 : Replace blank spaces with underscore
-- Purpose : Modify text
-- SQL Concept Used : REPLACE()
-- ==========================================================

SELECT
ship_city,
REPLACE(ship_city,' ','_') AS modified_city
FROM amazon_sales;

-- ==========================================================
-- Query 11 : Find position of '-' in SKU
-- Purpose : Locate character position
-- SQL Concept Used : POSITION()
-- ==========================================================

SELECT
sku,
POSITION('-' IN sku) AS dash_position
FROM amazon_sales;

-- ==========================================================
-- Query 12 : Reverse SKU
-- Purpose : Reverse text
-- SQL Concept Used : REVERSE()
-- ==========================================================

SELECT
sku,
REVERSE(sku) AS reverse_sku
FROM amazon_sales;

-- ==========================================================
-- Query 13 : Pad postal code from left
-- Purpose : Standardize postal code format
-- SQL Concept Used : LPAD()
-- ==========================================================

SELECT
ship_postal_code,
LPAD(ship_postal_code,8,'0') AS formatted_postal_code
FROM amazon_sales;

-- ==========================================================
-- Concepts Covered
--
-- UPPER()
-- LOWER()
-- INITCAP()
-- LENGTH()
-- TRIM()
-- LEFT()
-- RIGHT()
-- SUBSTRING()
-- CONCAT()
-- REPLACE()
-- POSITION()
-- REVERSE()
-- LPAD()
-- RPAD()
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- End of File
-- ==========================================================

-- ==========================================================
-- Query 14 : Pad SKU from right
-- Purpose : Standardize SKU length
-- SQL Concept Used : RPAD()
-- ==========================================================

SELECT
sku,
RPAD(sku,15,'*') AS formatted_sku
FROM amazon_sales;


-- ==========================================================
-- Query 15 : Clean and format city names
-- Purpose : Apply multiple string functions
-- SQL Concept Used : TRIM() + UPPER()
-- ==========================================================

SELECT
ship_city,
UPPER(TRIM(ship_city)) AS final_city
FROM amazon_sales;

-- ==========================================================
-- Concepts Covered
--
-- UPPER()
-- LOWER()
-- INITCAP()
-- LENGTH()
-- TRIM()
-- LEFT()
-- RIGHT()
-- SUBSTRING()
-- CONCAT()
-- REPLACE()
-- POSITION()
-- REVERSE()
-- LPAD()
-- RPAD()
--
-- ==========================================================