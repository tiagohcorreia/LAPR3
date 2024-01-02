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

create or replace function check_if_product_exists(product_id produto.id%type)
    return number
    is
    other_product_id produto.id%type;
    cursor c1 is select id
                 from produto;
begin
    open c1;
    loop
        fetch c1 into other_product_id;
        if other_product_id = product_id then
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

create or replace function check_if_sector_exists(sector_id SETOR_REGA.id%type)
    return number
    is
    other_id SETOR_REGA.id%type;
    cursor c is select id
                from SETOR_REGA;
begin
    open c;
    loop
        fetch c into other_id;
        if other_id = sector_id then
            close c;
            return 1;
        end if;
        exit when c%notfound;
    end loop;
    close c;
    return 0;
end;


create or replace function check_if_mix_exists(mix_id RECEITA_FERTIRREGA.id%type)
    return number
    is
    other_id RECEITA_FERTIRREGA.id%type;
    cursor c is select id
                from RECEITA_FERTIRREGA;
begin
    open c;
    loop
        fetch c into other_id;
        if other_id = mix_id then
            close c;
            return 1;
        end if;
        exit when c%notfound;
    end loop;
    close c;
    return 0;
end;


create or replace function get_parcels_and_varieties_in_sector(sector_id SETOR_REGA.id%type,
                                                               this_date operacao_agricola.data%type)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct parcela.id, variedade.id
        from SETOR_REGA,
             SETORREGA_PLANTACAO,
             PLANTACAO,
             PARCELA,
             PLANTACAO_TEMPORARIA,
             PLANTACAO_PERMANENTE,
             VARIEDADE
        where sector_id = SETORREGA_PLANTACAO.SETOR_ID
          and SETORREGA_PLANTACAO.PLANTACAO_ID = PLANTACAO.ID
          and PLANTACAO.PARCELA_ID = PARCELA.ID
          and ((PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
            and PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID)
            or (PLANTACAO.ID = PLANTACAO_TEMPORARIA.PLANTACAO_ID
                and PLANTACAO_TEMPORARIA.VARIEDADE_temp_ID = VARIEDADE.ID))
          and ((this_date > SETORREGA_PLANTACAO.DATA_INICIO and SETORREGA_PLANTACAO.DATA_FIM is null)
            or (this_date between SETORREGA_PLANTACAO.DATA_INICIO and SETORREGA_PLANTACAO.DATA_FIM));
    return c;
end;

create or replace function get_fp_in_mix(mix_id RECEITA_FERTIRREGA.id%type)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct FATOR_PRODUCAO.id
        from RECEITA_FERTIRREGA,
             RECEITA_FP,
             FATOR_PRODUCAO
        where mix_id = RECEITA_FP.RECEITA_ID
          and RECEITA_FP.FP_ID = FATOR_PRODUCAO.ID;
    return c;
end;

-- verifica se um id de operação foi registado na tabela aplicação de fp
create or replace function is_in_table_aplicacao_fp(id OPERACAO_AGRICOLA.id%type)
    return number
    is
    other_Id OPERACAO_AGRICOLA.id%type;
    cursor c1 is select operacao_id
                 from APLICACAO_FP;
begin
    open c1;
    loop
        fetch c1 into other_Id;
        if (id = other_Id) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

-- verifica se um id de operação foi registado na tabela aplicacao_fp_variedade
create or replace function is_in_table_aplicacao_fp_variedade(id OPERACAO_AGRICOLA.id%type)
    return number
    is
    other_Id OPERACAO_AGRICOLA.id%type;
    cursor c1 is select operacao_id
                 from APLICACAO_FP_VARIEDADE;
begin
    open c1;
    loop
        fetch c1 into other_Id;
        if (id = other_Id) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

-- verifica se um fator de produçao foi registado na tabela fp_aplicados
create or replace function is_in_table_fp_aplicados(this_operation_id OPERACAO_AGRICOLA.id%type,
                                                    this_fp_id FATOR_PRODUCAO.id%type)
    return number
    is
    other_operation_id OPERACAO_AGRICOLA.id%type;
    other_fp_id        FATOR_PRODUCAO.id%type;
    cursor c1 is select operacao_id, fp_id
                 from FP_APLICADOS;
begin
    open c1;
    loop
        fetch c1 into other_operation_id, other_fp_id;
        if (this_operation_id = other_operation_id and
            this_fp_id = other_fp_id) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;


-- verifica se um fator de produçao foi registado na tabela Parcelas_Variedades_Aplicadas
create or replace function is_in_table_Parcelas_Variedades_Aplicadas(this_operation_id OPERACAO_AGRICOLA.id%type,
                                                                     this_parcel_id parcela.id%type,
                                                                     this_variety_id VARIEDADE.id%type)
    return number
    is
    other_operation_id OPERACAO_AGRICOLA.id%type;
    other_parcel_id    parcela.id%type;
    other_variety_id   VARIEDADE.id%type;
    cursor c1 is select operacao_id, PARCELA_ID, VARIEDADE_ID
                 from Parcelas_Variedades_Aplicadas;
begin
    open c1;
    loop
        fetch c1 into other_operation_id, other_parcel_id, other_variety_id;
        if (this_operation_id = other_operation_id and
            this_parcel_id = other_parcel_id and
            this_variety_id = other_variety_id) then
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;


