WITH clientes AS(
    SELECT * FROM {{ ref('dim_clientes') }}
),

pedidos AS(
    SELECT * FROM {{ ref('fct_pedidos') }}
)


SELECT  
    segmento,
    SUM(valor_total) AS total_vendas
FROM
    clientes cli
JOIN
    pedidos ped on cli.cliente_id = ped.cliente_id

GROUP BY segmento
    