-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Date Functions
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Extract Order Year
-- Purpose : Display order year
-- SQL Concept Used : EXTRACT()
-- ==========================================================

SELECT
order_id,
order_date,
EXTRACT(YEAR FROM order_date) AS order_year
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Extract Order Month
-- Purpose : Display order month
-- SQL Concept Used : EXTRACT()
-- ==========================================================

SELECT
order_id,
order_date,
EXTRACT(MONTH FROM order_date) AS order_month
FROM amazon_sales;

-- ==========================================================
-- Query 3 : Extract Day
-- Purpose : Display order day
-- SQL Concept Used : EXTRACT()
-- ==========================================================

SELECT
order_id,
order_date,
EXTRACT(DAY FROM order_date) AS order_day
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Extract Quarter
-- Purpose : Display financial quarter
-- SQL Concept Used : EXTRACT()
-- ==========================================================

SELECT
order_id,
order_date,
EXTRACT(QUARTER FROM order_date) AS order_quarter
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Display Month Name
-- Purpose : Show month name
-- SQL Concept Used : TO_CHAR()
-- ==========================================================

SELECT
order_id,
order_date,
TO_CHAR(order_date,'Month') AS month_name
FROM amazon_sales;

-- ==========================================================
-- Query 6 : Display Day Name
-- Purpose : Show weekday name
-- SQL Concept Used : TO_CHAR()
-- ==========================================================

SELECT
order_id,
order_date,
TO_CHAR(order_date,'Day') AS day_name
FROM amazon_sales;

-- ==========================================================
-- Query 7 : Month-Year Format
-- Purpose : Display Month and Year together
-- SQL Concept Used : TO_CHAR()
-- ==========================================================

SELECT
order_id,
order_date,
TO_CHAR(order_date,'Mon YYYY') AS month_year
FROM amazon_sales;

-- ==========================================================
-- Query 8 : Display Current Date
-- Purpose : Show today's date
-- SQL Concept Used : CURRENT_DATE
-- ==========================================================

SELECT CURRENT_DATE;


-- ==========================================================
-- Query 9 : Display Current Timestamp
-- Purpose : Show current date and time
-- SQL Concept Used : CURRENT_TIMESTAMP
-- ==========================================================

SELECT CURRENT_TIMESTAMP;

-- ==========================================================
-- Query 10 : Calculate Order Age
-- Purpose : Find difference from current date
-- SQL Concept Used : AGE()
-- ==========================================================

SELECT
order_id,
order_date,
AGE(CURRENT_DATE,order_date) AS order_age
FROM amazon_sales;

 -- ==========================================================
-- Query 11 : Total Orders by Year
-- Purpose : Count total orders placed each year
-- SQL Concept Used : EXTRACT() + GROUP BY + COUNT()
-- ==========================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY order_year
ORDER BY order_year;

-- ==========================================================
-- Query 12 : Total Orders by Month
-- Purpose : Count total orders placed each month
-- SQL Concept Used : EXTRACT() + GROUP BY + COUNT()
-- ==========================================================

SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY order_month
ORDER BY order_month;

-- ==========================================================
-- Query 13 : Revenue by Year
-- Purpose : Calculate total revenue generated each year
-- SQL Concept Used : EXTRACT() + GROUP BY + SUM()
-- ==========================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY order_year
ORDER BY order_year;

-- ==========================================================
-- Query 14 : Revenue by Month
-- Purpose : Calculate total revenue generated each month
-- SQL Concept Used : TO_CHAR() + GROUP BY + SUM()
-- ==========================================================

SELECT
    TO_CHAR(order_date,'Mon') AS month_name,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY month_name
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 15 : Total Orders by Quarter
-- Purpose : Count total orders placed in each quarter
-- SQL Concept Used : EXTRACT() + GROUP BY + COUNT()
-- ==========================================================

SELECT
    EXTRACT(QUARTER FROM order_date) AS order_quarter,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY order_quarter
ORDER BY order_quarter;

-- ==========================================================
-- Concepts Covered
--
-- EXTRACT()
-- TO_CHAR()
-- CURRENT_DATE
-- CURRENT_TIMESTAMP
-- AGE()
-- GROUP BY
-- SUM()
-- COUNT()
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================
