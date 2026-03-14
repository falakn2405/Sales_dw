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