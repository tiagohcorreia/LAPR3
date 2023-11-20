CREATE OR REPLACE PROCEDURE registarSementeira(parcelaId Parcela.id TYPE NOT NULL, variedadeId Vaviedade, variedadeTempId Variedade_Temporaria
       quantidade Sementeira.quantidade% TYPE NOT NULL, area Sementeira.area% TYPE NOT NULL,
       metodo_execucao_id Metodo_Execucao.id)

    IS
        id Operacao_Agricola.id% TYPE := (SELECT MAX(id) FROM Operacao_Agricola)
        id_operacao_existe EXCEPTION;
        parcela_nao_existe EXCEPTION;
        metodo_nao_existe EXCEPTION;
        variedade_nao_existe EXCEPTION;
BEGIN

    id := id + 1

    IF (id IN Operacao_Agricola.id) THEN RAISE id_operacao_existe

    ELSIF (parcelaId NOT IN Parcela.id) THEN RAISE parcela_nao_existe

    ELSIF (metodoExecucaoId NOT IN Metodo_Execucao.id) THEN RAISE metodo_nao_existe

    ELSIF (variedadeId NOT IN Variedade.id) THEN RAISE variedade_nao_existe
    END IF;

    INSERT INTO Operacao_Agricola(id) VALUES (id)
    INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id) VALUES (id, parcelaID, variedadeId, quantidade, area, metodoExecucaoId);

EXCEPTION

    WHEN id_operacao_nao_existe THEN DBSM_OUTPUT.put_line('Não foi possível registar a sementeira.');
    WHEN parcela_nao_existe THEN DBSM_OUTPUT.put_line('Parcela especificada não existe na base de dados.');
    WHEN veriedade_nao_existe THEN DBSM_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
    WHEN metodo_nao_existe THEN DBSM_OUTPUT.put_line('Método de execução especificado não existe na base de dados.');
END;