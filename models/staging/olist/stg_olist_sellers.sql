WITH source AS (
    SELECT * FROM {{ source('olist', 'olist_orders')}}
)

{% set lower_col = ['seller_city',
                   'seller_state'
                   ] 
%}

SELECT
    seller_id,
    {% for col in lower_col %}
        LOWER({{ col }}) AS {{ col }},
    {% endfor %}
    CAST(seller_zip_code_prefix AS INT64)   AS seller_zip_code_prefix
FROM
    source