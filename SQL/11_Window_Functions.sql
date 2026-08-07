-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Window Functions
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================

-- ==========================================================
-- Query 1 : Assign row numbers
-- Purpose : Assign unique row numbers
-- SQL Concept Used : ROW_NUMBER()
-- ==========================================================

SELECT
order_id,
amount,
ROW_NUMBER() OVER(ORDER BY amount DESC) AS row_num
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Rank orders by amount
-- Purpose : Rank orders based on sales amount
-- SQL Concept Used : RANK()
-- ==========================================================

SELECT
order_id,
amount,
RANK() OVER(ORDER BY amount DESC) AS sales_rank
FROM amazon_sales;

-- ==========================================================
-- Query 3 : Dense Rank
-- Purpose : Rank without gaps
-- SQL Concept Used : DENSE_RANK()
-- ==========================================================

SELECT
order_id,
amount,
DENSE_RANK() OVER(ORDER BY amount DESC) AS dense_rank
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Row Number within Category
-- Purpose : Number rows inside each category
-- SQL Concept Used : PARTITION BY
-- ==========================================================

SELECT
category,
order_id,
amount,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY amount DESC) AS row_num
FROM amazon_sales;

-- ==========================================================
-- Query 5 : Rank within Category
-- Purpose : Rank products inside category
-- SQL Concept Used : PARTITION BY + RANK()
-- ==========================================================

SELECT
category,
order_id,
amount,
RANK() OVER(PARTITION BY category ORDER BY amount DESC) AS category_rank
FROM amazon_sales;

-- ==========================================================
-- Query 6 : Previous Order Amount
-- Purpose : Compare current and previous order
-- SQL Concept Used : LAG()
-- ==========================================================

SELECT
order_date,
amount,
LAG(amount) OVER(ORDER BY order_date) AS previous_amount
FROM amazon_sales;

-- ==========================================================
-- Query 7 : Next Order Amount
-- Purpose : Compare current and next order
-- SQL Concept Used : LEAD()
-- ==========================================================

SELECT
order_date,
amount,
LEAD(amount) OVER(ORDER BY order_date) AS next_amount
FROM amazon_sales;

-- ==========================================================
-- Query 8 : Running Revenue
-- Purpose : Calculate cumulative revenue
-- SQL Concept Used : SUM() OVER()
-- ==========================================================

SELECT
order_date,
amount,
SUM(amount) OVER(ORDER BY order_date) AS running_total
FROM amazon_sales;

-- ==========================================================
-- Query 9 : Running Quantity
-- Purpose : Calculate cumulative quantity
-- SQL Concept Used : SUM() OVER()
-- ==========================================================

SELECT
order_date,
qty,
SUM(qty) OVER(ORDER BY order_date) AS running_qty
FROM amazon_sales;

-- ==========================================================
-- Query 10 : Running Average Revenue
-- Purpose : Calculate moving average
-- SQL Concept Used : AVG() OVER()
-- ==========================================================

SELECT
order_date,
amount,
AVG(amount) OVER(ORDER BY order_date) AS running_avg
FROM amazon_sales;

-- ==========================================================
-- Query 11 : Highest revenue by category
-- Purpose : Display highest amount in category
-- SQL Concept Used : MAX() OVER()
-- ==========================================================

SELECT
category,
amount,
MAX(amount) OVER(PARTITION BY category) AS highest_category_sale
FROM amazon_sales;

-- ==========================================================
-- Query 12 : Lowest revenue by category
-- Purpose : Display minimum amount in category
-- SQL Concept Used : MIN() OVER()
-- ==========================================================

SELECT
category,
amount,
MIN(amount) OVER(PARTITION BY category) AS lowest_category_sale
FROM amazon_sales;

-- ==========================================================
-- Query 13 : Total category revenue
-- Purpose : Display category total revenue
-- SQL Concept Used : SUM() OVER()
-- ==========================================================

SELECT
category,
amount,
SUM(amount) OVER(PARTITION BY category) AS category_revenue
FROM amazon_sales;

-- ==========================================================
-- Query 14 : Average category revenue
-- Purpose : Display average revenue in category
-- SQL Concept Used : AVG() OVER()
-- ==========================================================

SELECT
category,
amount,
AVG(amount) OVER(PARTITION BY category) AS avg_category_revenue
FROM amazon_sales;


-- ==========================================================
-- Query 15 : Revenue Quartiles
-- Purpose : Divide orders into four revenue groups
-- SQL Concept Used : NTILE()
-- ==========================================================

SELECT
order_id,
amount,
NTILE(4) OVER(ORDER BY amount DESC) AS revenue_quartile
FROM amazon_sales;

-- ==========================================================
-- Concepts Covered
--
-- ROW_NUMBER()
-- RANK()
-- DENSE_RANK()
-- PARTITION BY
-- LAG()
-- LEAD()
-- SUM() OVER()
-- AVG() OVER()
-- MIN() OVER()
-- MAX() OVER()
-- NTILE()
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status  : Completed Successfully
-- File Status   : Ready for Portfolio
-- End of File
-- ==========================================================