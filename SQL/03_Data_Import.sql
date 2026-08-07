-- ==========================================================
-- Project      : Amazon Ecommerce Analytics
-- Phase        : Data Import
-- Author       : Neha Yadav
-- Tool         : PostgreSQL
-- Database     : Amazon_Sales_Analytics_DB
-- Description  : Imported cleaned Amazon sales dataset into PostgreSQL
-- ==========================================================

COPY amazon_sales
FROM 'C:\CSV\CLEANED_DATA_1.csv'
DELIMITER ','
CSV HEADER;


-- ==========================================================
-- Concepts Covered
--
-- COPY
--
-- Total Queries : 1
-- Phase Status  : Completed Successfully
--
-- End of File
-- ==========================================================