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

-- =========================================
-- Standardize values

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

SELECT
	product_id,
    product_key,
    product_name,
    product_cost,
    CASE UPPER(TRIM(product_line))
		WHEN 'M' THEN 'Mountain'
        WHEN 'R' THEN 'Road'
        WHEN 'S' THEN 'Other Sales'
        WHEN 'T' THEN 'Touring'
        ELSE 'N/A'
	END AS product_line,
    start_date,
    end_date,
    update_date
FROM product_info_raw;

-- ============================
-- Extract ID from key 

SELECT 
    product_key,
    REPLACE(SUBSTRING(product_key, 1, 5), '-', '_') AS cat_id,
    SUBSTRING(product_key, 7) AS prod_key
FROM product_info_raw;

SELECT
	cid,
    CASE
		WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LENGTH(cid))
        ELSE cid
	END AS cid
FROM customer_profile_raw;

SELECT cid,
	REPLACE(cid, '-', '') cid
FROM customer_loc_raw;

-- ==============================
-- Fixing dates

SELECT *,
	CAST(start_date AS DATE) AS start_date,
    CAST(LEAD(start_date) OVER (PARTITION BY product_key ORDER BY start_date) - INTERVAL 1 DAY AS DATE) AS end_date
FROM product_info_raw;

SELECT 
    order_date, ship_date, due_date,
    CASE 
        WHEN order_date = 0 OR LENGTH(CAST(order_date AS CHAR)) != 8 THEN NULL
        ELSE STR_TO_DATE(CAST(order_date AS CHAR), '%Y%m%d')
    END AS order_date,
    CASE 
        WHEN ship_date = 0 OR LENGTH(CAST(ship_date AS CHAR)) != 8 THEN NULL
        ELSE STR_TO_DATE(CAST(ship_date AS CHAR), '%Y%m%d')
    END AS ship_date,
    CASE 
        WHEN due_date = 0 OR LENGTH(CAST(due_date AS CHAR)) != 8 THEN NULL
        ELSE STR_TO_DATE(CAST(due_date AS CHAR), '%Y%m%d')
    END AS due_date
FROM 
    sales_details_raw;
    
SELECT bdate,
CASE
	WHEN bdate > NOW() THEN NULL
    ELSE bdate
END AS bdate
FROM customer_profile_raw;

-- =============================================
-- Correcting sales with qunatity and price

SELECT 
	sales, quantity, price,
	CASE
		WHEN sales IS NULL OR sales <= 0 OR sales != quantity * ABS(price)
        THEN quantity * ABS(price)
		ELSE sales
	END AS sales,
    CASE
		WHEN price IS NULL OR price <= 0
        THEN sales / NULLIF(quantity, 0)
        ELSE price
	END AS price
FROM sales_details_raw
