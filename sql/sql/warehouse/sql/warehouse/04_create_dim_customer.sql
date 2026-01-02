CREATE TABLE dim_customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    country VARCHAR(100)
);

INSERT INTO dim_customer (customer_id, country)
SELECT DISTINCT customer_id, country
FROM stg_online_retail_clean
WHERE customer_id IS NOT NULL;
