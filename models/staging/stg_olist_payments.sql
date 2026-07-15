WITH source AS(
    SELECT * FROM {{ source('raw', 'olist_orders') }}
)

SELECT
    order_id,
    LOWER(TRIM(payment_type))                   AS payment_type,
    CAST(payment_sequential AS INT64)           AS payment_sequential,
    CAST(payment_installments AS INT64)         AS payment_installments,
    CAST(price AS FLOAT64)                      AS price,
    CAST(freight_value AS FLOAT64)              AS freight_value,
    CAST(payment_value AS FLOAT64)              AS payment_value
FROM
    source