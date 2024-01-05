
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



create or replace function register_fertigation(v_setor_id SETOR_REGA.id%type,
                                                v_data_operacao OPERACAO_AGRICOLA.data%type,
                                                v_duration REGA.duracao%type,
                                                v_hora rega.hora%type,
                                                v_receita_id RECEITA_FERTIRREGA.id%type)
    return number
    is
    v_operacao_id           OPERACAO_AGRICOLA.id%type;
    parcelas_variedades     sys_refcursor            := GET_PARCELS_AND_VARIETIES_IN_SECTOR(v_setor_id,
                                                                                            v_data_operacao);
    fps_receita             sys_refcursor            := GET_FP_IN_MIX(v_receita_id);
    other_parcela_id        parcela.id%type;
    other_variedade_id      variedade.id%type;
    other_fp_id             FATOR_PRODUCAO.id%type;
    last_other_parcela_id   parcela.id%type          := -1;
    last_other_variedade_id variedade.id%type        := -1;
    last_other_fp_id        FATOR_PRODUCAO.id%type   := -1;
    v_metodo_aplicacao_id   METODO_APLICACAO.id%type := 4;
begin
    select max(id)
    into v_operacao_id
    from OPERACAO_AGRICOLA;

    v_operacao_id := v_operacao_id + 1;

    if CHECKIFOPERATIONIDEXISTS(v_operacao_id) = 1 then
        dbms_output.PUT_LINE('ERR0: ID inválido (já existe na tabela)');
        return 0;
    end if;

    if CHECK_IF_SECTOR_EXISTS(v_setor_id, v_data_operacao) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de setor ou data inválido');
        return 0;
    end if;

    if CHECK_IF_MIX_EXISTS(v_receita_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de receita inválida (não existe na tabela)');
        return 0;
    end if;

    savepoint sp;

    insert into OPERACAO_AGRICOLA(id, data, validade)
    values (v_operacao_id, v_data_operacao, 1);

    if CHECKIFOPERATIONIDEXISTS(v_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        return 0;
    end if;

    INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
    VALUES (v_operacao_id, v_setor_id, v_duration, v_hora);

    if CHECK_IF_WATERING_IS_REGISTERED(v_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela REGA');
        return 0;
    end if;

    INSERT INTO Aplicacao_FP(Operacao_id)
    VALUES (v_operacao_id);

    if IS_IN_TABLE_APLICACAO_FP(v_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP');
        return 0;
    end if;


    INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
    VALUES (v_operacao_id, v_metodo_aplicacao_id);

    if IS_IN_TABLE_APLICACAO_FP_VARIEDADE(v_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP_VARIEDADE');
        return 0;
    end if;

    loop
        fetch parcelas_variedades into other_parcela_id, other_variedade_id;

        if (not (last_other_parcela_id = other_parcela_id and last_other_variedade_id = other_variedade_id)) then
            INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
            VALUES (v_operacao_id, other_parcela_id, other_variedade_id);

            if IS_IN_TABLE_PARCELAS_VARIEDADES_APLICADAS(v_operacao_id, other_parcela_id, other_variedade_id) = 0 then
                rollback to sp;
                DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela PARCELAS_VARIEDADES_APLICADAS');
                return 0;
            end if;
        end if;

        last_other_parcela_id := other_parcela_id;
        last_other_variedade_id := other_variedade_id;

        exit when parcelas_variedades%notfound;
    end loop;

    loop
        fetch fps_receita into other_fp_id;

        if (not last_other_fp_id = other_fp_id) then
            INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
            VALUES (v_operacao_id, other_fp_id);

            if IS_IN_TABLE_FP_APLICADOS(v_operacao_id, other_fp_id) = 0 then
                rollback to sp;
                DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela FP_APLICADOS');
                return 0;
            end if;
        end if;

        last_other_fp_id := other_fp_id;
        exit when fps_receita%notfound;
    end loop;

    commit;
    return 1;
end;





