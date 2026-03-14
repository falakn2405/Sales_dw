-- Adding one more column for new data info

ALTER TABLE customer_info_raw
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE product_info_raw
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE sales_details
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE customer_loc
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE customer_profile
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE product_category
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE product_info_clean
ADD COLUMN cat_id VARCHAR(50) AFTER product_id, CHARACTER SET utf8mb4,
MODIFY start_date DATE,
MODIFY end_date DATE;

