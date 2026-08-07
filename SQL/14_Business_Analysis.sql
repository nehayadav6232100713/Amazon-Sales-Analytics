-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Business Analysis
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 20
-- ==========================================================

-- ==========================================================
-- Query 1 : Total Revenue
-- Purpose : Calculate total revenue generated
-- SQL Concept Used : SUM()
-- ==========================================================

SELECT
SUM(amount) AS total_revenue
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Total Orders
-- Purpose : Calculate total number of orders
-- SQL Concept Used : COUNT()
-- ==========================================================

SELECT
COUNT(order_id) AS total_orders
FROM amazon_sales;

-- ==========================================================
-- Query 3 : Average Order Value
-- Purpose : Calculate average revenue per order
-- SQL Concept Used : AVG()
-- ==========================================================

SELECT
ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Total Quantity Sold
-- Purpose : Calculate total quantity sold
-- SQL Concept Used : SUM()
-- ==========================================================

SELECT
SUM(qty) AS total_quantity_sold
FROM amazon_sales;


-- ==========================================================
-- Query 5 : Highest Order Value
-- Purpose : Identify highest value order
-- SQL Concept Used : MAX()
-- ==========================================================

SELECT
MAX(amount) AS highest_order_value
FROM amazon_sales;


-- ==========================================================
-- Query 6 : Top 5 Categories by Revenue
-- Purpose : Identify the highest revenue generating categories
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    category,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 5;


-- ==========================================================
-- Query 7 : Bottom 5 Categories by Revenue
-- Purpose : Identify the lowest revenue generating categories
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    category,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue ASC
LIMIT 5;

-- ==========================================================
-- Query 8 : Category-wise Total Orders
-- Purpose : Compare total orders across categories
-- SQL Concept Used : GROUP BY + COUNT()
-- ==========================================================

SELECT
    category,
    COUNT(order_id) AS total_orders
FROM amazon_sales
GROUP BY category
ORDER BY total_orders DESC;


-- ==========================================================
-- Query 9 : Category-wise Average Order Value
-- Purpose : Compare average order value by category
-- SQL Concept Used : GROUP BY + AVG()
-- ==========================================================

SELECT
    category,
    ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales
GROUP BY category
ORDER BY average_order_value DESC;

-- ==========================================================
-- Query 10 : Category-wise Quantity Sold
-- Purpose : Compare quantity sold by category
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    category,
    SUM(qty) AS total_quantity_sold
FROM amazon_sales
GROUP BY category
ORDER BY total_quantity_sold DESC;


-- ==========================================================
-- Query 11 : Top 10 States by Revenue
-- Purpose : Identify states generating the highest revenue
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    ship_state,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_state
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 12 : Bottom 10 States by Revenue
-- Purpose : Identify states generating the lowest revenue
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    ship_state,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_state
ORDER BY total_revenue ASC
LIMIT 10;

-- ==========================================================
-- Query 13 : Top 10 Cities by Revenue
-- Purpose : Identify cities generating the highest revenue
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    ship_city,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_city
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 14 : State-wise Total Orders
-- Purpose : Compare total orders by state
-- SQL Concept Used : GROUP BY + COUNT()
-- ==========================================================

SELECT
    ship_state,
    COUNT(order_id) AS total_orders
FROM amazon_sales
GROUP BY ship_state
ORDER BY total_orders DESC;


-- ==========================================================
-- Query 15 : State-wise Average Order Value
-- Purpose : Compare average order value across states
-- SQL Concept Used : GROUP BY + AVG()
-- ==========================================================

SELECT
    ship_state,
    ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales
GROUP BY ship_state
ORDER BY average_order_value DESC;


-- ==========================================================
-- Query 16 : Top 10 Selling Products
-- Purpose : Identify products with highest revenue
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    sku,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY sku
ORDER BY total_revenue DESC
LIMIT 10;

-- ==========================================================
-- Query 17 : Bottom 10 Selling Products
-- Purpose : Identify products with lowest revenue
-- SQL Concept Used : GROUP BY + ORDER BY + LIMIT
-- ==========================================================

SELECT
    sku,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY sku
ORDER BY total_revenue ASC
LIMIT 10;

-- ==========================================================
-- Query 18 : Fulfilment Performance
-- Purpose : Compare revenue by fulfilment method
-- SQL Concept Used : GROUP BY
-- ==========================================================

SELECT
    fulfilment,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM amazon_sales
GROUP BY fulfilment
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 19 : B2B vs B2C Performance
-- Purpose : Compare business customer performance
-- SQL Concept Used : GROUP BY
-- ==========================================================

SELECT
    b2b,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY b2b;

-- ==========================================================
-- Query 20 : Monthly Revenue Trend
-- Purpose : Analyze revenue trend by month
-- SQL Concept Used : EXTRACT + GROUP BY
-- ==========================================================

SELECT
    EXTRACT(MONTH FROM date) AS month,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY month;


-- ==========================================================
-- Concepts Covered
--
-- SUM()
-- COUNT()
-- AVG()
-- MAX()
-- GROUP BY
-- ORDER BY
-- LIMIT
-- ROUND()
-- EXTRACT()
-- Business KPI Analysis
-- Revenue Analysis
-- Category Analysis
-- Location Analysis
-- Product Performance Analysis
-- Fulfilment Analysis
-- B2B vs B2C Analysis
-- Monthly Trend Analysis
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 20
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================
