SELECT
    p.nome AS produto,
    pc.quantidade AS quantidade_colhida,
    c.data_inicio AS data_colheita_inicio,
    c.semana AS semana_colheita
FROM Colheita co
         JOIN Previsao_Colheita pc ON co.previsao_colheita_id = pc.id
         JOIN Plantacao p ON pc.plantacao_id = p.id
         JOIN Variedade v ON p.variedade_id = v.id
         JOIN Cultura cu ON v.id = cu.variedade_id
         JOIN Parcela pa ON cu.plantacao_id = pa.id
         JOIN Ciclo c ON v.ciclo_id = c.id
WHERE
        pa.id = 101
  AND c.data_inicio BETWEEN '2023-01-01' AND '2023-12-31';