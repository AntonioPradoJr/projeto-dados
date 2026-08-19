WITH olist_orders_payments AS (
    SELECT * FROM {{ ref('stg_olist_payments') }}
)

SELECT
    order_id,
    payment_type,
    payment_sequential,
    payment_installments,
    payment_value
FROM 
    olist_orders_payments
