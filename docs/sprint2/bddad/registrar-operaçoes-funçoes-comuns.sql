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

create or replace function check_if_quantity_is_bigger(parcel_id parcela.id%type,
                                                       variety_id variedade.id%type,
                                                       quantity float)
    return number
    is
    other_quantity  float;
    type_of_variety number := 0; -- 0 for permanent and 1 for temporary
    cursor c is select variedade_permanente.variedade_id
                from VARIEDADE_PERMANENTE
                where variety_id = variedade_permanente.VARIEDADE_ID;
begin

    OPEN C;
    if (c%notfound) then
        type_of_variety := 1;
    end if;

    CLOSE C;

    if (type_of_variety = 0) then
        select sum(distinct PLANTACAO_PERMANENTE.quantidade)
        into other_quantity
        from parcela,
             plantacao,
             PLANTACAO_PERMANENTE,
             VARIEDADE
        WHERE PLANTACAO.PARCELA_ID = parcel_id
          AND PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
          AND PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIETY_ID;
    ELSE
        select sum(distinct PLANTACAO_TEMPORARIA.AREA)
        into other_quantity
        from parcela,
             plantacao,
             PLANTACAO_TEMPORARIA,
             VARIEDADE
        WHERE PLANTACAO.PARCELA_ID = parcel_id
          AND PLANTACAO.ID = PLANTACAO_TEMPORARIA.PLANTACAO_ID
          AND PLANTACAO_TEMPORARIA.VARIEDADE_TEMP_ID = VARIETY_ID;
    end if;

    IF (quantity > other_quantity) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    end if;
end;

create or replace function check_if_area_is_greater_then_parcel(parcel_id parcela.id%type,
                                                                other_area parcela.area%type)
    return number
    is
    parcel_area parcela.area%type;
begin
    select area
    into parcel_area
    from parcela
    where parcela.id = parcel_id;

    if other_area > parcel_area then
        return 1;
    end if;

    return 0;
end;