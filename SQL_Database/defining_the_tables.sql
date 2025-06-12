-- Create dim_customers
CREATE TABLE dim_customers (
    customer_id VARCHAR PRIMARY KEY,
    customer_unique_id VARCHAR,
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR,
    customer_state VARCHAR
);

-- Create dim_products
CREATE TABLE dim_products (
    product_id VARCHAR PRIMARY KEY,
    product_category VARCHAR,
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- Create dim_sellers
CREATE TABLE dim_sellers (
    seller_id VARCHAR PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR,
    seller_state VARCHAR
);

-- Create dim_geolocation
CREATE TABLE dim_geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR,
    geolocation_state VARCHAR
);

-- Create fact_orders
CREATE TABLE fact_orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR,
    order_status VARCHAR,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

-- Create fact_order_items
CREATE TABLE fact_order_items (
    order_id VARCHAR,
    order_item_id INTEGER,
    product_id VARCHAR,
    seller_id VARCHAR,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC,
    PRIMARY KEY (order_id, order_item_id),
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (seller_id) REFERENCES dim_sellers(seller_id)
);

-- Create fact_payments
CREATE TABLE fact_payments (
    order_id VARCHAR,
    payment_sequential INTEGER,
    payment_type VARCHAR,
    payment_installments INTEGER,
    payment_value NUMERIC,
    FOREIGN KEY (order_id) REFERENCES fact_orders(order_id)
);