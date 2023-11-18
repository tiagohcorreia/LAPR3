-- Como Gestor Agrícola, quero registar uma operação de poda

CREATE OR REPLACE PROCEDURE registrarPoda(parcelaId Parcela.id%TYPE NOT NULL, variedadeId Variedade.id%TYPE NOT NULL,
                                          data Operacao_Agricola.data%TYPE, quantidade Poda.quantidade%TYPE NOT NULL,
                                          metodoExecucaoId Metodo_Execucao.id%TYPE)
    IS
    id Operacao_Agricola.id%TYPE := (SELECT MAX(id)
                                     FROM Operacao_Agricola);
    id_exists EXCEPTION;
BEGIN
    id := id + 1;
    IF (
        id IN (SELECT id FROM Operacao_Agricola)
        ) THEN
        RAISE id_exists;
    END IF;
    INSERT INTO Operacao_Agricola(id, data)
    VALUES (id, data);
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId);
EXCEPTION
    WHEN id_exists
        THEN DBSM_OUTPUT.put_line('Não foi possível registrar a operação.');
END;