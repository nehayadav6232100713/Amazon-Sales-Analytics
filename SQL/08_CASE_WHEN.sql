-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : CASE WHEN
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Classify order value
-- Purpose : Categorize orders based on amount
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    amount,
    CASE
        WHEN amount >= 2000 THEN 'High Value'
        WHEN amount >= 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Classify quantity purchased
-- Purpose : Categorize customer order quantity
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    qty,
    CASE
        WHEN qty >= 5 THEN 'Bulk Order'
        WHEN qty >= 2 THEN 'Normal Order'
        ELSE 'Single Order'
    END AS quantity_type
FROM amazon_sales;

-- ==========================================================
-- Query 3 : Customer type classification
-- Purpose : Identify B2B and B2C customers
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    b2b,
    CASE
        WHEN b2b = TRUE THEN 'Business Customer'
        ELSE 'Retail Customer'
    END AS customer_type
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Order status classification
-- Purpose : Group orders into business categories
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    status,
    CASE
        WHEN status = 'Shipped' THEN 'Completed'
        WHEN status = 'Cancelled' THEN 'Cancelled'
        ELSE 'In Process'
    END AS order_category
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Fulfilment classification
-- Purpose : Identify fulfilment source
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    fulfilment,
    CASE
        WHEN fulfilment = 'Amazon' THEN 'Amazon Fulfilled'
        ELSE 'Merchant Fulfilled'
    END AS fulfilment_type
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Fulfilment classification
-- Purpose : Identify fulfilment source
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    fulfilment,
    CASE
        WHEN fulfilment = 'Amazon' THEN 'Amazon Fulfilled'
        ELSE 'Merchant Fulfilled'
    END AS fulfilment_type
FROM amazon_sales;

-- ==========================================================
-- Query 7 : Courier status classification
-- Purpose : Categorize courier status
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    courier_status,
    CASE
        WHEN courier_status = 'Shipped' THEN 'In Transit'
        WHEN courier_status = 'Cancelled' THEN 'Cancelled'
        ELSE 'Pending'
    END AS shipment_status
FROM amazon_sales;

-- ==========================================================
-- Query 8 : Product size classification
-- Purpose : Categorize product sizes
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    size,
    CASE
        WHEN size IN ('XS','S') THEN 'Small'
        WHEN size IN ('M','L') THEN 'Medium'
        ELSE 'Large'
    END AS size_group
FROM amazon_sales;

-- ==========================================================
-- Query 9 : Revenue segment
-- Purpose : Categorize revenue into business segments
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    amount,
    CASE
        WHEN amount >= 3000 THEN 'Premium'
        WHEN amount >= 1500 THEN 'Standard'
        ELSE 'Budget'
    END AS revenue_segment
FROM amazon_sales;

-- ==========================================================
-- Query 10 : Quantity status
-- Purpose : Identify order size
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    qty,
    CASE
        WHEN qty = 1 THEN 'Single Item'
        ELSE 'Multiple Items'
    END AS order_size
FROM amazon_sales;

-- ==========================================================
-- Query 11 : Amount availability
-- Purpose : Check whether amount exists
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    amount,
    CASE
        WHEN amount IS NULL THEN 'Missing Amount'
        ELSE 'Available'
    END AS amount_status
FROM amazon_sales;


-- ==========================================================
-- Query 12 : Postal code availability
-- Purpose : Check missing postal codes
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    ship_postal_code,
    CASE
        WHEN ship_postal_code IS NULL THEN 'Missing'
        ELSE 'Available'
    END AS postal_status
FROM amazon_sales;

-- ==========================================================
-- Query 13 : High quantity flag
-- Purpose : Flag orders with high quantity
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    qty,
    CASE
        WHEN qty >= 10 THEN 'High Quantity'
        ELSE 'Normal Quantity'
    END AS quantity_flag
FROM amazon_sales;

-- ==========================================================
-- Query 14 : State grouping
-- Purpose : Group selected states
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    ship_state,
    CASE
        WHEN ship_state IN ('Maharashtra','Delhi','Karnataka') THEN 'Major Market'
        ELSE 'Other Market'
    END AS market_group
FROM amazon_sales;


-- ==========================================================
-- Query 15 : Business order classification
-- Purpose : Classify business priority
-- SQL Concept Used : CASE WHEN
-- ==========================================================

SELECT
    order_id,
    amount,
    qty,
    CASE
        WHEN amount >= 2000 AND qty >= 3 THEN 'Priority Order'
        ELSE 'Regular Order'
    END AS business_priority
FROM amazon_sales;

-- ==========================================================
-- Concepts Covered
--
-- CASE WHEN
-- CASE WHEN with AND
-- CASE WHEN with IN
-- CASE WHEN with IS NULL
-- Multiple Conditions
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- End of File
-- ==========================================================

