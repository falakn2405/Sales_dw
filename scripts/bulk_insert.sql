-- customer
SET @start_time := NOW();

TRUNCATE TABLE customer_info_raw;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/customer_info.csv'
INTO TABLE customer_info_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
    'customer_info',
    @start_time,
    NOW(),
    TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

-- =====================================================================

-- products
SET @start_time := NOW();

TRUNCATE TABLE product_info_raw;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/product_info.csv'
INTO TABLE product_info_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
	'product_info',
	@start_time,
	NOW(),
	TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

-- =====================================================================

-- sales
SET @start_time := NOW();

TRUNCATE TABLE sales_details;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/sales_details.csv'
INTO TABLE sales_details
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
	'sales_details',
	@start_time,
	NOW(),
	TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

-- =====================================================================

-- location
SET @start_time := NOW();

TRUNCATE TABLE customer_loc;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/customer_loc.csv'
INTO TABLE customer_loc
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
	'customer_loc',
	@start_time,
	NOW(),
	TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

-- =====================================================================

-- profile
SET @start_time := NOW();

TRUNCATE TABLE customer_profile;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/customer_profile.csv'
INTO TABLE customer_profile
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
	'customer_profile',
	@start_time,
	NOW(),
	TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

-- =====================================================================

-- category
SET @start_time := NOW();

TRUNCATE TABLE product_category;

LOAD DATA LOCAL INFILE 'D:/Falak/Sales_dw/dataset/product_category.csv'
INTO TABLE product_category
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

INSERT INTO etl_log(tbl_name, start_time, end_time, duration_seconds, log_status)
VALUES (
	'customer_info',
	@start_time,
	NOW(),
	TIMESTAMPDIFF(SECOND,@start_time,NOW()),
    'SUCCESS'
);

