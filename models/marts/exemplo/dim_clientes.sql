WITH clientes AS(
    SELECT * FROM {{ ref('stg_clientes') }}
)

SELECT
    cliente_id,
    nome, 
    cidade,
    segmento,
    data_cadastro
FROM
    clientes