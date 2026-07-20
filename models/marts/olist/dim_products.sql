WITH olist_products AS(
    SELECT * FROM {{ ref('stg_olist_products') }}
)

SELECT 
    product_id,
    product_category_name,
    product_weight_g,
    CASE
        WHEN product_weight_g <= 500 THEN 'leve'
        WHEN product_weight_g < 2000 THEN 'medio'
        ELSE 'pesado'
    END AS categoria_peso
FROM
    olist_products