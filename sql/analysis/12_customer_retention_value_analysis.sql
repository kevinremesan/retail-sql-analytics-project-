WITH visit_days AS (
    SELECT
        customer_id,
        CAST(order_date AS date) AS visit_date,
        SUM(line_revenue) AS visit_revenue
    FROM fact_sales
    GROUP BY customer_id, CAST(order_date AS date)
),

ranked_visits AS (
    SELECT
        customer_id,
        visit_date,
        visit_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY visit_date
        ) AS visit_number
    FROM visit_days
),

customer_type AS (
    SELECT
        customer_id,
        CASE 
            WHEN MAX(visit_number) = 1 THEN 'Single-Purchase Customer'
            ELSE 'Retained Customer'
        END AS customer_status
    FROM ranked_visits
    GROUP BY customer_id
)

SELECT
    ct.customer_status,
    COUNT(DISTINCT ct.customer_id) AS customers,
    SUM(rv.visit_revenue) AS revenue_generated
FROM ranked_visits rv
JOIN customer_type ct
    ON rv.customer_id = ct.customer_id
GROUP BY ct.customer_status;
