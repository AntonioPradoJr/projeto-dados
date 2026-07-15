WITH olist_orders AS(
    SELECT * FROM {{ ref('stg_olist_orders') }}
)

SELECT
    order_id,
    status,
    data_compra, 
    DATE_DIFF(data_entregue_cliente, data_estimativa_entrega, DAY) AS dias_atraso,
    DATE_DIFF(data_entregue_cliente, data_estimativa_entrega, DAY) <= 0 AS entregue_no_prazo

FROM    
    olist_orders