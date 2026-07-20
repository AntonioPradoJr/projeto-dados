WITH olist_payments AS(
    SELECT * FROM {{ ref('stg_olist_payments') }}
)

SELECT
    payment_type               AS tipo_pagamento,
    COUNT(payment_type)        AS qtd_pagamento_metodo,
    AVG(payment_value)         AS ticket_medio_metodo,
    SUM(payment_value)         AS total_pagamento_metodo,
    AVG(payment_installments)  AS media_qtd_parcelas
FROM
    olist_payments

GROUP BY payment_type