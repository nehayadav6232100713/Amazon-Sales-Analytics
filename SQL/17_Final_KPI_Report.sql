-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Final KPI Report
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Total Queries: 15
-- ==========================================================


-- ==========================================================
-- Query 1 : Executive KPI - Total Revenue
-- Purpose : Display overall business revenue
-- SQL Concept Used : SUM()
-- ==========================================================

SELECT
SUM(amount) AS total_revenue
FROM amazon_sales;

-- ==========================================================
-- Query 2 : Executive KPI - Total Orders
-- Purpose : Display total number of orders
-- SQL Concept Used : COUNT()
-- ==========================================================

SELECT
COUNT(order_id) AS total_orders
FROM amazon_sales;


-- ==========================================================
-- Query 3 : Executive KPI - Average Order Value
-- Purpose : Display average revenue per order
-- SQL Concept Used : AVG()
-- ==========================================================

SELECT
ROUND(AVG(amount),2) AS average_order_value
FROM amazon_sales;

-- ==========================================================
-- Query 4 : Executive KPI - Total Quantity Sold
-- Purpose : Display total quantity sold
-- SQL Concept Used : SUM()
-- ==========================================================

SELECT
SUM(qty) AS total_quantity_sold
FROM amazon_sales;


-- ==========================================================
-- Query 5 : Highest Revenue Category
-- Purpose : Display best performing category
-- SQL Concept Used : GROUP BY
-- ==========================================================

SELECT
category,
SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1;


-- ==========================================================
-- Query 6 : Revenue Contribution by Category
-- Purpose : Find percentage contribution of each category
-- SQL Concept Used : Window Function
-- ==========================================================

SELECT
    category,
    SUM(amount) AS total_revenue,
    ROUND(
        SUM(amount) * 100.0 /
        SUM(SUM(amount)) OVER (),
        2
    ) AS revenue_percentage
FROM amazon_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- ==========================================================
-- Query 7 : Revenue Ranking by State
-- Purpose : Rank states based on revenue
-- SQL Concept Used : DENSE_RANK()
-- ==========================================================

SELECT
    ship_state,
    SUM(amount) AS total_revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(amount) DESC
    ) AS revenue_rank
FROM amazon_sales
GROUP BY ship_state;


-- ==========================================================
-- Query 8 : Running Revenue
-- Purpose : Calculate cumulative revenue over time
-- SQL Concept Used : Window Function
-- ==========================================================

SELECT
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date
    ) AS running_revenue
FROM amazon_sales;

-- ==========================================================
-- Query 9 : Monthly Revenue Trend
-- Purpose : Display monthly revenue trend
-- SQL Concept Used : GROUP BY + DATE FUNCTIONS
-- ==========================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    sales_year,
    sales_month;

	-- ==========================================================
-- Query 10 : Monthly Order Count
-- Purpose : Display total orders every month
-- SQL Concept Used : GROUP BY + DATE FUNCTIONS
-- ==========================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    COUNT(order_id) AS total_orders
FROM amazon_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    sales_year,
    sales_month;


-- ==========================================================
-- Query 11 : Monthly Revenue Growth
-- Purpose : Compare month-on-month revenue growth
-- SQL Concept Used : LAG()
-- ==========================================================

WITH monthly_sales AS
(
SELECT
EXTRACT(YEAR FROM order_date) AS sales_year,
EXTRACT(MONTH FROM order_date) AS sales_month,
SUM(amount) AS total_revenue
FROM amazon_sales
GROUP BY
EXTRACT(YEAR FROM order_date),
EXTRACT(MONTH FROM order_date)
)

SELECT
sales_year,
sales_month,
total_revenue,

LAG(total_revenue)
OVER(ORDER BY sales_year,sales_month)
AS previous_month_revenue,

ROUND(
(
(total_revenue-
LAG(total_revenue)
OVER(ORDER BY sales_year,sales_month))
/
LAG(total_revenue)
OVER(ORDER BY sales_year,sales_month)
)*100
,2)
AS growth_percentage

FROM monthly_sales;


	-- ==========================================================
-- Query 12 : Top Revenue State
-- Purpose : Display highest performing state
-- SQL Concept Used : LIMIT
-- ==========================================================

SELECT
ship_state,
SUM(amount) AS total_revenue

FROM amazon_sales

GROUP BY ship_state

ORDER BY total_revenue DESC

LIMIT 1;

-- ==========================================================
-- Query 13 : Lowest Revenue State
-- Purpose : Display lowest performing state
-- SQL Concept Used : LIMIT
-- ==========================================================

SELECT
ship_state,
SUM(amount) AS total_revenue

FROM amazon_sales

GROUP BY ship_state

ORDER BY total_revenue ASC

LIMIT 1;


-- ==========================================================
-- Query 14 : Fulfilment Revenue Contribution
-- Purpose : Compare fulfilment contribution
-- SQL Concept Used : Window Function
-- ==========================================================

SELECT

fulfilment,

SUM(amount) AS total_revenue,

ROUND(

SUM(amount)*100.0/

SUM(SUM(amount))
OVER(),

2

)

AS revenue_percentage

FROM amazon_sales

GROUP BY fulfilment

ORDER BY total_revenue DESC;


-- ==========================================================
-- Query 15 : B2B vs B2C Performance
-- Purpose : Compare business sales
-- SQL Concept Used : GROUP BY
-- ==========================================================

SELECT

b2b,

COUNT(order_id) AS total_orders,

SUM(amount) AS total_revenue,

ROUND(AVG(amount),2) AS average_order_value

FROM amazon_sales

GROUP BY b2b;

-- ==========================================================
-- Concepts Covered
--
-- SUM()
-- COUNT()
-- AVG()
-- ROUND()
-- GROUP BY
-- ORDER BY
-- LIMIT
-- WINDOW FUNCTIONS
-- LAG()
-- CTE (WITH)
-- EXTRACT()
--
-- ==========================================================

-- ==========================================================
-- Total Queries : 15
-- Phase Status : Completed Successfully
-- File Status : Ready for Portfolio
-- End of File
-- ==========================================================