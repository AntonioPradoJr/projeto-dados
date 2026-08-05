{% set pay_type = [ 'credit_card',
                    'boleto',
                    'voucher',
                    'debit_card'
                  ]  
%}

WITH stg_payments AS(
    SELECT * FROM {{ ref('stg_olist_payments') }}
),

pivot AS (
    SELECT 
        order_id,
        {% for type in pay_type %}
            SUM(CASE WHEN  payment_type = '{{ type }}' THEN payment_value ELSE 0 END) AS {{type}}_amount {% if not loop.last %},{% endif %} 
        {% endfor %}
    FROM
        stg_payments    
    GROUP BY order_id
)

SELECT * FROM pivot