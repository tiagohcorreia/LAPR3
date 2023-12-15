CREATE OR REPLACE PROCEDURE registrarMonda(
    p_parcelaId  NUMBER ,
    p_variedadeId  NUMBER ,
    p_quantidade  float ,
    p_metodoExecucaoId  NUMBER ,
    p_fatorProducaoId  NUMBER ,
    p_data  DATE
)
    IS
    v_id Operacao_Agricola.id%TYPE;
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

    -- Insert into Operacao_Agricola table
    SELECT COALESCE(MAX(id), 0) + 1 INTO v_id FROM Operacao_Agricola;
    INSERT INTO Operacao_Agricola(id, data) VALUES (v_id, p_data);

    -- Insert into Monda table
    INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
    VALUES (v_id, p_parcelaId, p_variedadeId, p_quantidade, p_metodoExecucaoId, p_fatorProducaoId);

    DBMS_OUTPUT.put_line('Operação registrada com sucesso.');
EXCEPTION
    WHEN fator_producao_nao_existe THEN
        DBMS_OUTPUT.put_line('O fator de produção especificado não está registrada na base de dados');
END;

-- caso sucesso
-- Registar uma operação de monda no Campo novo, em 08/09/2023, na plantação de cenouras Danvers Half Long, 0.5 ha
declare
    p_parcelaId        NUMBER := 108;
    p_variedadeId      NUMBER := 75;
    p_quantidade       NUMBER := 0.5;
    p_metodoExecucaoId NUMBER := NULL;
    p_fatorProducaoId  NUMBER := NULL;
    p_data             DATE   := to_date('08-09-2023', 'dd-mm-yyyy');
begin
    registrarMonda(p_parcelaId, p_variedadeId, p_quantidade, p_metodoExecucaoId, p_fatorProducaoId, p_data);
end;


-- caso insucesso
-- Registar uma operação de monda no Campo novo, em 11/10/2023, na plantação de cenouras Danvers Half Long, 0.5 ha
declare
    p_parcelaId        NUMBER := 108;
    p_variedadeId      NUMBER := 75;
    p_quantidade       NUMBER := 0.5;
    p_metodoExecucaoId NUMBER := NULL;
    p_fatorProducaoId  NUMBER := NULL;
    p_data             DATE   := to_date('11-10-2023', 'dd-mm-yyyy');
begin
    registrarMonda(p_parcelaId, p_variedadeId, p_quantidade, p_metodoExecucaoId, p_fatorProducaoId, p_data);
end;


