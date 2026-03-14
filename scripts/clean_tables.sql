-- ==========================================
-- Remove duplicate customers and keep latest

DELETE c
FROM customer_info_clean c
JOIN (
    SELECT customer_id, create_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY create_date DESC) AS rn
    FROM customer_info_clean
) t
ON c.customer_id = t.customer_id
AND c.create_date = t.create_date
WHERE t.rn > 1;

-- ==========================================
-- Remove extra spaces

UPDATE customer_info_clean
SET 
    first_name = TRIM(first_name),
    last_name = TRIM(last_name),
    marital_status = TRIM(marital_status),
    gender = TRIM(gender);

-- ==========================================
-- Standardize categorical values

UPDATE customer_info_clean
SET 
    marital_status = CASE
        WHEN UPPER(marital_status) = 'S' THEN 'Single'
        WHEN UPPER(marital_status) = 'M' THEN 'Married'
        ELSE 'Other'
    END,
    gender = CASE
        WHEN UPPER(gender) = 'F' THEN 'Female'
        WHEN UPPER(gender) = 'M' THEN 'Male'
        ELSE 'Other'
    END;
    
UPDATE product_info_clean
SET
	product_line = CASE UPPER(TRIM(product_line))
		WHEN 'M' THEN 'Mountain'
        WHEN 'R' THEN 'Road'
        WHEN 'S' THEN 'Other Sales'
        WHEN 'T' THEN 'Touring'
        ELSE 'N/A'
	END;
    
-- =========================================
-- Spliting product key into category id
    
UPDATE product_info_clean AS p1
JOIN (
    SELECT 
        product_key, 
        start_date,
        CAST(LEAD(start_date) OVER (PARTITION BY product_key ORDER BY start_date) - INTERVAL 1 DAY AS DATE) AS calculated_end_date
    FROM product_info_raw
) AS p2 
ON p1.product_key = p2.product_key 
AND p1.start_date = p2.start_date
SET 
    p1.start_date = CAST(p1.start_date AS DATE),
    p1.end_date = p2.calculated_end_date;

    
    