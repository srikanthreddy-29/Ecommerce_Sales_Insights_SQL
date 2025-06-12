-- KPI 20: Delivery Performance Overview
-- Goal: Evaluate delivery efficiency by showing total deliveries, how many were on time, and the on-time delivery rate.

SELECT 
    COUNT(*) AS total_deliveries,
    COUNT(CASE 
        WHEN o.order_delivered_customer_date <= oi.shipping_limit_date THEN 1 
    END) AS on_time_deliveries,
    ROUND(100.0 * COUNT(CASE 
        WHEN o.order_delivered_customer_date <= oi.shipping_limit_date THEN 1 
    END) / COUNT(*), 2) AS on_time_delivery_percentage
FROM fact_orders o
JOIN fact_order_items oi ON o.order_id = oi.order_id
WHERE o.order_delivered_customer_date IS NOT NULL 
  AND oi.shipping_limit_date IS NOT NULL;
