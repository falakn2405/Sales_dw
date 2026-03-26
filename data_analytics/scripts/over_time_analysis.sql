-- ======================================================
-- Analyse sales performance over years and months

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- ==============================================
-- Analysis according to specific format

SELECT 
    DATE_FORMAT(order_date, '%Y-%b') AS order_date, 
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM sales
WHERE order_date IS NOT NULL
GROUP BY DATE_FORMAT(order_date, '%Y-%b')
ORDER BY DATE_FORMAT(order_date, '%Y-%b');

-- ===============================================
-- Cumulative Sales Over Years To see Progress

SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS avgerage_price
FROM
(
    SELECT 
        DATE_FORMAT(order_date, '%Y-01-01') AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM sales
    WHERE order_date IS NOT NULL
    GROUP BY 1
) t;

