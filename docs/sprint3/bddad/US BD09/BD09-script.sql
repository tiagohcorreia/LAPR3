SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 1
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');


SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 2
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 3
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 4
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 5
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 6
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 7
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 8
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 9
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 10
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');

SELECT COUNT(*) AS NumAplicacoes
FROM Operacao O
INNER JOIN Aplicacao_FP AF
ON O.id = AF.operacao_id
WHERE AF.fator_producao_id = 11
AND O.data >= TO_DATE('2023-01-01', 'YYYY-MM-DD')
AND O.data <= TO_DATE('2023-12-31', 'YYYY-MM-DD');