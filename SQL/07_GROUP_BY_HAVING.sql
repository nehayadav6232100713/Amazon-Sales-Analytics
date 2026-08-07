-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : GROUP BY and HAVING
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Category-wise total revenue
-- Purpose : Calculate total sales for each product category
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    category,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 2 : Category-wise total orders
-- Purpose : Count orders for each category
-- SQL Concept Used : GROUP BY + COUNT()
-- ==========================================================

SELECT
    category,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY category
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 3 : Category-wise average sales
-- Purpose : Calculate average order value by category
-- SQL Concept Used : GROUP BY + AVG()
-- ==========================================================

SELECT
    category,
    ROUND(AVG(amount),2) AS average_sales
FROM amazon_sales
GROUP BY category
ORDER BY average_sales DESC;

-- ==========================================================
-- Query 4 : Category-wise quantity sold
-- Purpose : Calculate total quantity sold by category
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    category,
    SUM(qty) AS total_quantity
FROM amazon_sales
GROUP BY category
ORDER BY total_quantity DESC;

-- ==========================================================
-- Query 5 : State-wise total revenue
-- Purpose : Calculate revenue generated from each state
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    ship_state,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_state
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 6 : City-wise total revenue
-- Purpose : Calculate revenue generated from each city
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    ship_city,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_city
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 7 : Status-wise total orders
-- Purpose : Count orders for each order status
-- SQL Concept Used : GROUP BY + COUNT()
-- ==========================================================

SELECT
    status,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY status
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 8 : Fulfilment-wise revenue
-- Purpose : Calculate revenue by fulfilment type
-- SQL Concept Used : GROUP BY + SUM()
-- ==========================================================

SELECT
    fulfilment,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY fulfilment
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 9 : Highest order amount by category
-- Purpose : Find the maximum order value in each category
-- SQL Concept Used : GROUP BY + MAX()
-- ==========================================================

SELECT
    category,
    MAX(amount) AS highest_order_amount
FROM amazon_sales
GROUP BY category
ORDER BY highest_order_amount DESC;

-- ==========================================================
-- Query 10 : Lowest order amount by category
-- Purpose : Find the minimum order value in each category
-- SQL Concept Used : GROUP BY + MIN()
-- ==========================================================

SELECT
    category,
    MIN(amount) AS lowest_order_amount
FROM amazon_sales
GROUP BY category
ORDER BY lowest_order_amount;

-- ==========================================================
-- Query 11 : Categories having revenue greater than 500000
-- Purpose : Display high revenue categories
-- SQL Concept Used : GROUP BY + HAVING
-- ==========================================================

SELECT
    category,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category
HAVING SUM(amount) > 500000
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 12 : States having more than 1000 orders
-- Purpose : Display states with high order volume
-- SQL Concept Used : GROUP BY + HAVING
-- ==========================================================

SELECT
    ship_state,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY ship_state
HAVING COUNT(*) > 1000
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 13 : Categories with average sales greater than 700
-- Purpose : Identify premium product categories
-- SQL Concept Used : GROUP BY + HAVING
-- ==========================================================

SELECT
    category,
    ROUND(AVG(amount),2) AS average_sales
FROM amazon_sales
GROUP BY category
HAVING AVG(amount) > 700
ORDER BY average_sales DESC;

-- ==========================================================
-- Query 14 : Cities having revenue greater than 100000
-- Purpose : Identify top revenue generating cities
-- SQL Concept Used : GROUP BY + HAVING
-- ==========================================================

SELECT
    ship_city,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_city
HAVING SUM(amount) > 100000
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 15 : Categories having more than 500 orders
-- Purpose : Identify high demand categories
-- SQL Concept Used : GROUP BY + HAVING
-- ==========================================================

SELECT
    category,
    COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY category
HAVING COUNT(*) > 500
ORDER BY total_orders DESC;


-- ==========================================================
-- Concepts Covered
--
-- GROUP BY
-- HAVING
-- SUM()
-- COUNT()
-- AVG()
-- ORDER BY
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- End of File
-- ==========================================================


