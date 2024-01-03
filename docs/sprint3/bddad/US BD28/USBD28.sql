-- USBD28 - Anular, não apagar Operação Agrícola

CREATE OR REPLACE FUNCTION anular_operacao(p_operacao_id NUMBER)
    RETURN NUMBER IS
    returnValue NUMBER := 0;
BEGIN
    -- Anular a operação
    UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = p_operacao_id;
    COMMIT;

    RETURN 1; -- Operação anulada com sucesso
END;
/
