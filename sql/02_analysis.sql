USE credit_card_churn;

-- Q1: Does churn differ by card tier?
SELECT
    card_category,
    COUNT(*)                       AS customers,
    SUM(churn)                      AS sum_churn,
    ROUND(AVG(churn) * 100, 2)      AS churn_rate_pct
FROM customers
GROUP BY card_category
ORDER BY churn_rate_pct DESC;


-- Q2: Does usage predict churn?
SELECT
    CASE
        WHEN total_trans_ct <= 20 THEN '1-20'
        WHEN total_trans_ct <= 40 THEN '21-40'
        WHEN total_trans_ct <= 60 THEN '41-60'
        WHEN total_trans_ct <= 80 THEN '61-80'
        ELSE '80+'
    END                             AS trans_bucket,
    COUNT(*)                        AS customers,
    ROUND(AVG(churn) * 100, 2)      AS churn_rate_pct
FROM customers
GROUP BY trans_bucket
ORDER BY trans_bucket;

-- Q3: Zoom in on the middle of the usage range
SELECT
    FLOOR(total_trans_ct / 10) * 10  AS trans_floor,
    COUNT(*)                         AS customers,
    ROUND(AVG(churn) * 100, 1)       AS churn_rate_pct
FROM customers
GROUP BY trans_floor
ORDER BY trans_floor;

-- Q4: Combine the two strongest signals to size the at-risk group
SELECT
    CASE WHEN total_trans_ct <= 60 THEN 'low usage' ELSE 'high usage' 
    END AS usage_level,
    CASE WHEN total_relationship_count <= 2 THEN '1-2 products' ELSE '3+ products'
    END AS products,
    COUNT(*)                        AS customers,
    SUM(churn)                      AS churned,
    ROUND(AVG(churn) * 100, 1)      AS churn_rate_pct
FROM customers
GROUP BY usage_level, products
ORDER BY churn_rate_pct DESC;