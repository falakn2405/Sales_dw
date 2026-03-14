-- ==========================================
-- Checking for null or duplicates

SELECT customer_id, 
	COUNT(*) AS total
	FROM customer_info_raw
	GROUP BY customer_id
	HAVING total > 1 OR customer_id IS NULL;
    
SELECT product_id, 
	COUNT(*) AS total
	FROM product_info_raw
	GROUP BY product_id
	HAVING total > 1 OR product_id IS NULL;
    
SELECT product_cost
	FROM product_info_raw
    WHERE product_cost <= 0;

-- ==========================================
-- Checking extra space before string

SELECT *
FROM customer_info_raw
WHERE first_name != TRIM(first_name)
   OR last_name != TRIM(last_name)
   OR marital_status != TRIM(marital_status)
   OR gender != TRIM(gender);

SELECT *
FROM product_info_raw
WHERE 
	product_name != TRIM(product_name);

-- =======================================
-- Check data consistency

SELECT DISTINCT gender
FROM customer_info_raw;

SELECT DISTINCT marital_status
FROM customer_info_raw;

SELECT DISTINCT product_line
FROM product_info_raw;

