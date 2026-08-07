{% set date_columns = [('order_purchase_timestamp', 'data_compra'), 
                       ('order_approved_at', 'data_aprovacao_pagamento'), 
                       ('order_estimated_delivery_date', 'data_estimativa_entrega'), 
                       ('order_delivered_carrier_date', 'data_entregue_transportadora'), 
                       ('order_delivered_customer_date', 'data_entregue_cliente') 
] %}

WITH source AS (
    SELECT * FROM {{ source('olist', 'olist_orders') }}
)

SELECT  
    order_id, 
    order_item_id, 
    customer_id,
    seller_id, 
    LOWER(TRIM(order_status))                   AS status,
    {% for original, novo in date_columns %}
        DATE({{ original }}) AS {{ novo }} {% if not loop.last %},{% endif %} 
    {% endfor %}   
FROM
    source



