-- US BD07 Como Gestor Agrícola, pretendo saber o número de operações realizadas numa dada
-- parcela, para cada tipo de operação, num dado intervalo de tempo

SELECT Parcela.nome AS NomeParcela,
       Tipo_Operacao.nome AS TipoOperacao,
       COUNT(Operacao.id) AS NumeroOperacoes
FROM Parcela
         JOIN Plantacao ON Parcela.id = Plantacao.parcela_id
         JOIN Operacao ON Plantacao.id = Operacao.plantacao_id
         JOIN Tipo_Operacao ON Operacao.tipo_operacao_id = Tipo_Operacao.id
WHERE Operacao.data BETWEEN TO_DATE('2016-10-06', 'YYYY-MM-DD') AND TO_DATE('2023-03-20', 'YYYY-MM-DD')
GROUP BY Parcela.nome, Tipo_Operacao.nome
ORDER BY Parcela.nome, Tipo_Operacao.nome;