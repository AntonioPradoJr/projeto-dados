{% set lower_col = ['seller_city',
                   'seller_state'
                   ] 
%}

WITH source AS (
    SELECT * FROM {{ source('olist', 'olist_orders')}}
)

SELECT
    seller_id,
    {% for col in lower_col %}
        LOWER(TRIM({{ col }})) AS {{ col }},
    {% endfor %}
    CAST(seller_zip_code_prefix AS INT64)   AS seller_zip_code_prefix
FROM
    source