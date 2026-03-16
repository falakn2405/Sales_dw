-- ======================================
-- Left Join

SELECT 
    ci.customer_id,
    ci.customer_key,
    ci.first_name,
    ci.last_name,
    ci.marital_status,
    ci.gender,
    ci.create_date,
    cp.bdate,
    cp.gen,
    cl.cntry
FROM customer_info_clean AS ci
LEFT JOIN customer_profile_clean AS cp
	ON ci.customer_key = cp.cid
LEFT JOIN customer_loc_clean AS cl
	ON ci.customer_key = cl.cid;
    

SELECT 
	pi.product_id,
    pi.cat_id,
    pi.product_key,
    pi.product_name,
    pi.product_cost,
    pi.product_line,
    pi.start_date,
    pc.cat,
    pc.subcat,
    pc.maintenance
FROM product_info_clean as pi
LEFT JOIN product_category_clean pc
	ON pi.cat_id = pc.id;


SELECT
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
    
