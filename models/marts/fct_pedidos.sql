WITH pedidos AS (
    SELECT * FROM {{ ref('stg_pedidos') }}
)

SELECT
    cliente_id,
    COUNT(pedido_id)                                    AS total_pedidos,
    SUM(valor)                                          AS valor_total,
    SUM(CASE WHEN status = 'aprovado' THEN valor END)   AS valor_aprovado,
    SUM(CASE WHEN status = 'cancelado' THEN valor END)  AS valor_cancelado,
    MIN(data_pedido)                                    AS primeiro_pedido,
    MAX(data_pedido)                                    AS ultimo_pedido
FROM pedidos
GROUP BY cliente_id