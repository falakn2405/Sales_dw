-- =======================
-- Creating views

CREATE VIEW customers AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_key,
    ci.customer_id,
    ci.customer_key AS customer_num,
    ci.first_name,
    ci.last_name,
    cl.cntry AS country,
    CASE
		WHEN ci.gender != 'Other' THEN ci.gender
        ELSE COALESCE(cp.gen, 'Other')
	END AS gender,
    ci.marital_status,
    cp.bdate AS birthdate,
    ci.create_date
FROM customer_info_clean AS ci
LEFT JOIN 
	customer_profile_clean AS cp
ON	
	ci.customer_key = cp.cid
LEFT JOIN 
	customer_loc_clean AS cl
ON 	
	ci.customer_key = cl.cid;

  
CREATE VIEW products AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY pi.product_key) AS product_key,
	pi.product_id,
    pi.product_key AS product_num,
    pi.product_name,
    pi.cat_id AS category_id,
    pc.cat AS category,
    pc.subcat AS subcategory,
    pi.product_cost,
    pi.product_line,
    pc.maintenance,
    pi.start_date
FROM product_info_clean as pi
LEFT JOIN 
	product_category_clean pc
ON
	pi.cat_id = pc.id;


CREATE VIEW sales AS
SELECT
	ROW_NUMBER() OVER (ORDER BY order_num) AS order_key,
    sd.order_num,
    p.product_key,
    c.customer_key,
    sd.order_date,
    sd.ship_date,
    sd.due_date,
    sd.sales,
    sd.quantity,
    sd.price
FROM sales_details_clean sd
LEFT JOIN products p
	ON sd.sales_prd_key = p.product_num
LEFT JOIN customers c
	ON sd.sales_cust_id = c.customer_id;

