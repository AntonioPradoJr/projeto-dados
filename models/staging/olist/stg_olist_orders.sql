WITH source AS (
    SELECT * FROM {{ source('raw', 'olist_orders') }}
)

SELECT  
    order_id, 
    order_item_id, 
    customer_id,
    seller_id, 
    LOWER(TRIM(order_status))                   AS status,
    DATE(order_purchase_timestamp)              AS data_compra,
    DATE(order_approved_at)                     AS data_aprovacao_pagamento,
    DATE(order_estimated_delivery_date)         AS data_estimativa_entrega,
    DATE(order_delivered_carrier_date)          AS data_entregue_transportadora,
    DATE(order_delivered_customer_date)         AS data_entregue_cliente
    
FROM
    source



