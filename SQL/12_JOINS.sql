-- ==========================================================
-- Create Product Master Table
-- Purpose : Create unique product information
-- SQL Concept Used : CREATE TABLE AS + SELECT DISTINCT
-- ==========================================================

CREATE TABLE product_master AS

SELECT DISTINCT
sku,
style,
category,
size,
asin

FROM amazon_sales;

SELECT *
FROM product_master;

SELECT COUNT(*)
FROM product_master;

-- ==========================================================
-- Create Location Master Table
-- Purpose : Create unique location information
-- SQL Concept Used : CREATE TABLE AS + SELECT DISTINCT
-- ==========================================================

CREATE TABLE location_master AS

SELECT DISTINCT
ship_state,
ship_city,
ship_country,
ship_postal_code

FROM amazon_sales;

SELECT *
FROM location_master;

SELECT COUNT(*)
FROM location_master;

-- ==========================================================
-- Create Fulfilment Master Table
-- Purpose : Create unique fulfilment information
-- SQL Concept Used : CREATE TABLE AS + SELECT DISTINCT
-- ==========================================================

CREATE TABLE fulfilment_master AS

SELECT DISTINCT
fulfilment,
fulfilled_by,
sales_channel,
ship_service_level

FROM amazon_sales;

SELECT *
FROM fulfilment_master;

SELECT COUNT(*)
FROM fulfilment_master;

-- ==========================================================
-- Query 1 : Product Details with Sales
-- Purpose : Display product information with sales data
-- SQL Concept Used : INNER JOIN
-- ==========================================================

SELECT
    a.order_id,
    a.sku,
    p.style,
    p.category,
    p.size,
    a.amount
FROM amazon_sales a
INNER JOIN product_master p
ON a.sku = p.sku;

-- ==========================================================
-- Query 2 : Location Details
-- Purpose : Display sales with location information
-- SQL Concept Used : LEFT JOIN
-- ==========================================================

SELECT
    a.order_id,
    a.ship_city,
    a.ship_state,
    l.ship_country,
    l.ship_postal_code
FROM amazon_sales a
LEFT JOIN location_master l
ON a.ship_state = l.ship_state
AND a.ship_city = l.ship_city;

-- ==========================================================
-- Query 3 : Fulfilment Details
-- Purpose : Display fulfilment information
-- SQL Concept Used : LEFT JOIN
-- ==========================================================

SELECT
    a.order_id,
    a.fulfilment,
    f.fulfilled_by,
    f.sales_channel,
    f.ship_service_level
FROM amazon_sales a
LEFT JOIN fulfilment_master f
ON a.fulfilment = f.fulfilment;

-- ==========================================================
-- Query 4 : Product Master Records
-- Purpose : Display all product master records even if no sales exist
-- SQL Concept Used : RIGHT JOIN
-- ==========================================================

SELECT
    a.order_id,
    p.sku,
    p.category,
    p.style
FROM amazon_sales a
RIGHT JOIN product_master p
ON a.sku = p.sku;

-- ==========================================================
-- Query 5 : Compare Sales and Product Master
-- Purpose : Display matching and non-matching records
-- SQL Concept Used : FULL OUTER JOIN
-- ==========================================================

SELECT
    a.order_id,
    a.sku,
    p.category,
    p.style
FROM amazon_sales a
FULL OUTER JOIN product_master p
ON a.sku = p.sku;

-- ==========================================================
-- Query 6 : Sales + Product + Location
-- Purpose : Display complete business information
-- SQL Concept Used : Multiple INNER JOIN
-- ==========================================================

SELECT
    a.order_id,
    p.category,
    p.style,
    a.ship_city,
    l.ship_country,
    a.amount
FROM amazon_sales a
INNER JOIN product_master p
ON a.sku = p.sku
INNER JOIN location_master l
ON a.ship_state = l.ship_state
AND a.ship_city = l.ship_city;

-- ==========================================================
-- Query 7 : Sales + Product + Fulfilment
-- Purpose : Display product and fulfilment details
-- SQL Concept Used : Multiple LEFT JOIN
-- ==========================================================

