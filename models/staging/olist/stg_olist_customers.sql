WITH source AS(
    SELECT * FROM {{ source('olist', 'olist_orders') }}
)

SELECT
    customer_id,
    customer_unique_id,
    CAST(customer_zip_code_prefix AS INT64)                AS customer_zip_code_prefix,
    LOWER(customer_city)                                   AS customer_city,
    LOWER(customer_state)                                  AS customer_state
    
FROM
    source