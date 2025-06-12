-- KPI 1: Top 10 Best-Selling Products
-- Goal: Determine which products generate the most revenue and are sold most frequently.
SELECT 
    p.product_id,
    p.product_category,
    COUNT(oi.order_id) AS total_orders,
    SUM(oi.price) AS total_sales_value,
    ROUND(SUM(oi.price) / COUNT(oi.order_id),2) AS avg_order_value
FROM fact_order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_category
ORDER BY total_sales_value DESC
LIMIT 10;
