-- ==================================================================================
-- Changing table names and creating new tables to keep raw and clean data separate

RENAME TABLE 
	customer_info TO customer_info_raw,
    product_info TO product_info_raw,
    sales_details TO sales_details_raw;
    
-- =================
-- New Tables

CREATE TABLE customer_info_clean AS
SELECT *
FROM customer_info_raw;

CREATE TABLE product_info_clean AS
SELECT *
FROM product_info_raw;

CREATE TABLE sales_details_clean AS
SELECT *
FROM sales_details_raw;