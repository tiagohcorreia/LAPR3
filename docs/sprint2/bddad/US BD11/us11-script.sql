CREATE OR REPLACE PROCEDURE registarSementeira(
    parcelaId Parcela.id% TYPE := NULL,
    variedadeId Variedade.id% TYPE,
    variedadeTempId Variedade_Temporaria.id% TYPE,
    quantidade Sementeira.quantidade% TYPE NOT NULL,
    area Sementeira.area% TYPE NOT NULL,
    metodo_execucao_id Metodo_Execucao.id% TYPE
)
IS
    id Operacao_Agricola.id% TYPE := (SELECT MAX(id) + 1 FROM Operacao_Agricola);
BEGIN
    -- Verificar se parcela_id existe
    SELECT COUNT(*)
    INTO id
    FROM Parcela
    WHERE id = parcelaId;

IF
id = 0 THEN
        -- Caso a Parcela não exista
        DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
        RETURN -1;
        END IF;

        -- Verificar se metodo de execução existe
        SELECT COUNT(*)
        INTO id
        FROM Metodo_Execucao
        WHERE id = metodo_execucao_id;

IF
id = 0 THEN
        -- Caso metodo de execução não existe
        DBMS_OUTPUT.put_line('Método de execução especificado não existe na base de dados.');
        RETURN -1;
        END IF;

-- Verificar se variedade existe
IF
variedadeId IS NOT NULL THEN
        SELECT COUNT(*)
        INTO id
        FROM Variedade
        WHERE id = variedadeId;

IF
id = 0 THEN
            -- Caso variedade não exista
            DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
            RETURN -1;
            END IF;
            END IF;

-- Insert into Operacao_Agricola
INSERT INTO Operacao_Agricola(id) VALUES (id);

-- Insert into Sementeira
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (id, parcelaId, variedadeId, quantidade, area, metodo_execucao_id);

DBMS_OUTPUT.put_line('Sementeira registrada com sucesso.');
RETURN 1;
END;
