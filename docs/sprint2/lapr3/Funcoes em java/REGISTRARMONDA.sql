CREATE PROCEDURE registrarMonda(
    v_id Operacao_Agricola.id%TYPE,
    p_parcelaId IN NUMBER := NULL,
    p_variedadeId IN NUMBER := NULL,
    p_fatorProducaoId IN NUMBER := NULL,
    p_metodoExecucaoId IN NUMBER := NULL,
    p_quantidade IN NUMBER := NULL
)
    IS
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
    fator_producao_nao_existe EXCEPTION;
BEGIN
    -- Verificar se parcela_id existe
    IF p_parcelaId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_id
        FROM Parcela
        WHERE id = p_parcelaId;

        IF v_id = 0 THEN
            -- Caso a Parcela não exista
            DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se variedade existe
    IF p_variedadeId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_id
        FROM Variedade
        WHERE id = p_variedadeId;

        IF v_id = 0 THEN
            -- Caso variedade não exista
            DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Check if fatorProducaoId exists in Fator_Producao table
    IF p_fatorProducaoId IS NOT NULL THEN
        BEGIN
            SELECT 1 INTO v_id FROM Fator_Producao WHERE id = p_fatorProducaoId;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE fator_producao_nao_existe;
        END;
    END IF;

    -- Insert into Monda table
    INSERT INTO Monda(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_execucao_id, quantidade)
    VALUES (v_id, p_parcelaId, p_variedadeId, p_fatorProducaoId, p_metodoExecucaoId, p_quantidade);

    DBMS_OUTPUT.put_line('Operação registrada com sucesso.');
EXCEPTION
    WHEN fator_producao_nao_existe THEN
        DBMS_OUTPUT.put_line('O fator de produção especificado não está registrada na base de dados');
END;
/
