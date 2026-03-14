-- ==========================================
-- Checking for null or duplicates

SELECT customer_id, 
	COUNT(*) AS total
	FROM customer_info
	GROUP BY customer_id
	HAVING total > 1 OR customer_id IS NULL;

-- ==========================================
-- Checking extra space before string

SELECT *
FROM customer_info
WHERE first_name != TRIM(first_name)
   OR last_name != TRIM(last_name)
   OR marital_status != TRIM(marital_status)
   OR gender != TRIM(gender);

-- =======================================
-- Check data consistency

SELECT DISTINCT gender
FROM customer_info;

SELECT DISTINCT marital_status
FROM customer_info;