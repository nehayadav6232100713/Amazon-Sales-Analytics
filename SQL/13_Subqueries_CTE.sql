-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Subqueries & CTE
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Orders Above Average Amount
-- Purpose : Display orders having amount greater than average
-- SQL Concept Used : Single Row Subquery
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount >
(
SELECT AVG(amount)
FROM amazon_sales
);

-- ==========================================================
-- Query 2 : Highest Amount
-- Purpose : Display order having maximum amount
-- SQL Concept Used : MAX() Subquery
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount =
(
SELECT MAX(amount)
FROM amazon_sales
);

-- ==========================================================
-- Query 3 : Lowest Amount
-- Purpose : Display order having minimum amount
-- SQL Concept Used : MIN() Subquery
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE amount =
(
SELECT MIN(amount)
FROM amazon_sales
);

-- ==========================================================
-- Query 4 : Quantity Above Average
-- Purpose : Display orders with quantity above average
-- SQL Concept Used : AVG() Subquery
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE qty >
(
SELECT AVG(qty)
FROM amazon_sales
);

-- ==========================================================
-- Query 5 : Orders from Top Categories
-- Purpose : Display orders from selected categories
-- SQL Concept Used : IN
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE category IN
(
SELECT DISTINCT category
FROM amazon_sales
WHERE amount>1000
);

-- ==========================================================
-- Query 6 : NOT IN Example
-- Purpose : Display categories not matching condition
-- SQL Concept Used : NOT IN
-- ==========================================================

SELECT *
FROM amazon_sales
WHERE category NOT IN
(
SELECT DISTINCT category
FROM amazon_sales
WHERE qty>5
);

-- ==========================================================
-- Query 7 : EXISTS Example
-- Purpose : Check matching SKU
-- SQL Concept Used : EXISTS
-- ==========================================================

SELECT DISTINCT sku
FROM product_master p
WHERE EXISTS
(
SELECT 1
FROM amazon_sales a
WHERE a.sku=p.sku
);

-- ==========================================================
-- Query 8 : NOT EXISTS Example
-- Purpose : Display unmatched SKU
-- SQL Concept Used : NOT EXISTS
-- ==========================================================

SELECT DISTINCT sku
FROM product_master p
WHERE NOT EXISTS
(
SELECT 1
FROM amazon_sales a
WHERE a.sku=p.sku
);


-- ==========================================================
-- Query 9 : Basic CTE
-- Purpose : Display orders above average amount
-- SQL Concept Used : WITH
-- ==========================================================

WITH avg_sales AS
(
SELECT AVG(amount) avg_amount
FROM amazon_sales
)

SELECT *
FROM amazon_sales,avg_sales
WHERE amount>avg_amount;


-- ==========================================================
-- Query 10 : Revenue by Category
-- Purpose : Display category revenue
-- SQL Concept Used : CTE
-- ==========================================================

WITH category_sales AS
(
SELECT
category,
SUM(amount) total_revenue
FROM amazon_sales
GROUP BY category
)

SELECT *
FROM category_sales
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 11 : Top Category
-- Purpose : Display highest revenue category
-- SQL Concept Used : CTE
-- ==========================================================

WITH category_sales AS
(
SELECT
category,
SUM(amount) total_revenue
FROM amazon_sales
GROUP BY category
)

SELECT *
FROM category_sales
ORDER BY total_revenue DESC
LIMIT 1;

-- ==========================================================
-- Query 12 : State Revenue
-- Purpose : Calculate revenue by state
-- SQL Concept Used : CTE
-- ==========================================================

WITH state_sales AS
(
SELECT
ship_state,
SUM(amount) total_sales
FROM amazon_sales
GROUP BY ship_state
)

SELECT *
FROM state_sales
ORDER BY total_sales DESC;

-- ==========================================================
-- Query 13 : Multiple CTE
-- Purpose : Compare category and state revenue
-- SQL Concept Used : Multiple CTE
-- ==========================================================

WITH category_sales AS
(
SELECT
category,
SUM(amount) total_sales
FROM amazon_sales
GROUP BY category
),

state_sales AS
(
SELECT
ship_state,
SUM(amount) total_sales
FROM amazon_sales
GROUP BY ship_state
)

SELECT *
FROM category_sales;

-- ==========================================================
-- Query 14 : KPI Report
-- Purpose : Display KPI Summary
-- SQL Concept Used : CTE
-- ==========================================================

WITH sales_summary AS
(
SELECT
COUNT(*) total_orders,
SUM(amount) total_revenue,
AVG(amount) avg_revenue
FROM amazon_sales
)

SELECT *
FROM sales_summary;


-- ==========================================================
-- Query 15 : Business Report
-- Purpose : Display revenue by category
-- SQL Concept Used : CTE
-- ==========================================================

WITH sales_report AS
(
SELECT
category,
COUNT(*) total_orders,
SUM(amount) total_revenue,
AVG(amount) avg_revenue

FROM amazon_sales

GROUP BY category
)

SELECT *
FROM sales_report
ORDER BY total_revenue DESC;


-- ==========================================================
-- Concepts Covered
--
-- Single Row Subquery
-- MAX()
-- MIN()
-- AVG()
-- IN
-- NOT IN
-- EXISTS
-- NOT EXISTS
-- WITH
-- Multiple CTE
-- GROUP BY
-- ORDER BY
-- LIMIT
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================