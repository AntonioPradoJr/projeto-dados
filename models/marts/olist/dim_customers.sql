WITH olist_customers AS(
    SELECT * FROM {{ ref('stg_olist_customers') }}
),

olist_orders AS (
    SELECT * FROM {{ ref('stg_olist_orders')}}    
)

SELECT
    oc.customer_unique_id,
    oc.customer_city,
    oc.customer_state,
    COUNT(oo.order_id)         AS qtd_pedidos,
    MIN(oo.data_compra)        AS data_primeira_compra,
    MAX(oo.data_compra)        AS data_ultima_compra,
    COUNT(oo.order_id) > 1     AS recorrente 
    
FROM
    olist_customers oc
JOIN
    olist_orders oo 
ON
    oc.customer_id = oo.customer_id

GROUP BY
     oc.customer_unique_id, 
     oc.customer_city, 
     oc.customer_state