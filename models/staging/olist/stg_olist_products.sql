{% set cast_columns = ['product_name_lenght', 
                       'product_description_lenght', 
                       'product_photos_qty', 
                       'product_weight_g', 
                       'product_length_cm', 
                       'product_height_cm', 
                       'product_width_cm'
]  %}

WITH source AS(
    SELECT * FROM {{ source('olist','olist_orders')}}
)

SELECT
    product_id,
    LOWER(product_category_name)                        AS product_category_name,
    {% for col in cast_columns %}
        CAST({{ col }} AS FLOAT64) AS {{ col }}{% if not loop.last  %},{% endif %}
    {% endfor %}
FROM
    source