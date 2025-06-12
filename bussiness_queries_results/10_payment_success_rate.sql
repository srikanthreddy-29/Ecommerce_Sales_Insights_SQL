-- KPI 10: Payment Success Rate
-- Goal: Evaluate payment system efficiency and error rates.
SELECT 
    payment_type,
    COUNT(*) AS total_payments,
    SUM(CASE WHEN payment_value > 0 THEN 1 ELSE 0 END) AS successful_payments,
    ROUND(100.0 * SUM(CASE WHEN payment_value > 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_percentage
FROM fact_payments
GROUP BY payment_type
ORDER BY total_payments DESC;
