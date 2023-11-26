-- Como Gestor Agrícola, quero registar uma operação de poda

CREATE OR REPLACE FUNCTION registrarPoda(parcelaId Parcela.id%TYPE, variedadeId Variedade.id%TYPE,
                                         data Operacao_Agricola.data%TYPE, quantidade Poda.quantidade%TYPE,
                                         metodoExecucaoId Metodo_Execucao.id%TYPE)
    RETURN NUMBER
    IS
    returnValue NUMBER := 0;
    id          Operacao_Agricola.id%TYPE := 0;
BEGIN
    SELECT MAX(id) into id FROM Operacao_Agricola;
    id := id + 1;

    IF (id IN (Operacao_Agricola.id) OR parcelaId NOT IN (Parcela.id) OR variedadeId NOT IN (Variedade.id)) THEN
        RETURN returnValue;
    END IF;

    if (variedadeId not in (select variedade.id
                            from parcela,
                                 plantacao,
                                 plantacao_permanente,
                                 plantacao_temporaria,
                                 variedade
                            where parcelaId = plantacao.parcela_id
                              and plantacao.id = plantacao_permanente.plantacao_id
                              and plantacao.id = plantacao_temporaria.plantacao_id
                              and plantacao_permanente.variedade_perm_id = variedade.id
                              and plantacao_temporaria.variedade_temp_id = variedade.id)) then
        return returnValue;
    end if;

    SAVEPOINT sp1;

    INSERT INTO Operacao_Agricola(id, data)
    VALUES (id, data);
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId);

    if (id in (operacao_agricola.id)
        and id in (poda.operacao_id)) then
        commit;
        returnValue := 1;
        return returnValue;
    else
        rollback to sp1;
        return returnValue;
    end if;

END;