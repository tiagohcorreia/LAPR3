-- US BD06 Como Gestor Agrícola, pretendo saber o número de fatores de produção aplicados numa
-- dada parcela, para cada tipo de fator, num dado intervalo de tempo.

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