--Create Database
CREATE DATABASE nl2sql_SuperStore;


--Create table superstore
CREATE TABLE superstore (
    row_id INT,
    order_id TEXT,
    order_date DATE,
    ship_date DATE,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(4,2),
    profit NUMERIC(10,2),
    order_year INT,
    order_month TEXT,
    order_month_year DATE,
    profit_margin NUMERIC(5,2)
);


--Copy data from CSV
COPY superstore
FROM '/path/to/superstore_cleaned.csv'
DELIMITER ','
CSV HEADER;
-- Path depends on your system (pgAdmin / local machine)


INSERT INTO customer (
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
FROM superstore
ON CONFLICT (customer_id) DO NOTHING;

--Make sure:
•	INSERT INTO customer is present
•	ON CONFLICT is at the very end
•	Only this query is selected

SELECT * FROM superstore;


--Verify (You already did, but repeat)
SELECT COUNT(*) FROM customer;
SELECT COUNT(DISTINCT customer_id) FROM superstore;

==These two numbers should match.


--Schema of Product table
CREATE TABLE product (
    product_id VARCHAR PRIMARY KEY,
    product_name VARCHAR,
    category VARCHAR,
    sub_category VARCHAR
);


INSERT INTO product (
    product_id,
    product_name,
    category,
    sub_category
)
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category
FROM superstore
ON CONFLICT (product_id) DO NOTHING;


--Order Table Schema
CREATE TABLE orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR,
    customer_id VARCHAR,
    product_id VARCHAR,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC
);


INSERT INTO orders (
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    row_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM superstore;


-- Adding foreign key
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_product
FOREIGN KEY (product_id)
REFERENCES product(product_id);

Create VIEW CREATE VIEW superstore_analytics AS
SELECT
    o.order_id,
    o.order_date,
    o.ship_date,
    o.ship_mode,
    o.sales,
    o.profit,
    o.quantity,
    o.discount,
    p.product_name,
    p.category,
    p.sub_category,
    c.customer_name,
    c.segment,
    c.region,
    c.country,
    c.state,
    c.city
FROM orders o
JOIN product p ON o.product_id = p.product_id
JOIN customer c ON o.customer_id = c.customer_id;

--they both should match
SELECT COUNT(*) FROM superstore_analytics;
SELECT COUNT(*) FROM orders;

--Trial query
SELECT category, SUM(sales)
FROM superstore_analytics
GROUP BY category;

