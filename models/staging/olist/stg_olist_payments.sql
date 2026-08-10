
{% set cast_float_col = ['payment_value'
                        ] 
%}

{% set cast_int_col = ['payment_sequential',
                       'payment_installments'
                      ]
%}

WITH source AS(
    SELECT * FROM {{ source('olist', 'olist_orders') }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['order_id', 'payment_type', 'payment_sequential']) }} AS payment_id,
    order_id,
    {{ clean_text('payment_type') }}              AS payment_type,
    {% for col in cast_int_col %}
        CAST({{ col }} AS INT64) AS {{ col }},
    {% endfor %}
    {% for col in cast_float_col %}
        {{ cast_float64(col) }}{% if not loop.last %},{% endif %}
    {% endfor %}    
FROM
    source