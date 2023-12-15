create FUNCTION registrarPoda(parcelaId Parcela.id%TYPE, variedadeId Variedade.id%TYPE,
                                         data Operacao_Agricola.data%TYPE, quantidade Poda.quantidade%TYPE,
                                         metodoExecucaoId Metodo_Execucao.id%TYPE)
    RETURN NUMBER
    IS
    returnValue NUMBER                    := 0;
    id          Operacao_Agricola.id%TYPE := 0;
BEGIN
    SELECT MAX(id) into id FROM Operacao_Agricola;
    id := id + 1;

    IF (checkIfOperationIdExists(id) = 1
        or checkIfParcelExists(parcelaId) = 0
        or checkIfVarietyExists(variedadeId) = 0) THEN
        RETURN returnValue; -- returns 0 wich means operation insuccess
    END IF;

    if (checkIfVarietyIsInParcel(parcelaId, variedadeId) = 0) then
        return returnValue; -- returns 0 wich means operation insuccess
    end if;

    SAVEPOINT sp1;

    INSERT INTO Operacao_Agricola(id, data)
    VALUES (id, data);
    INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade, metodoExecucaoId);

    if (checkIfOperationIdExists(id) = 1
        and checkIfPodaIsRegistered(id) = 1) then
        commit;
        returnValue := 1;
    else
        rollback to sp1;
    end if;
    return returnValue;
END;
/

