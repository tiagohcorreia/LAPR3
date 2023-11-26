SELECT
    Parcela.nome AS nome_parcela,
    Cultura.nome_comum AS nome_cultura,
    Variedade.nome AS nome_variedade,
    Produto.nome AS nome_produto,
    Colheita.quantidade AS quantidade_colhida,
    Colheita.operacao_id,
    Operacao_Agricola.data AS data_operacao
FROM
    Colheita
        JOIN
    Produto ON Colheita.produto_id = Produto.id
        JOIN
    Variedade ON Produto.variedade_id = Variedade.id
        JOIN
    Cultura ON Variedade.cultura_id = Cultura.id
        JOIN
    Parcela ON Colheita.parcela_id = Parcela.id
        JOIN
    Operacao_Agricola ON Colheita.operacao_id = Operacao_Agricola.id
WHERE
    Operacao_Agricola.data BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD') -- mudar para a data desejada
  AND Parcela.id = 102; -- mudar para o id desejado a procurar (parcela)