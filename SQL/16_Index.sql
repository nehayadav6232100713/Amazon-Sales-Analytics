-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Indexes
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 8
-- ==========================================================

-- ==========================================================
-- Query 1 : Create Index on Order ID
-- Purpose : Speed up searches using Order ID
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_order_id
ON amazon_sales(order_id);

-- ==========================================================
-- Query 2 : Create Index on SKU
-- Purpose : Speed up product searches
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_sku
ON amazon_sales(sku);

-- ==========================================================
-- Query 3 : Create Index on Category
-- Purpose : Speed up category-based filtering
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_category
ON amazon_sales(category);

-- ==========================================================
-- Query 4 : Create Index on Ship State
-- Purpose : Speed up state-wise analysis
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_ship_state
ON amazon_sales(ship_state);


-- ==========================================================
-- Query 5 : Create Composite Index
-- Purpose : Improve filtering using Category and State together
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_category_state
ON amazon_sales(category, ship_state);


-- ==========================================================
-- Query 6 : Create Index on Ship City
-- Purpose : Speed up city-based filtering
-- SQL Concept Used : CREATE INDEX
-- ==========================================================

CREATE INDEX idx_ship_city
ON amazon_sales(ship_city);

-- ==========================================================
-- Query 7 : Drop an Index
-- Purpose : Remove an existing index when no longer required
-- SQL Concept Used : DROP INDEX
-- ==========================================================

DROP INDEX idx_ship_city;


-- ==========================================================
-- Query 8 : View All Indexes
-- Purpose : Display all indexes created on amazon_sales table
-- SQL Concept Used : pg_indexes
-- ==========================================================

SELECT
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename = 'amazon_sales';


-- ==========================================================
-- Concepts Covered
--
-- CREATE INDEX
-- Composite Index
-- DROP INDEX
-- View Existing Indexes
-- Query Performance Optimization
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 8
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================