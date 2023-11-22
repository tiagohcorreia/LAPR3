-- Como Gestor Agrícola, quero registar uma operação de poda

CREATE OR REPLACE FUNCTION registrarPoda(parcelaId Parcela.id%TYPE NOT NULL, variedadeId Variedade.id%TYPE NOT NULL,
                                         data Operacao_Agricola.data%TYPE, quantidade Poda.quantidade%TYPE NOT NULL,
                                         metodoExecucaoId Metodo_Execucao.id%TYPE)
    RETURN NUMBER
    IS
    returnValue NUMBER                    := 0;
    id          Operacao_Agricola.id%TYPE := (SELECT MAX(id)
                                              FROM Operacao_Agricola);
BEGIN
    id := id + 1;

    START TRANSACTION
    IF (id IN Operacao_Agricola.id OR parcelaId NOT IN Parcela.id OR variedadeId NOT IN Variedade.id) THEN
        ROLLBACK;
        RETURN returnValue;
    END IF;

    INSERT INTO Operacao_Agricola(id, data)
    VALUES (id, data);
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId);

    COMMIT;
    RETURN returnValue := 1;
END;