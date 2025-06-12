-- KPI 14: Average Freight Cost by Seller
-- Goal: Identify which sellers incur higher or lower average freight costs to help optimize shipping partnerships.

SELECT 
    s.seller_id,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight_cost,
    COUNT(oi.order_id) AS total_orders
FROM fact_order_items oi
JOIN dim_sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
HAVING COUNT(oi.order_id) > 10
ORDER BY avg_freight_cost DESC
LIMIT 10;
