-- KPI 5: Repeat Purchase Rate
-- Goal: Understand customer loyalty by checking how many customers placed more than one order.

SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM fact_orders
    GROUP BY customer_id
) sub
GROUP BY customer_type;
