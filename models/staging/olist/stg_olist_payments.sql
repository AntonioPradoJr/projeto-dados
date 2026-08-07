
{% set cast_float_col = ['price',
                         'freight_value',
                         'payment_value'
                        ] 
%}

{% set cast_int_col = ['payment_sequential',
                       'payment_installments'
                      ]
%}

WITH source AS(
    SELECT * FROM {{ source('olist', 'olist_orders') }}
)

SELECT
    order_id,
    LOWER(TRIM(payment_type))                   AS payment_type,
    {% for col in cast_int_col %}
        CAST({{ col }} AS INT64) AS {{ col }},
    {% endfor %}
    {% for col in cast_float_col %}
        CAST({{ col }} AS FLOAT64) AS {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}    
FROM
    source