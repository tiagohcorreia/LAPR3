SELECT
    Fator_Producao.nome AS nome_fator,
    Composto_Quimico.nome AS nome_substancia,
    Ficha_Tecnica.quantidade AS quantidade,
    Operacao_Agricola.data AS data_operacao
FROM
    Fator_Producao
        JOIN
    Ficha_Tecnica ON Fator_Producao.id = Ficha_Tecnica.fator_producao_id
        JOIN
    Composto_Quimico ON Ficha_Tecnica.composto_quimico_id = Composto_Quimico.id
        JOIN
    Aplicacao_FP ON Fator_Producao.id = Aplicacao_FP.fator_producao_id
        JOIN
    Operacao_Agricola ON Aplicacao_FP.operacao_id = Operacao_Agricola.id
        JOIN
    Parcela ON Aplicacao_FP.parcela_id = Parcela.id
WHERE
        Parcela.id = :id_da_parcela -- substitua :id_da_parcela pelo ID da parcela desejada
  AND Operacao_Agricola.data BETWEEN TO_DATE(:data_inicio, 'YYYY-MM-DD') AND TO_DATE(:data_fim, 'YYYY-MM-DD');
