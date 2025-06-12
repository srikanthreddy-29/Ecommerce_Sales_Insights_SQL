-- KPI 11: Top Performing Sellers
-- Goal: Identify sellers who contribute most to revenue and fulfillment.
SELECT 
    s.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_sales
FROM fact_order_items oi
JOIN dim_sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY total_sales DESC
LIMIT 5;
