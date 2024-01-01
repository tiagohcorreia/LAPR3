CREATE OR REPLACE FUNCTION verify_links_operations(p_operacao_id NUMBER)

RETURN NUMBER IS v_count NUMBER;

BEGIN

    --verifica se existem operações ligadas ao id especificado
    /*SELECT COUNT(*)
    INTO v_count
    FROM Operacao_Agricola
    WHERE id_dependente = p_operacao_id;*/

    IF v_count > 0 THEN
        -- retorna 1 caso encontre alguma operacao ligada
        RETURN 1;

    ELSE
        --retorna 0 caso não encontre alguma operacao ligada
        RETURN 0;

    END IF;

END;
/


