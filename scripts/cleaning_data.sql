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

SELECT DISTINCT sales, quantity, price
FROM sales_details_raw
WHERE 
	sales != quantity * price
    OR sales IS NULL OR quantity IS NULL OR price IS NULL
    OR sales <= 0 OR quantity <= 0 OR price <= 0
ORDER BY sales, quantity, price;

-- ==============================
-- Check invalid dates

SELECT *
	FROM customer_info_raw
    WHERE create_date = '0000-00-00';

SELECT order_date
FROM sales_details_raw
WHERE 
	order_date <= 0 
    OR LENGTH(order_date) != 8
	OR order_date > 20500101 
    OR order_date < 19000101;

SELECT *
FROM sales_details_raw
WHERE
	order_date > ship_date
    OR order_date > due_date;