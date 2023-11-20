CREATE OR REPLACE FUNCTION obter_operacoes_por_parcela(
    p_parcela_id NUMBER,    --Substituir pelo valor pedido
    p_data_inicio DATE,     --Substituir pelo valor pedido
    p_data_fim DATE         --Substituir pelo valor pedido
)
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
OPEN v_cursor FOR
SELECT
    o.id AS operacao_id,
    o.data AS data_operacao,
    CASE
        WHEN a.operacao_id IS NOT NULL THEN 'Aplicacao_FP'
        WHEN c.operacao_id IS NOT NULL THEN 'Colheita'
        WHEN d.operacao_id IS NOT NULL THEN 'Desfolha'
        WHEN s.operacao_id IS NOT NULL THEN 'Sementeira'
        WHEN r.operacao_id IS NOT NULL THEN 'Rega'
        WHEN p.operacao_id IS NOT NULL THEN 'Poda'
        WHEN m.operacao_id IS NOT NULL THEN 'Monda'
        WHEN t.operacao_id IS NOT NULL THEN 'Tutoramento'
        WHEN op.operacao_id IS NOT NULL THEN 'OP_Plantacao'
        WHEN m.operacao_id IS NOT NULL THEN 'Mobilizacao_Solo'

        ELSE 'Outro Tipo de Operacao'
        END AS tipo_operacao
FROM
    Operacao_Agricola o
        LEFT JOIN Aplicacao_FP a ON o.id = a.operacao_id AND a.parcela_id = p_parcela_id
        LEFT JOIN Colheita c ON o.id = c.operacao_id AND c.parcela_id = p_parcela_id
        LEFT JOIN Desfolha d ON o.id = d.operacao_id AND d.parcela_id = p_parcela_id
        LEFT JOIN Sementeira s ON o.id = s.operacao_id AND s.parcela_id = p_parcela_id
        LEFT JOIN Rega r ON o.id = r.operacao_id AND r.parcela_id = p_parcela_id
        LEFT JOIN Poda p ON o.id = p.operacao_id AND p.parcela_id = p_parcela_id
        LEFT JOIN Monda m ON o.id = m.operacao_id AND m.parcela = p_parcela_id
        LEFT JOIN Tutoramento t ON o.id = t.operacao_id AND t.parcela = p_parcela_id
        LEFT JOIN OP_Plantacao op ON o.id = op.operacao_id AND op.parcela = p_parcela_id
        LEFT JOIN Mobilizacao_Solo m ON o.id = m.operacao_id AND m.parcela = p_parcela_id

WHERE
    o.data BETWEEN p_data_inicio AND p_data_fim
  AND (a.operacao_id IS NOT NULL OR c.operacao_id IS NOT NULL OR d.operacao_id IS NOT NULL);

RETURN v_cursor;
END;