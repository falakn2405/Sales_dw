-- =======================================================================
-- Assign row numbers to each customer_id, keeping the latest record as 1

SELECT customer_id, create_date,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY create_date DESC) AS flag_last
FROM customer_info;

-- ============================================
-- Keep only the latest record per customer_id

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY create_date DESC) AS rn
    FROM customer_info
    WHERE customer_id IS NOT NULL
) t
WHERE rn = 1;

-- ====================
-- Fixing extra space

SELECT 
	customer_id, 
    customer_key,
	TRIM(first_name) AS first_name,
	TRIM(last_name) AS last_name,
	TRIM(marital_status) AS marital_status, 
    TRIM(gender) AS gender, 
    create_date, 
    update_date
FROM customer_info;

-- =================================
-- Standardize gender and marital values

SELECT 
	customer_id,
	first_name,
    last_name,
    CASE
		WHEN UPPER(marital_status) = 'S' THEN 'Single'
        WHEN UPPER(marital_status) = 'M' THEN 'Married'
        ELSE 'Other'
	END marital_status,
	CASE 
		WHEN UPPER(gender) = 'F' THEN 'Female'
		WHEN UPPER(gender) = 'M' THEN 'Male'
		ELSE 'Other'
	END gender,
    create_date,
    update_date
FROM customer_info;

