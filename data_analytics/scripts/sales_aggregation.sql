-- ========================
-- The total Sales
SELECT SUM(sales_amount) AS total_sales 
FROM sales;

-- ================================
-- How many items are sold
SELECT SUM(quantity) AS total_quantity 
FROM sales;

-- ===============================
-- The average selling price
SELECT AVG(price) AS avg_price 
FROM sales;

-- ==================================
-- The total number of orders
SELECT COUNT(order_number) AS total_orders 
FROM sales;

-- The total number of unique orders
SELECT COUNT(DISTINCT order_number) AS total_orders 
FROM sales;

-- The total orders per Customer
SELECT customer_key, COUNT(order_number) AS total_orders
FROM sales
GROUP BY customer_key;

-- ======================================
-- The total number of products
SELECT COUNT(product_key) AS total_products 
FROM products;

-- ====================================
-- The total number of customers
SELECT COUNT(customer_key) AS total_customers 
FROM customers;

-- ======================================================
-- The total customer records in sales table
SELECT COUNT(customer_key) AS total_customers 
FROM sales;

-- The total unique customers who placed orders
SELECT COUNT(DISTINCT customer_key) AS total_customers 
FROM sales;

-- ==================================
-- The high performing products
SELECT product_key,
       SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_key
HAVING SUM(sales_amount) > 50000;


-- ===================================
-- Overall business performance

SELECT 'Total Sales' AS measure_name,
       SUM(sales_amount) AS measure_value
FROM sales

UNION ALL

SELECT 'Total Quantity',
       SUM(quantity)
FROM sales

UNION ALL

SELECT 'Average Price',
       AVG(price)
FROM sales

UNION ALL

SELECT 'Total Orders',
       COUNT(DISTINCT order_number)
FROM sales

UNION ALL

SELECT 'Total Products',
       COUNT(DISTINCT product_key)
FROM products

UNION ALL

SELECT 'Total Customers',
       COUNT(customer_key)
FROM customers;

