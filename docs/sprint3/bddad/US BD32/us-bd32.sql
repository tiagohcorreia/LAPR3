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

    if CHECKIFOPERATIONIDEXISTS(operation_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID inválido (já existe na tabela)');
        return 0;
    end if;

    if CHECK_IF_SECTOR_EXISTS(sector_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de setor inválido (não existe na tabela)');
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
                                                mix RECEITA_FERTIRREGA.id%type)
    return number
    is
    operation_id OPERACAO_AGRICOLA.id%type;
begin
    select max(id)
    into operation_id
    from OPERACAO_AGRICOLA;

    operation_id := operation_id + 1;

    if CHECKIFOPERATIONIDEXISTS(operation_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID inválido (já existe na tabela)');
        return 0;
    end if;

    if CHECK_IF_SECTOR_EXISTS(sector_id) = 0 then
        dbms_output.PUT_LINE('ERR0: ID de setor inválido (não existe na tabela)');
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