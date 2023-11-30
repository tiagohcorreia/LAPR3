-- Como Gestor Agrícola, quero registar uma operação de poda

create or replace function checkIfOperationIdExists(id operacao_agricola.id%type)
    return number
    is
    returnValue number := 0;
    otherId     operacao_agricola.id%type;
    cursor c1 is select id
                 from operacao_agricola;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return returnValue;
end;

create or replace function checkIfParcelExists(id parcela.id%type)
    return number
    is
    returnValue number := 0;
    otherId     parcela.id%type;
    cursor c1 is select id
                 from parcela;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return returnValue;
end;

create or replace function checkIfVarietyExists(id variedade.id%type)
    return number
    is
    returnValue number := 0;
    otherId     variedade.id%type;
    cursor c1 is select id
                 from variedade;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return returnValue;
end;

/*create or replace function checkIfExecutionMethodExists(id Metodo_Execucao.id%type)
    return number
    is
    returnValue number := 0;
    otherId     Metodo_Execucao.id%type;
    cursor c1 is select id
                 from Metodo_Execucao;
begin
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1;
        end if;
        exit when c1%notfound;
    end loop;
    return returnValue;
end;*/

create or replace function checkIfVarietyIsInParcel(parcelaId Parcela.id%TYPE, variedadeId Variedade.id%TYPE)
    return number
    is
    returnValue    number := 0;
    otherVarietyId Variedade.id%TYPE;
    cursor c is select variedade.id
                from parcela,
                     plantacao,
                     plantacao_permanente,
                     plantacao_temporaria,
                     variedade
                where parcelaId = plantacao.parcela_id
                  and plantacao.id = plantacao_permanente.plantacao_id
                  and plantacao.id = plantacao_temporaria.plantacao_id
                  and plantacao_permanente.variedade_perm_id = variedade.id
                  and plantacao_temporaria.variedade_temp_id = variedade.id;
begin
    open c;
    loop
        fetch c into otherVarietyId;
        if (otherVarietyId = variedadeId) then
            returnValue := 1;
        end if;
        exit when c%notfound or returnValue = 1;
    end loop;
    close c;
    return returnValue;
end;

create or replace function checkIfPodaIsRegistered(id poda.operacao_id%type)
    return number
    is
    returnValue number := 0;
    otherId     poda.operacao_id%type;
    cursor c1 is select operacao_id
                 from poda;
begin
    open c1;
    loop
        fetch c1 into otherId;
        if (id = otherId) then
            returnValue := 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return returnValue;
end;

CREATE OR REPLACE FUNCTION registrarPoda(parcelaId Parcela.id%TYPE, variedadeId Variedade.id%TYPE,
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

declare
    operationSuccess number;
begin
    operationSuccess := registrarPoda(104, 48, to_date('28-11-2023', 'dd-mm-yyyy'), 10, null);
    if (operationSuccess = 1) then
        DBMS_OUTPUT.put_line('Registo efetuado com sucesso. Return value: ' || operationSuccess);
    else
        DBMS_OUTPUT.put_line('Não foi possível registrar a operação. Return value: ' || operationSuccess);
    end if;
end;