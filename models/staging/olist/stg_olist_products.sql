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
    {{ clean_text('product_category_name') }}                           AS product_category_name,
    {% for col in cast_columns %}
        {{ cast_float64(col) }}{% if not loop.last  %},{% endif %}
    {% endfor %}
FROM
    source