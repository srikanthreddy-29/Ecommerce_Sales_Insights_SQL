-- KPI 8: Products Low in Stock
-- Goal: Detect products nearing stockout threshold to restock on time.
SELECT 
    product_id,
    product_category,
    product_weight_g
FROM dim_products
WHERE product_weight_g < 10
ORDER BY product_weight_g;