SELECT
    a.order_id,
    p.category,
    f.sales_channel,
    f.ship_service_level,
    a.amount
FROM amazon_sales a
LEFT JOIN product_master p
ON a.sku = p.sku
LEFT JOIN fulfilment_master f
ON a.fulfilment = f.fulfilment;


-- ==========================================================
-- Query 7 : Sales + Product + Fulfilment
-- Purpose : Display product and fulfilment details
-- SQL Concept Used : Multiple LEFT JOIN
-- ==========================================================

SELECT
    a.order_id,
    p.category,
    f.sales_channel,
    f.ship_service_level,
    a.amount
FROM amazon_sales a
LEFT JOIN product_master p
ON a.sku = p.sku
LEFT JOIN fulfilment_master f
ON a.fulfilment = f.fulfilment;


-- ==========================================================
-- Query 9 : Category-wise Revenue
-- Purpose : Calculate total revenue by category
-- SQL Concept Used : INNER JOIN + GROUP BY
-- ==========================================================

SELECT
    p.category,
    SUM(a.amount) AS total_revenue
FROM amazon_sales a
INNER JOIN product_master p
ON a.sku = p.sku
GROUP BY p.category
ORDER BY total_revenue DESC;


-- ==========================================================
-- Query 10 : State-wise Orders
-- Purpose : Count orders by state
-- SQL Concept Used : LEFT JOIN + GROUP BY
-- ==========================================================

SELECT
    l.ship_state,
    COUNT(a.order_id) AS total_orders
FROM location_master l
LEFT JOIN amazon_sales a
ON a.ship_state = l.ship_state
AND a.ship_city = l.ship_city
GROUP BY l.ship_state
ORDER BY total_orders DESC;

-- ==========================================================
-- Query 11 : Highest Selling Category
-- Purpose : Find category with highest revenue
-- SQL Concept Used : INNER JOIN + GROUP BY
-- ==========================================================

SELECT
    p.category,
    SUM(a.amount) AS total_sales
FROM amazon_sales a
INNER JOIN product_master p
ON a.sku = p.sku
GROUP BY p.category
ORDER BY total_sales DESC
LIMIT 1;


-- ==========================================================
-- Query 12 : Revenue by Fulfilment
-- Purpose : Compare fulfilment performance
-- SQL Concept Used : LEFT JOIN + GROUP BY
-- ==========================================================

SELECT
    f.fulfilment,
    SUM(a.amount) AS total_revenue
FROM fulfilment_master f
LEFT JOIN amazon_sales a
ON a.fulfilment = f.fulfilment
GROUP BY f.fulfilment
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 13 : Products Without Sales
-- Purpose : Identify products not linked to sales
-- SQL Concept Used : LEFT JOIN
-- ==========================================================

SELECT
    p.sku,
    p.category
FROM product_master p
LEFT JOIN amazon_sales a
ON p.sku = a.sku
WHERE a.order_id IS NULL;


-- ==========================================================
-- Query 14 : Sales Channel Performance
-- Purpose : Compare revenue by sales channel
-- SQL Concept Used : LEFT JOIN + GROUP BY
-- ==========================================================

SELECT
    f.sales_channel,
    SUM(a.amount) AS total_revenue
FROM fulfilment_master f
LEFT JOIN amazon_sales a
ON f.fulfilment = a.fulfilment
GROUP BY f.sales_channel
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 15 : Complete Business Report
-- Purpose : Display complete sales report
-- SQL Concept Used : Multiple JOIN
-- ==========================================================

SELECT
    a.order_id,
    p.category,
    p.style,
    a.ship_city,
    a.ship_state,
    f.sales_channel,
    f.fulfilled_by,
    a.amount
FROM amazon_sales a
INNER JOIN product_master p
ON a.sku = p.sku
LEFT JOIN fulfilment_master f
ON a.fulfilment = f.fulfilment;

-- ==========================================================
-- Concepts Covered
--
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL OUTER JOIN
-- CROSS JOIN
-- Multiple JOIN
-- GROUP BY
-- SUM()
-- COUNT()
-- LIMIT
-- NULL Handling
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================