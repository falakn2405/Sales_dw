CREATE TABLE Customer_Info (
	customer_id INT PRIMARY KEY,
    customer_key VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    create_date DATE
) CHARACTER SET utf8mb4 ;

CREATE TABLE Product_Info (
	product_id INT PRIMARY KEY,
    product_key VARCHAR(50),
	product_name VARCHAR(50),
    product_cost INT,
    product_line VARCHAR(50),
    start_date DATETIME,
    end_date DATETIME
) CHARACTER SET utf8mb4 ;

CREATE TABLE Sales_Details (
	order_num VARCHAR(50),
    sales_prd_key VARCHAR(50),
    sales_cust_id INT,
    order_date INT,
    ship_date INT,
    due_date INT,
    sales INT,
    quantity INT,
    price INT
) CHARACTER SET utf8mb4 ;

CREATE TABLE Customer_Loc (
	cid VARCHAR(50),
    cntry VARCHAR(50)
) CHARACTER SET utf8mb4 ;

CREATE TABLE Customer_Profile (
	cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
) CHARACTER SET utf8mb4 ;

CREATE TABLE Product_Category (
	id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
) CHARACTER SET utf8mb4 ;
