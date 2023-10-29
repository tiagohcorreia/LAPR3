SELECT afp.fator_producao_id, COUNT(afp.operacao_id) AS num_aplicacoes
FROM Aplicacao_FP afp
         JOIN Operacao o ON afp.operacao_id = o.id
WHERE o.data BETWEEN TO_DATE('2016-10-06', 'YYYY-MM-DD') AND TO_DATE('2020-10-27', 'YYYY-MM-DD')
GROUP BY afp.fator_producao_id
ORDER BY COUNT(afp.operacao_id) DESC
    FETCH FIRST 1 ROW ONLY;

SELECT afp.fator_producao_id, COUNT(afp.operacao_id) AS num_aplicacoes
FROM Aplicacao_FP afp
         JOIN Operacao o ON afp.operacao_id = o.id
WHERE o.data BETWEEN TO_DATE('2020-07-03', 'YYYY-MM-DD') AND TO_DATE('2019-10-04', 'YYYY-MM-DD')
GROUP BY afp.fator_producao_id
ORDER BY COUNT(afp.operacao_id) DESC
    FETCH FIRST 1 ROW ONLY;



SELECT afp.fator_producao_id, COUNT(afp.operacao_id) AS num_aplicacoes
FROM Aplicacao_FP afp
         JOIN Operacao o ON afp.operacao_id = o.id
WHERE o.data BETWEEN TO_DATE('2019-11-15', 'YYYY-MM-DD') AND TO_DATE('2020-01-27', 'YYYY-MM-DD')
GROUP BY afp.fator_producao_id
ORDER BY COUNT(afp.operacao_id) DESC
    FETCH FIRST 1 ROW ONLY;




SELECT afp.fator_producao_id, COUNT(afp.operacao_id) AS num_aplicacoes
FROM Aplicacao_FP afp
         JOIN Operacao o ON afp.operacao_id = o.id
WHERE o.data BETWEEN TO_DATE('2017-10-12', 'YYYY-MM-DD') AND TO_DATE('2018-10-27', 'YYYY-MM-DD')
GROUP BY afp.fator_producao_id
ORDER BY COUNT(afp.operacao_id) DESC
    FETCH FIRST 1 ROW ONLY;



SELECT afp.fator_producao_id, COUNT(afp.operacao_id) AS num_aplicacoes
FROM Aplicacao_FP afp
         JOIN Operacao o ON afp.operacao_id = o.id
WHERE o.data BETWEEN TO_DATE('2020-03-12', 'YYYY-MM-DD') AND TO_DATE('2020-08-10', 'YYYY-MM-DD')
GROUP BY afp.fator_producao_id
ORDER BY COUNT(afp.operacao_id) DESC
    FETCH FIRST 1 ROW ONLY;