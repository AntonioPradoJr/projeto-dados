WITH olist_orders AS(
    SELECT * FROM {{ ref('stg_olist_orders') }}
)

SELECT DISTINCT
    order_id,
    customer_id, 
    customer_unique_id,
    status,
    data_compra
FROM
    olist_orders