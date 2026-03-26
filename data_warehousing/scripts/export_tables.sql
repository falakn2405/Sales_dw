-- ==============================================================
-- DATA EXPORT SCRIPT
-- Export cleaned tables into CSV files
-- ==============================================================

-- ==============================================================
-- EXPORT CUSTOMERS TABLE

SELECT
    'customer_key', 'customer_id', 'customer_num', 'first_name', 'last_name',
    'country', 'gender', 'marital_status', 'birthdate', 'create_date'
UNION ALL
SELECT
    customer_key,
    customer_id,
    customer_num,
    first_name,
    last_name,
    country,
    gender,
    marital_status,
    birthdate,
    create_date
FROM customers
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

-- ==============================================================
-- EXPORT PRODUCTS TABLE

SELECT
    'product_key', 'product_id', 'product_num', 'product_name',
    'category_id', 'category', 'subcategory', 'product_cost',
    'product_line', 'maintenance', 'start_date'
UNION ALL
SELECT
    product_key,
    product_id,
    product_num,
    product_name,
    category_id,
    category,
    subcategory,
    product_cost,
    product_line,
    maintenance,
    start_date
FROM products
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

-- ==============================================================
-- EXPORT SALES TABLE

SELECT
    'order_key', 'order_num', 'product_key', 'customer_key',
    'order_date', 'ship_date', 'due_date',
    'sales', 'quantity', 'price'
UNION ALL
SELECT
    order_key,
    order_num,
    product_key,
    customer_key,
    order_date,
    ship_date,
    due_date,
    sales,
    quantity,
    price
FROM sales
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';