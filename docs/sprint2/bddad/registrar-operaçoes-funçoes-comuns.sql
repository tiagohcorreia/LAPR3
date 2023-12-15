create or replace function checkIfOperationIdExists(id operacao_agricola.id%type)
    return number
    is
    otherId operacao_agricola.id%type;
    cursor c1 is select id
                 from operacao_agricola;
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

create or replace function checkIfParcelExists(id parcela.id%type)
    return number
    is
    otherId parcela.id%type;
    cursor c1 is select id
                 from parcela;
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

create or replace function checkIfVarietyExists(id variedade.id%type)
    return number
    is
    otherId variedade.id%type;
    cursor c1 is select id
                 from variedade;
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

create or replace function checkIfVarietyIsInParcel(parcelaId Parcela.id%TYPE, variedadeId Variedade.id%TYPE)
    return number
    is
    otherVarietyId Variedade.id%TYPE;
    cursor c is select distinct variedade.id
                from parcela,
                     plantacao,
                     plantacao_permanente,
                     plantacao_temporaria,
                     variedade
                where parcelaId = plantacao.parcela_id
                  and ((plantacao.id = plantacao_permanente.plantacao_id and
                        plantacao_permanente.variedade_perm_id = variedade.id)
                    or (plantacao.id = plantacao_temporaria.plantacao_id and
                        plantacao_temporaria.variedade_temp_id = variedade.id));
begin
    open c;
    loop
        fetch c into otherVarietyId;
        if (otherVarietyId = variedadeId) then
            close c;
            return 1;
        end if;
        exit when c%notfound;
    end loop;
    close c;
    return 0;
end;

create or replace function checkIfFpExists(id fator_producao.id%type)
    return number
    is
    otherId fator_producao.id%type;
    cursor c1 is select id
                 from fator_producao;
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

create or replace function checkIfMetodoExecucaoExists(id METODO_EXECUCAO.id%type)
    return number
    is
    otherId METODO_EXECUCAO.id%type;
    cursor c1 is select id
                 from METODO_EXECUCAO;
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