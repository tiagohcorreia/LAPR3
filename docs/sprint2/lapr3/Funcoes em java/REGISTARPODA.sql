create PROCEDURE registarPoda(
    p_operacaoId Operacao_Agricola.id%TYPE,
    p_parcelaId IN NUMBER := NULL,
    p_variedadeId IN NUMBER,
    p_quantidade IN NUMBER := NULL,
    p_metodo_execucao_id IN NUMBER
)
    IS
    v_parcela_id_exists NUMBER;
    v_variedade_id_exists NUMBER;
BEGIN
    -- Verificar se parcela_id existe
    IF p_parcelaId IS NOT NULL THEN
        SELECT COUNT(*) INTO v_parcela_id_exists FROM Parcela WHERE id = p_parcelaId;
        IF v_parcela_id_exists = 0 THEN
            -- Caso a Parcela não exista
            DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se metodo de execução existe
    SELECT COUNT(*) INTO v_variedade_id_exists FROM Variedade WHERE id = p_variedadeId;
    IF v_variedade_id_exists = 0 THEN
        -- Caso variedade não exista
        DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
        RETURN;
    END IF;

    -- Insert into Sementeira
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (p_operacaoId, p_parcelaId, p_variedadeId, p_quantidade, p_metodo_execucao_id);

    DBMS_OUTPUT.put_line('Poda registrada com sucesso.');
END;
/

