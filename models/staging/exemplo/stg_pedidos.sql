WITH source AS (
    SELECT * FROM {{ source('exemplo', 'pedidos') }}
)

SELECT 
    pedido_id,
    cliente_id,
    CAST(valor AS float64)      AS valor,
    LOWER(TRIM(status))         AS status,
    DATE(data)                  AS data_pedido
FROM source