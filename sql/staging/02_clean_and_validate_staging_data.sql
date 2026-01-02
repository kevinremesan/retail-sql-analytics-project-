CREATE TABLE stg_online_retail_clean AS
SELECT
    invoice_no,
    stock_code,
    description,

    TRY_CAST(quantity AS INT) AS quantity,
    TRY_CAST(unit_price AS DECIMAL(10,2)) AS unit_price,
    TRY_CAST(invoice_date AS DATETIME) AS invoice_date,

    NULLIF(customer_id,'') AS customer_id,
    country
FROM stg_online_retail
WHERE
    TRY_CAST(quantity AS INT) IS NOT NULL
    AND TRY_CAST(unit_price AS DECIMAL(10,2)) IS NOT NULL
    AND TRY_CAST(invoice_date AS DATETIME) IS NOT NULL;
