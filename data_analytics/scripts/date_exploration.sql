-- =======================================
-- Find the first and last order date

SELECT
	MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM sales;

-- =======================================
-- Years of sales data

SELECT
	MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    TIMESTAMPDIFF(YEAR, MIN(order_date), MAX(order_date)) AS order_range_years
FROM sales;

-- =======================================
-- Months of sales data

SELECT
	MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    TIMESTAMPDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM sales;

-- ================================================
-- Finding youngest and oldest customer birthdate

SELECT
	MIN(birthdate) AS oldest_bday,
    MAX(birthdate) AS youngest_bday
FROM customers;

-- =========================================
-- Age of youngest and oldest customer

SELECT
	TIMESTAMPDIFF(YEAR, MIN(birthdate), NOW()) AS oldest_age,
    TIMESTAMPDIFF(YEAR, MAX(birthdate), NOW()) AS youngest_age
FROM customers;