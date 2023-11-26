CREATE OR REPLACE PROCEDURE registrarAplicacaoFatorProducao(
    p_parcelaId IN NUMBER := NULL,
    p_variedadeId IN NUMBER := NULL,
    p_quantidade IN NUMBER := NULL,
    p_metodoAplicacaoId IN NUMBER := NULL,
    p_area IN NUMBER := NULL,
    p_fatorProducaoId IN NUMBER := NULL,
    p_data IN DATE := NULL
)
    IS
    p_operacaoId Operacao_Agricola.id%TYPE;
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
    fator_producao_nao_existe EXCEPTION;
BEGIN
    -- Verificar se parcela_id existe
    IF p_parcelaId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO p_operacaoId
        FROM Parcela
        WHERE id = p_parcelaId;

        IF p_operacaoId = 0 THEN
            -- Caso a Parcela não exista
            DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se variedade existe
    IF p_variedadeId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO p_operacaoId
        FROM Variedade
        WHERE id = p_variedadeId;

        IF p_operacaoId = 0 THEN
            -- Caso variedade não exista
            DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se o ID do fator de produção existe na tabela Fator_Producao
    IF p_fatorProducaoId IS NOT NULL THEN
        BEGIN
            SELECT 1 INTO p_operacaoId FROM Fator_Producao WHERE id = p_fatorProducaoId;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE fator_producao_nao_existe;
        END;
    END IF;

    -- Inserir na tabela Operacao_Agricola
    SELECT COALESCE(MAX(id), 0) + 1 INTO p_operacaoId FROM Operacao_Agricola;
    INSERT INTO Operacao_Agricola(id, data) VALUES (p_operacaoId, p_data);

    -- Inserir na tabela Aplicacao_FP
    INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade, area)
    VALUES (p_operacaoId, p_parcelaId, p_variedadeId, p_fatorProducaoId, p_metodoAplicacaoId, p_quantidade, p_area);

    DBMS_OUTPUT.put_line('Operação de aplicação de fator de produção registrada com sucesso.');
EXCEPTION
    WHEN fator_producao_nao_existe THEN
        DBMS_OUTPUT.put_line('O fator de produção especificado não está registrado na base de dados');
END;