-- US BD06 Como Gestor Agrícola, pretendo saber o número de fatores de produção aplicados numa
-- dada parcela, para cada tipo de fator, num dado intervalo de tempo.

SELECT
    parcela_id,
    COUNT(*) AS num_fatores_de_producao -- Seleciona a coluna 'parcela_id' e conta o número de linhas correspondentes
FROM
    Plantacao p -- Define a tabela principal como 'Plantacao' e usa a abreviação 'p'
WHERE
        p.parcela_id IS NOT NULL -- Filtra as linhas onde 'parcela_id' não é nulo (apenas plantações associadas a uma parcela)
        -- Verifica se a plantação está ativa no intervalo de tempo
        AND EXISTS (
        SELECT 1 -- Verifica a existência de registos na tabela 'Plantacao_Temporaria'
        FROM Plantacao_Temporaria pt
        WHERE pt.plantacao_id = p.id -- Verifica correspondência na tabela 'Plantacao_Temporaria'
          AND TO_DATE(TO_CHAR(pt.data_fim, 'YYYY/MM/DD'), 'YYYY/MM/DD') >= TO_DATE('2022/01/01', 'YYYY/MM/DD') -- Data de início do intervalo
          AND TO_DATE(TO_CHAR(pt.data_fim, 'YYYY/MM/DD'), 'YYYY/MM/DD') <= TO_DATE('2022/12/31', 'YYYY/MM/DD') -- Data de fim do intervalo
    )
   OR EXISTS (
    SELECT 1
    FROM Plantacao_Permanente pp
    WHERE pp.plantacao_id = p.id -- Verifica correspondência na tabela 'Plantacao_Permanente'
)
GROUP BY
    parcela_id; -- Agrupa os resultados por 'parcela_id'
