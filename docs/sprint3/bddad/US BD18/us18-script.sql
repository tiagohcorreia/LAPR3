--Parcela = Campo Novo
--Intervalo = entre 01/07/2023 e 02/10/2023
--Resultado:
--Terão de ser apresentadas as operações correspondentes às apresentadas abaixo.
--Não será necessário apresentar todos os dados da operação, mas apenas: Data e cultura (se aplicável).
--Parcela e tipo estão implícitos, mas também podem ser incluídos.

CREATE OR REPLACE FUNCTION obterOperacoesPorParcela(
    p_parcela_id IN NUMBER, --Substituir pelos valores pedidos
    p_data_inicio IN DATE,  --Substituir pelos valores pedidos
    p_data_fim IN DATE      --Substituir pelos valores pedidos
)
RETURN SYS_REFCURSOR
IS
    v_cursor SYS_REFCURSOR;
BEGIN
OPEN v_cursor FOR
SELECT oa.id   AS operacao_id,
       oa.data,
       CASE
           WHEN afp.operacao_id IS NOT NULL THEN 'Aplicacao_FP'
           WHEN col.operacao_id IS NOT NULL THEN 'Colheita'
           WHEN des.operacao_id IS NOT NULL THEN 'Desfolha'
           WHEN inc.operacao_id IS NOT NULL THEN 'Incorporacao_Solo'
           WHEN mon.operacao_id IS NOT NULL THEN 'Monda'
           WHEN op_plant.operacao_id IS NOT NULL THEN 'Op_Plantacao'
           WHEN pod.operacao_id IS NOT NULL THEN 'Poda'
           WHEN rega.operacao_id IS NOT NULL THEN 'Rega'
           WHEN sem.operacao_id IS NOT NULL THEN 'Sementeira'
           WHEN tut.operacao_id IS NOT NULL THEN 'Tutoramento'
           ELSE 'Outra Operacao'
           END AS tipo_operacao
FROM Operacao_Agricola oa
         LEFT JOIN Aplicacao_FP afp ON oa.id = afp.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Colheita col ON oa.id = col.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Desfolha des ON oa.id = des.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Incorporacao_Solo inc ON oa.id = inc.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Monda mon ON oa.id = mon.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Op_Plantacao op_plant
                   ON oa.id = op_plant.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Poda pod ON oa.id = pod.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Rega rega ON oa.id = rega.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Sementeira sem ON oa.id = sem.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Tutoramento tut ON oa.id = tut.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
WHERE oa.data BETWEEN p_data_inicio AND p_data_fim
  AND sem.parcela_id = p_parcela_id;

RETURN v_cursor;
END;
/
