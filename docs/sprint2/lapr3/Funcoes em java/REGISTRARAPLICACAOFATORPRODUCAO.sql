create PROCEDURE registrarAplicacaoFatorProducao(
    v_id Operacao_Agricola.id%TYPE,
    p_parcelaId IN NUMBER := NULL,
    p_variedadeId IN NUMBER := NULL,
    p_fatorProducaoId IN NUMBER := NULL,
    p_metodoAplicacaoId METODO_APLICACAO.id%TYPE := NULL,
    p_quantidade IN NUMBER := NULL,
    p_area IN NUMBER := NULL
)
    IS
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
    fator_producao_nao_existe EXCEPTION;


    v_parcela_id_exists NUMBER;
    v_variedade_id_exists NUMBER;
    fator_producao_id_exists NUMBER;

BEGIN
    -- Verificar se parcela_id existe
    IF p_parcelaId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_parcela_id_exists
        FROM Parcela
        WHERE id = p_parcelaId;

        IF v_parcela_id_exists = 0 THEN
            -- Caso a Parcela não exista
            DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se variedade existe
    IF p_variedadeId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO v_variedade_id_exists
        FROM Variedade
        WHERE id = p_variedadeId;

        IF v_variedade_id_exists = 0 THEN
            -- Caso variedade não exista
            DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Verificar se o ID do fator de produção existe na tabela Fator_Producao
    IF p_fatorProducaoId IS NOT NULL THEN
        BEGIN
            SELECT COUNT(*)
            INTO fator_producao_id_exists
            FROM Fator_Producao
            WHERE id = p_fatorProducaoId;

            IF fator_producao_id_exists = 0 THEN
                -- Caso fator de produção não exista
                RAISE fator_producao_nao_existe;
            END IF;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE fator_producao_nao_existe;
        END;
    END IF;
    -- Inserir na tabela Aplicacao_FP
    INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade, area)
    VALUES (v_id, p_parcelaId, p_variedadeId, p_fatorProducaoId, p_metodoAplicacaoId, p_quantidade, p_area);

    DBMS_OUTPUT.put_line('Operação de aplicação de fator de produção registrada com sucesso.');
EXCEPTION
    WHEN fator_producao_nao_existe THEN
        DBMS_OUTPUT.put_line('O fator de produção especificado não está registrado na base de dados');
END;
/

