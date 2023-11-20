-- Como Gestor Agrícola, quero registar uma operação de poda

CREATE OR REPLACE PROCEDURE registrarPoda(parcelaId Parcela.id%TYPE NOT NULL, variedadeId Variedade.id%TYPE NOT NULL,
                                          data Operacao_Agricola.data%TYPE, quantidade Poda.quantidade%TYPE NOT NULL,
                                          metodoExecucaoId Metodo_Execucao.id%TYPE)
    IS
    id Operacao_Agricola.id%TYPE := (SELECT MAX(id)
                                     FROM Operacao_Agricola);
    id_operacao_existe EXCEPTION;
    parcela_nao_existe EXCEPTION;
    variedade_nao_existe EXCEPTION;
    data_invalida EXCEPTION;
BEGIN
    id := id + 1;

    IF (id IN Operacao_Agricola.id) THEN
        RAISE id_operacao_existe;
    END IF;
    IF (parcelaId NOT IN Parcela.id) THEN
        RAISE parcela_nao_existe;
    END IF;
    IF (variedadeId NOT IN Variedade.id) THEN
        RAISE variedade_nao_existe;
    END IF;
    IF (data > TRUNC(SYSDATE)) THEN
        RAISE data_invalida;
    END IF;

    INSERT INTO Operacao_Agricola(id, data)
    VALUES (id, data);
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId);

EXCEPTION
    WHEN id_operacao_existe
        THEN DBSM_OUTPUT.put_line('Não foi possível registrar a operação.');
    WHEN parcela_nao_existe
        THEN DBSM_OUTPUT.put_line('A parcela especificada não está registada na base de dados');
    WHEN variedade_nao_existe
        THEN DBSM_OUTPUT.put_line('A variedade especificada não está registada na base de dados');
    WHEN data_invalida
        THEN DBSM_OUTPUT.put_line('A data especificada não é válida');
END;