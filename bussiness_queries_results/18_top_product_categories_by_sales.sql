-- KPI 18: Most Frequently Purchased Product Categories
-- Goal: Identify which product categories are purchased most often to guide inventory and marketing strategies.

SELECT 
    p.product_category,
    COUNT(oi.product_id) AS total_units_sold
FROM fact_order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_units_sold DESC
LIMIT 10;
