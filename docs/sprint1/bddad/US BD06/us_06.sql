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



SELECT
    parcela_id,
    COUNT(*) AS num_fatores_de_producao
FROM
    Plantacao p
WHERE
        p.parcela_id IS NOT NULL
        AND EXISTS (
        SELECT 1
        FROM Plantacao_Temporaria pt
        WHERE pt.plantacao_id = p.id
          AND TO_DATE(TO_CHAR(pt.data_fim, 'YYYY/MM/DD'), 'YYYY/MM/DD') >= TO_DATE('2022/01/01', 'YYYY/MM/DD') -- Data de início do intervalo
          AND TO_DATE(TO_CHAR(pt.data_fim, 'YYYY/MM/DD'), 'YYYY/MM/DD') <= TO_DATE('2022/12/31', 'YYYY/MM/DD') -- Data de fim do intervalo
    )
   OR EXISTS (
    SELECT 1
    FROM Plantacao_Permanente pp
    WHERE pp.plantacao_id = p.id
)
GROUP BY
    parcela_id;