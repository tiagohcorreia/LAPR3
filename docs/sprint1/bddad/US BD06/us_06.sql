-- US BD06 Como Gestor Agrícola, pretendo saber o número de fatores de produção aplicados numa
-- dada parcela, para cada tipo de fator, num dado intervalo de tempo.

SELECT
    p.id AS parcela_id,
    fp.tipo_id,
    COUNT(afp.operacao_id) AS numero_de_fatores
FROM
    Parcela p
        LEFT JOIN Plantacao pl ON p.id = pl.parcela_id
        LEFT JOIN Operacao op ON pl.id = op.plantacao_id
        LEFT JOIN Aplicacao_FP afp ON op.id = afp.operacao_id
        LEFT JOIN Fator_Producao fp ON afp.fator_producao_id = fp.id
WHERE
        op.data >= '2016-10-06' AND op.data <= '2016-10-10'
GROUP BY
    p.id, fp.tipo_id;