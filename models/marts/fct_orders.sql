WITH olist_orders AS (
    SELECT * FROM {{ ref('stg_olist_orders') }}
)

SELECT
    COUNT(order_id)                   AS qtd_pedidos, 
    status,
    FORMAT_DATE('%Y-%m', data_compra) AS data_compra
FROM
    olist_orders
GROUP BY 
    status,
    data_compra