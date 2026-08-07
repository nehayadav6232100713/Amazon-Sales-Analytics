CREATE TABLE amazon_sales (

    index_no INT,

    order_id VARCHAR(30),

    order_date DATE,

    status VARCHAR(50),

    fulfilment VARCHAR(50),

    sales_channel VARCHAR(50),

    ship_service_level VARCHAR(30),

    style VARCHAR(30),

    sku VARCHAR(50),

    category VARCHAR(50),

    size VARCHAR(20),

    asin VARCHAR(30),

    courier_status VARCHAR(60),

    qty INT,

    currency VARCHAR(10),

    amount NUMERIC(10,2),

    ship_city VARCHAR(100),

    ship_state VARCHAR(100),

    ship_postal_code VARCHAR(20),

    ship_country VARCHAR(50),

    promotion_ids TEXT,

    b2b BOOLEAN,

    fulfilled_by VARCHAR(50)

);

-- ==========================================================
-- Concepts Covered
--
-- CREATE TABLE
-- Data Types
-- Primary Table Structure
--
-- Total Queries : 1
-- Phase Status  : Completed Successfully
-- ==========================================================