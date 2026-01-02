INSERT INTO fact_sales (
    invoice_no,
    customer_id,
    product_id,
    date_id,
    quantity,
    unit_price,
    line_revenue
)
SELECT
    s.invoice_no,
    s.customer_id,
    p.product_id,
    CONVERT(INT, FORMAT(s.invoice_date,'yyyyMMdd')) AS date_id,
    s.quantity,
    s.unit_price,
    s.quantity * s.unit_price AS line_revenue
FROM stg_online_retail_clean s
JOIN dim_product p
    ON s.stock_code = p.stock_code;
