-- Insert into customers table
TRUNCATE TABLE customers;

LOAD DATA LOCAL INFILE 'D:/Falak/SalesData/data_analytics/dataset/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
	(customer_key, customer_id, customer_number, first_name, last_name, country,
	marital_status, gender, @birthdate, create_date)
SET birthdate = NULLIF(@birthdate,'');

-- Insert into products table
TRUNCATE TABLE products;

LOAD DATA LOCAL INFILE 'D:/Falak/SalesData/data_analytics/dataset/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Insert into sales table
TRUNCATE TABLE sales;

LOAD DATA LOCAL INFILE 'D:/Falak/SalesData/data_analytics/dataset/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
	(order_number, product_key, customer_key, @order_date, @shipping_date, @due_date, sales_amount, quantity, price)
SET 
	order_date = NULLIF(@order_date,''),
	shipping_date = NULLIF(@shipping_date,''),
	due_date = NULLIF(@due_date,'');
