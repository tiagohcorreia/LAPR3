--USBD11 - Como Gestor Agrícola, quero registar uma operaçao de semeadura

--Caso de sucesso
--Registar uma operação de semeadura na Horta Nova, em 20/09/2023, de Nabo greleiro Senhora Conceição, 0.3 ha, 0.9 kg de semente

--Caso de insucesso
--Registar uma operação de semeadura no Campo Novo, em 19/09/2023, de Nabo greleiro Senhora Conceição, 0.75 ha, 1.8 kg de semente

CREATE OR REPLACE PROCEDURE registarSementeira(
    parcelaId IN NUMBER := NULL,
    variedadeId IN NUMBER,
    variedadeTempId IN NUMBER := NULL,
    quantidade IN NUMBER := NULL,
    area IN NUMBER := NULL,
    metodo_execucao_id IN NUMBER
)
    IS
    id Operacao_Agricola.id% TYPE;
BEGIN
    -- Verificar se parcela_id existe
    SELECT COUNT(*)
    INTO id
    FROM Parcela
    WHERE id = parcelaId;

    IF id = 0 THEN
        -- Caso a Parcela não exista
        DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
        RETURN;
    END IF;

    -- Verificar se metodo de execução existe
    SELECT COUNT(*)
    INTO id
    FROM Metodo_Execucao
    WHERE id = metodo_execucao_id;

    IF id = 0 THEN
        -- Caso metodo de execução não existe
        DBMS_OUTPUT.put_line('Método de execução especificado não existe na base de dados.');
        RETURN;
    END IF;

    -- Verificar se variedade existe
    IF variedadeId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO id
        FROM Variedade
        WHERE id = variedadeId;

        IF id = 0 THEN
            -- Caso variedade não exista
            DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
            RETURN;
        END IF;
    END IF;

    -- Insert into Operacao_Agricola
    SELECT MAX(id) + 1 INTO id FROM Operacao_Agricola;
    INSERT INTO Operacao_Agricola(id, data) VALUES (id, SYSDATE);

    -- Insert into Sementeira
    INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, area, metodo_execucao_id);

    DBMS_OUTPUT.put_line('Sementeira registrada com sucesso.');
END;


