-- KPI 19: Most Frequently Ordered Products and Their Share of Total Orders
-- Goal: Determine which products are ordered the most, and their percentage of total order appearances.

WITH product_order_counts AS (
    SELECT 
        product_id,
        COUNT(DISTINCT order_id) AS product_order_count
    FROM fact_order_items
    GROUP BY product_id
),
total_orders AS (
    SELECT COUNT(DISTINCT order_id) AS total_order_count
    FROM fact_order_items
)

SELECT 
    p.product_category,
    poc.product_order_count,
    ROUND(100.0 * poc.product_order_count / t.total_order_count, 2) AS percent_of_orders
FROM product_order_counts poc
JOIN total_orders t ON 1=1
JOIN dim_products p ON poc.product_id = p.product_id
ORDER BY percent_of_orders DESC
LIMIT 10;
