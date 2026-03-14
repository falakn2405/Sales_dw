-- Adding one more column for new data info

ALTER TABLE customer_info_raw
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE product_info
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE sales_details
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE customer_loc
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE customer_profile
ADD COLUMN update_date DATETIME DEFAULT NOW();

ALTER TABLE product_category
ADD COLUMN update_date DATETIME DEFAULT NOW();
