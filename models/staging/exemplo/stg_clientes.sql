WITH source AS(
    SELECT * FROM {{ source ('exemplo', 'clientes') }}
)

SELECT 
    cliente_id,
    LOWER(nome)             AS nome,
    LOWER(cidade)           AS cidade,
    LOWER(TRIM(segmento))   AS segmento,
    DATE(data_cadastro)     AS data_cadastro
FROM
    source