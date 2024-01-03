CREATE OR REPLACE FUNCTION obterOperacoesPorParcela(
    p_parcela_id NUMBER,
    p_data_inicio DATE,
    p_data_fim DATE
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
           WHEN inc.operacao_id IS NOT NULL THEN 'Incorporacao_Solo'
           WHEN mon.operacao_id IS NOT NULL THEN 'Monda'
           WHEN op_plant.operacao_id IS NOT NULL THEN 'Op_Plantacao'
           WHEN pod.operacao_id IS NOT NULL THEN 'Poda'
           WHEN rega.operacao_id IS NOT NULL THEN 'Rega'
           WHEN sem.operacao_id IS NOT NULL THEN 'Sementeira'
           ELSE 'Outra Operacao'
           END AS tipo_operacao

FROM Operacao_Agricola oa

         LEFT JOIN Aplicacao_FP afp ON oa.id = afp.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Colheita col ON oa.id = col.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Incorporacao_Solo inc ON oa.id = inc.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Monda mon ON oa.id = mon.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Op_Plantacao op_plant
                   ON oa.id = op_plant.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Poda pod ON oa.id = pod.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Rega rega ON oa.id = rega.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
         LEFT JOIN Sementeira sem ON oa.id = sem.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim

WHERE oa.data BETWEEN p_data_inicio AND p_data_fim AND sem.parcela_id = p_parcela_id;

RETURN v_cursor;
END;
/

-----------------------------------------------------------------------------------------------------------------------

--Parcela = Campo Novo
--Intervalo = entre 01/07/2023 e 02/10/2023
--Resultado:
--Terão de ser apresentadas as operações correspondentes às apresentadas abaixo.
--Não será necessário apresentar todos os dados da operação, mas apenas: Data e cultura (se aplicável).
--Parcela e tipo estão implícitos, mas também podem ser incluídos.

DECLARE
    v_cursor SYS_REFCURSOR;
    v_operacao_id NUMBER;
    v_data DATE;
    v_tipo_operacao VARCHAR2(50);
BEGIN
    v_cursor := obterOperacoesPorParcela(p_parcela_id => 108, p_data_inicio => TO_DATE('2023-07-01','YYYY-MM-DD'), p_data_fim => TO_DATE('2023-10-02','YYYY-MM-DD'));

    LOOP
        FETCH v_cursor INTO v_operacao_id, v_data, v_tipo_operacao;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Operacao_id: ' || v_operacao_id || ', Data: ' || v_data || ', Tipo_Operacao: ' || v_tipo_operacao);
    END LOOP;

    CLOSE v_cursor;
END;
/

------------------------------------------------------------------------------------------------------------------------