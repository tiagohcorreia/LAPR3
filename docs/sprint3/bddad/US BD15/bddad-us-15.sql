-- Como Gestor Agrícola, quero registar uma operação de poda

create or replace function checkIfPodaIsRegistered(id poda.operacao_id%type)
    return number
    is
    otherId     poda.operacao_id%type;
    cursor c1 is select operacao_id
                 from poda;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

CREATE OR REPLACE FUNCTION registar_Poda(parcelaId Parcela.id%TYPE,
                                         variedadeId Variedade.id%TYPE,
                                         this_data Operacao_Agricola.data%TYPE,
                                         quantidade Poda.quantidade%TYPE,
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
        or checkIfVarietyExists(variedadeId) = 0
        or check_if_quantity_is_bigger(parcelaId, variedadeId, quantidade) = 1) THEN
        RETURN returnValue; -- returns 0 wich means operation insuccess
    END IF;

    if (checkIfVarietyIsInParcel(parcelaId, variedadeId) = 0) then
        return returnValue; -- returns 0 wich means operation insuccess
    end if;

    SAVEPOINT sp1;

    INSERT INTO Operacao_Agricola(id, data, validade)
    VALUES (id, this_data, 1);
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



-- caso de sucesso
declare
    operationSuccess number;
begin
    operationSuccess := registrarPoda(102, 92, to_date('06-11-2023', 'dd-mm-yyyy'), 20, null);
    if (operationSuccess = 1) then
        DBMS_OUTPUT.put_line('Registo efetuado com sucesso. Return value: ' || operationSuccess);
    else
        DBMS_OUTPUT.put_line('Não foi possível registrar a operação. Return value: ' || operationSuccess);
    end if;
end;


-- caso de insucesso
declare
    operationSuccess number;
begin
    operationSuccess := registrarPoda(102, 92, to_date('06-11-2023', 'dd-mm-yyyy'), 60, null);
    if (operationSuccess = 1) then
        DBMS_OUTPUT.put_line('Registo efetuado com sucesso. Return value: ' || operationSuccess);
    else
        DBMS_OUTPUT.put_line('Não foi possível registrar a operação. Return value: ' || operationSuccess);
    end if;
end;





SELECT DISTINCT PP.QUANTIDADE FROM plantacao PLT,PARCELA P,variedade V, plantacao_PERMANENTE PP
WHERE 102=PLT.PARCELA_ID AND
PP.VARIEDADE_PERM_ID=92 AND
PLT.ID=pp.plantacao_id ;
