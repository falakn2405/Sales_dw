SELECT * FROM customer_info_raw;

TRUNCATE TABLE customer_info_raw;

SELECT COUNT(*) FROM customer_info_raw;

SELECT * FROM product_info_raw;

SELECT COUNT(*) FROM product_info_raw;

SELECT * FROM sales_details;

SELECT COUNT(*) FROM sales_details;

SELECT * FROM customer_loc;

SELECT COUNT(*) FROM customer_loc;

SELECT * FROM customer_profile;

SELECT COUNT(*) FROM customer_profile;

SELECT * FROM product_category;

SELECT COUNT(*) FROM product_category;

TRUNCATE TABLE etl_log;

SELECT * FROM etl_log;

SHOW COLUMNS FROM customer_info_raw;

SELECT * FROM customer_info_clean;

SELECT * FROM product_info_clean;