create or replace function register_watering(sector_id SETOR_REGA.id%type,
                                             operation_date OPERACAO_AGRICOLA.data%type,
                                             duration REGA.duracao%type,
                                             hour rega.hora%type)
    return number
    is
    operation_id OPERACAO_AGRICOLA.id%type;
begin
    select max(id)
    into operation_id
    from OPERACAO_AGRICOLA;

    operation_id := operation_id + 1;

    if CHECKIFOPERATIONIDEXISTS(operation_id) = 1 then
        dbms_output.PUT_LINE('ERR0: ID inválido (já existe na tabela)');
        return 0;
    end if;

    if CHECK_IF_SECTOR_EXISTS(sector_id, operation_date) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de setor ou data inválido');
        return 0;
    end if;

    savepoint sp;

    insert into OPERACAO_AGRICOLA(id, data, validade) values (operation_id, operation_date, 1);

    INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (operation_id, sector_id, duration, hour);


    if CHECKIFOPERATIONIDEXISTS(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        return 0;
    end if;

    if CHECK_IF_WATERING_IS_REGISTERED(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela REGA');
        return 0;
    end if;

    commit;
    return 1;
end;

create or replace function register_fertigation(sector_id SETOR_REGA.id%type,
                                                operation_date OPERACAO_AGRICOLA.data%type,
                                                duration REGA.duracao%type,
                                                hour rega.hora%type,
                                                mix_id RECEITA_FERTIRREGA.id%type)
    return number
    is
    operation_id          OPERACAO_AGRICOLA.id%type;
    parcels_and_varieties sys_refcursor            := GET_PARCELS_AND_VARIETIES_IN_SECTOR(sector_id,
                                                                                          operation_date);
    other_parcel_id       parcela.id%type;
    other_variety_id      variedade.id%type;
    fp_from_mix           sys_refcursor            := GET_FP_IN_MIX(mix_id);
    other_fp_id           FATOR_PRODUCAO.id%type;
    application_method_id METODO_APLICACAO.id%type := 4;
begin
    select max(id)
    into operation_id
    from OPERACAO_AGRICOLA;

    operation_id := operation_id + 1;

    if CHECKIFOPERATIONIDEXISTS(operation_id) = 1 then
        dbms_output.PUT_LINE('ERR0: ID inválido (já existe na tabela)');
        return 0;
    end if;

    if CHECK_IF_SECTOR_EXISTS(sector_id, operation_date) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de setor ou data inválido');
        return 0;
    end if;

    if CHECK_IF_MIX_EXISTS(mix_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de receita inválida (não existe na tabela)');
        return 0;
    end if;

    savepoint sp;

    insert into OPERACAO_AGRICOLA(id, data, validade)
    values (operation_id, operation_date, 1);

    if CHECKIFOPERATIONIDEXISTS(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        return 0;
    end if;

    INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
    VALUES (operation_id, sector_id, duration, hour);

    if CHECK_IF_WATERING_IS_REGISTERED(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela REGA');
        return 0;
    end if;

    INSERT INTO Aplicacao_FP(Operacao_id)
    VALUES (operation_id);

    if IS_IN_TABLE_APLICACAO_FP(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP');
        return 0;
    end if;


    INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
    VALUES (operation_id, application_method_id);

    if IS_IN_TABLE_APLICACAO_FP_VARIEDADE(operation_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP_VARIEDADE');
        return 0;
    end if;


    loop
        fetch fp_from_mix into other_fp_id;

        INSERT INTO FP_APLICADOS(Operacao_id, fp_id, quantidade, unidade)
        VALUES (operation_id, other_fp_id, null, null);

        if IS_IN_TABLE_FP_APLICADOS(operation_id, other_fp_id) = 0 then
            rollback to sp;
            DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela FP_APLICADOS');
            return 0;
        end if;

        exit when fp_from_mix%notfound;
    end loop;

    loop
        fetch parcels_and_varieties into other_parcel_id, other_variety_id;

        INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
        VALUES (operation_id, other_parcel_id, other_variety_id);

        if IS_IN_TABLE_PARCELAS_VARIEDADES_APLICADAS(operation_id, other_parcel_id, other_variety_id) = 0 then
            rollback to sp;
            DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela PARCELAS_VARIEDADES_APLICADAS');
            return 0;
        end if;

        exit when parcels_and_varieties%notfound;
    end loop;

    commit;
    return 1;
end;


create or replace function check_if_watering_is_registered(id rega.operacao_id%type)
    return number
    is
    otherId rega.operacao_id%type;
    cursor c1 is select operacao_id
                 from REGA;
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



declare
    sector_id      SETOR_REGA.id%type          := 10;
    operation_date OPERACAO_AGRICOLA.data%type := to_date('01-06-2017', 'dd-mm-yyyy');
    duration       REGA.duracao%type           := 60;
    hour           rega.hora%type              := '08:00';
    mix_id         RECEITA_FERTIRREGA.id%type  := 1;
    out            number;
begin
    out := register_fertigation(sector_id, operation_date, duration, hour, mix_id);
    if out = 1 then
        dbms_output.PUT_LINE('SUCESSO. OUT = ' || out);
    else
        dbms_output.PUT_LINE('INSUCESSO. OUT = ' || out);
    end if;
end;