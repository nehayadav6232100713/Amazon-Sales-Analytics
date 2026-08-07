-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Basic SQL Queries
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- ==========================================================

-- Query 1 : View complete dataset--

SELECT *
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Display important business columns
-- Purpose : View only the required columns for business analysis
-- ==========================================================

SELECT
    order_id,
    order_date,
    category,
    qty,
    amount,
    ship_state
FROM amazon_sales;

-- ==========================================================
-- Query 3 : View first 10 records
-- Purpose : Preview the dataset
-- ==========================================================

SELECT *
FROM amazon_sales
LIMIT 10;

-- ==========================================================
-- Query 4 : Count total records
-- Purpose : Verify total number of rows imported
-- ==========================================================

SELECT COUNT(*) AS total_records
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Display table structure
-- Purpose : Understand column names and data types
-- ==========================================================

SELECT
    column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'amazon_sales';


-- ==========================================================
-- Query 6 : Display unique product categories
-- Purpose : Identify all available product categories
-- ==========================================================

SELECT DISTINCT category
FROM amazon_sales
ORDER BY category;

-- ==========================================================
-- Query 7 : Display unique order status
-- Purpose : Understand different order lifecycle stages
-- ==========================================================

SELECT DISTINCT status
FROM amazon_sales
ORDER BY status;

-- ==========================================================
-- Query 8 : Display unique states
-- Purpose : View all states available in the dataset
-- ==========================================================

SELECT DISTINCT ship_state
FROM amazon_sales
ORDER BY ship_state;

-- ==========================================================
-- Query 9 : Display unique cities
-- Purpose : View all cities available in the dataset
-- ==========================================================

SELECT DISTINCT ship_city
FROM amazon_sales
ORDER BY ship_city;

-- ==========================================================
-- Query 10 : Display unique payment methods
-- Purpose : Identify all payment methods used by customers
-- ==========================================================

SELECT DISTINCT fulfilment
FROM amazon_sales
ORDER BY fulfilment;

-- ==========================================================
-- Concepts Covered
--
-- SELECT
-- SELECT Specific Columns
-- LIMIT
-- COUNT
-- DISTINCT
-- ORDER BY
-- information_schema.columns
--
-- Total Queries : 10
-- Phase Status  : Completed Successfully
--
-- End of File
-- ==========================================================