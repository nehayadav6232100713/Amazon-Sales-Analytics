-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : SQL Views
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Views  : 10
-- ==========================================================

-- ==========================================================
-- View 1 : Category Revenue
-- Purpose : Create reusable category revenue report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_category_revenue AS

SELECT
    category,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category;


-- ==========================================================
-- View 2 : State Revenue
-- Purpose : Create reusable state revenue report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_state_revenue AS

SELECT
    ship_state,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_state;

-- ==========================================================
-- View 3 : Monthly Revenue
-- Purpose : Create reusable monthly sales report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_monthly_revenue AS

SELECT
    EXTRACT(MONTH FROM date) AS month,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY month;


-- ==========================================================
-- View 4 : Top Products
-- Purpose : Create reusable top products report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_top_products AS

SELECT
    sku,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY sku
ORDER BY total_revenue DESC;

-- ==========================================================
-- View 5 : Fulfilment Performance
-- Purpose : Create reusable fulfilment performance report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_fulfilment_performance AS

SELECT
    fulfilment,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY fulfilment;

-- ==========================================================
-- View 6 : B2B Performance
-- Purpose : Create reusable B2B sales report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_b2b_performance AS

SELECT
    b2b,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales
GROUP BY b2b;

-- ==========================================================
-- View 6 : B2B Performance
-- Purpose : Create reusable B2B sales report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_b2b_performance AS

SELECT
    b2b,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales
GROUP BY b2b;

-- ==========================================================
-- View 8 : State Order Summary
-- Purpose : Create reusable state order report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_state_order_summary AS

SELECT
    ship_state,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY ship_state;

-- ==========================================================
-- View 9 : Monthly Sales Dashboard
-- Purpose : Create reusable monthly dashboard report
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_monthly_sales_dashboard AS

SELECT
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    SUM(qty) AS total_quantity
FROM amazon_sales
GROUP BY
    EXTRACT(YEAR FROM date),
    EXTRACT(MONTH FROM date)
ORDER BY
    sales_year,
    sales_month;


	-- ==========================================================
-- View 10 : Executive KPI Dashboard
-- Purpose : Create reusable KPI dashboard
-- SQL Concept Used : CREATE VIEW
-- ==========================================================

CREATE VIEW vw_executive_kpi_dashboard AS

SELECT
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    ROUND(AVG(amount),2) AS average_order_value,
    SUM(qty) AS total_quantity
FROM amazon_sales;


-- ==========================================================
-- Concepts Covered
--
-- CREATE VIEW
-- GROUP BY
-- SUM()
-- COUNT()
-- AVG()
-- EXTRACT()
-- ORDER BY
-- Dashboard Ready Views
--
-- ==========================================================

-- ==========================================================
-- Total Views  : 10
-- Phase Status : Completed Successfully
-- File Status  : Ready for Portfolio
-- End of File
-- ==========================================================

