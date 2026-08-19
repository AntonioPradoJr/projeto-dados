WITH olist_order_items AS (
    SELECT * FROM {{ ref('stg_olist_orders') }}
)

SELECT 
    order_id, 
    status,
    order_item_id, 
    customer_id,
    seller_id,
    product_id,
    price,
    freight_value
    data_compra, 
    data_aprovacao_pagamento,
    data_estimativa_entrega,
    data_entregue_transportadora,
    data_entregue_cliente,
    DATE_DIFF(data_entregue_cliente, data_estimativa_entrega, DAY) AS dias_atraso,
    DATE_DIFF(data_entregue_cliente, data_estimativa_entrega, DAY) <= 0 AS entregue_no_prazo

FROM
    olist_order_items