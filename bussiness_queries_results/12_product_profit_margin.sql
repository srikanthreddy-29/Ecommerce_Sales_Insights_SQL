-- KPI 12: Product Profit Margin Estimate
-- Goal: Evaluate profitability of products assuming weight as cost proxy.
SELECT 
    oi.product_id,
    product_category,
    ROUND(AVG(price) - AVG(product_weight_g), 2) AS profit_margin
FROM fact_order_items oi
JOIN dim_products p ON oi.product_id = p.product_id
GROUP BY oi.product_id, product_category
ORDER BY profit_margin DESC;
