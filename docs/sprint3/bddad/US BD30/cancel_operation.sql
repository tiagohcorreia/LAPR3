CREATE OR REPLACE FUNCTION cancel_operation(p_operacao_id NUMBER)
    RETURN NUMBER IS
    returnValue     NUMBER := 0;
    v_data_prevista DATE;
    v_data_atual    DATE;

BEGIN
    -------------------------------------------------------------------------------------------------------------------

    --Verificar se operação pode ser anulada

    SELECT data
    INTO v_data_prevista
    FROM OPERACAO_AGRICOLA
    WHERE id = p_operacao_id;

    v_data_atual := SYSDATE;

    IF v_data_atual > v_data_prevista + 3 THEN
        --ja se passaram mais de 3 dias desde a data prevista
        DBMS_OUTPUT.put_line('Já se passaram mais de 3 dias desde a data prevista. Não é possível anular a operação');
        RETURN returnValue; -- falha na anulação da operação
    END IF;

    -------------------------------------------------------------------------------------------------------------------

    -- Verificar operações dependentes

    --IF EXISTS(SELECT 1 FROM OPERACAO_AGRICOLA WHERE id_dependente = p_operacao_id) THEN
    --existem operações dependentes
    --DBMS_OUTPUT.put_line('Não é possível anular a operação. Existem operações dependentes');
    --RETURN returnValue; -- falha na anulação da operação
    --end if;

    -------------------------------------------------------------------------------------------------------------------

    -- Anula a operação

    UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = p_operacao_id;

    COMMIT;
    RETURN 1;
    -- Operação Anulada com sucesso

    -------------------------------------------------------------------------------------------------------------------

END;
/


