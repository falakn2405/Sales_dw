-- ========================================================
-- Changing table names and creating new tables to keep raw and clean data separate

RENAME TABLE 
	customer_info TO customer_info_raw;

-- SET sql_mode = REPLACE(REPLACE(@@sql_mode,'NO_ZERO_DATE',''),'NO_ZERO_IN_DATE',''); -- just to get exact same table

CREATE TABLE customer_info_clean AS
SELECT *
FROM customer_info_raw;
