-- =========================================
-- Exploring database structure
-- =========================================

SELECT 
	TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

SELECT
	COLUMN_NAME, 
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';


-- =========================================
-- Exploring specific data structure
-- =========================================

SELECT DISTINCT
	country
FROM customers;

SELECT DISTINCT
	product_name,
	category,
    subcategory
FROM products
ORDER BY 1,2,3;
