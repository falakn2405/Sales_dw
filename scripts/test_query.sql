-- ==========================================
-- Customer Table

SELECT * FROM customer_info_raw;

TRUNCATE TABLE customer_info_raw;

SELECT COUNT(*) FROM customer_info_raw;

SHOW COLUMNS FROM customer_info_raw;

SELECT * FROM customer_info_clean;

-- ==========================================
-- Product Table

SELECT * FROM product_info_raw;

SELECT COUNT(*) FROM product_info_raw;

SELECT * FROM product_info_clean;

-- ==========================================
-- Sales Table

SELECT * FROM sales_details_raw;

SELECT COUNT(*) FROM sales_details_raw;

SELECT * FROM sales_details_clean;

-- ==========================================
-- Customer Location Table

SELECT * FROM customer_loc_raw;

SELECT COUNT(*) FROM customer_loc_raw;

SELECT * FROM customer_loc_clean;

-- ==========================================
-- Customer Profile Table

SELECT * FROM customer_profile_raw;

SELECT COUNT(*) FROM customer_profile_raw;

SELECT * FROM customer_profile_clean;

-- ==========================================
-- Product Category Table

SELECT * FROM product_category_raw;

SELECT COUNT(*) FROM product_category_raw;

SELECT * FROM product_category_clean;

-- ==========================================
-- Log Table

TRUNCATE TABLE etl_log;

SELECT * FROM etl_log;


