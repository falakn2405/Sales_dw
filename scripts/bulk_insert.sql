LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/customer_info.csv'
INTO TABLE customer_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/product_info.csv'
INTO TABLE product_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/sales_details.csv'
INTO TABLE sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/customer_loc.csv'
INTO TABLE customer_loc
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/customer_profile.csv'
INTO TABLE customer_profile
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Falak/DataWarehouse/dataset/product_category.csv'
INTO TABLE product_category
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;