-- ==============================================
-- Top 5 products generating the highest revenue
SELECT
	p.product_name, p.category,
	SUM(s.sales_amount) total_revenue
FROM sales s
INNER JOIN products p
	ON p.product_key = s.product_key
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 5;

SELECT
	p.subcategory, p.category,
	SUM(s.sales_amount) total_revenue
FROM sales s
INNER JOIN products p
	ON p.product_key = s.product_key
GROUP BY p.subcategory, p.category
ORDER BY total_revenue DESC
LIMIT 5;

-- Bottom 5 worst-performing products in sales
SELECT
	p.product_name, p.category,
	SUM(s.sales_amount) total_revenue
FROM sales s
INNER JOIN products p
	ON p.product_key = s.product_key
GROUP BY p.product_name, p.category
ORDER BY total_revenue
LIMIT 5;

-- Top 10 customers who have generated the highest revenue
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(s.sales_amount) AS total_revenue
FROM sales s
LEFT JOIN customers c
    ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC
LIMIT 10;

-- The 3 customers with the fewest orders placed
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM sales s
LEFT JOIN customers c
    ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders
LIMIT 5;

