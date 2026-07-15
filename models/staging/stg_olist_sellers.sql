WITH source AS (
    SELECT * FROM {{ source('raw', 'olist_orders')}}
)

SELECT
    seller_id,
    LOWER(seller_city)                      AS seller_city,
    LOWER(seller_state)                     AS seller_state,
    CAST(seller_zip_code_prefix AS INT64)   AS seller_zip_code_prefix
FROM
    source