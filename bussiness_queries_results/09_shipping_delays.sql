-- KPI 9: Shipping Delays > 3 Days
-- Goal: Identify orders with potential fulfillment issues.
SELECT 
    o.order_id,
    o.customer_id,
    DATE(o.order_purchase_timestamp) AS purchase_date,
    DATE(o.order_delivered_carrier_date) AS delivered_date,
    (DATE(o.order_delivered_carrier_date) - DATE(o.order_purchase_timestamp)) AS delay_days
FROM fact_orders o
WHERE o.order_delivered_carrier_date - o.order_purchase_timestamp > INTERVAL '3 days';
