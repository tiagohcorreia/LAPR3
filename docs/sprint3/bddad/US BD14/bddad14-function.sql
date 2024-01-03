--  USBD14 - Como Gestor Agrícola, quero registar uma operação de aplicação de
--  fator de produção

create or replace function verificarSeAplicacaoFpExiste(id aplicacao_fp.operacao_id%type)
    return number
    is
    returnValue number := 0;
    otherId     aplicacao_fp.operacao_id%type;
    cursor c1 is select operacao_id
                 from aplicacao_fp;
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

CREATE OR REPLACE function registrar_Aplicacao_FP_solo(
    this_parcela_id number,
    this_quantidade FP_APLICADOS.quantidade%TYPE,
    this_unidade FP_APLICADOS.unidade%TYPE,
    this_area APLICACAO_FP_SOLO.area%TYPE,
    this_fp_id FATOR_PRODUCAO.id%type,
    this_data OPERACAO_AGRICOLA.data%type)
    return number
    IS
    this_operacao_id Operacao_Agricola.id%TYPE;
BEGIN

    IF checkIfParcelExists(this_parcela_id) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Parcela não existe na base de dados');
        return 0;
    END IF;

    IF checkIfFpExists(this_fp_id) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Fator de produção não existe na base de dados');
        return 0;
    END IF;

    IF check_if_area_is_greater_then_parcel(this_parcela_id, this_area) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: A área indicada é maior que a área da parcela');
        return 0;
    END IF;

    savepoint sp;

    -- Inserir na tabela Operacao_Agricola
    SELECT MAX(id) + 1 INTO this_operacao_id FROM Operacao_Agricola;

    INSERT INTO Operacao_Agricola(id, data, validade)
    VALUES (this_operacao_id, this_data, 1);

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        return 0;
    end if;

    INSERT INTO Aplicacao_FP(Operacao_id)
    VALUES (this_operacao_id);

    if IS_IN_TABLE_APLICACAO_FP(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP');
        return 0;
    end if;


    INSERT INTO APLICACAO_FP_SOLO(operacao_id, parcela_id, area) VALUES (this_operacao_id, this_parcela_id, this_area);

    if IS_IN_TABLE_APLICACAO_FP_solo(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP_SOLO');
        return 0;
    end if;


    INSERT INTO FP_APLICADOS(Operacao_id, fp_id, quantidade, unidade)
    VALUES (this_operacao_id, this_fp_id, this_quantidade, this_unidade);

    if IS_IN_TABLE_FP_APLICADOS(this_operacao_id, this_fp_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela FP_APLICADOS');
        return 0;
    end if;

    commit;
    return 1;
END;


CREATE OR REPLACE function registrar_Aplicacao_FP_variedade(
    this_parcela_id number,
    this_variedade_id VARIEDADE.id%type,
    this_metodo_aplicacao_id METODO_APLICACAO.id%type,
    this_quantidade FP_APLICADOS.quantidade%TYPE,
    this_unidade FP_APLICADOS.unidade%TYPE,
    this_fp_id FATOR_PRODUCAO.id%type,
    this_data OPERACAO_AGRICOLA.data%type)
    return number
    IS
    this_operacao_id Operacao_Agricola.id%TYPE;
BEGIN

    IF checkIfParcelExists(this_parcela_id) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Parcela não existe na base de dados');
        return 0;
    END IF;

    IF checkIfFpExists(this_fp_id) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: Fator de produção não existe na base de dados');
        return 0;
    END IF;

    savepoint sp;

    -- Inserir na tabela Operacao_Agricola
    SELECT MAX(id) + 1 INTO this_operacao_id FROM Operacao_Agricola;

    INSERT INTO Operacao_Agricola(id, data, validade)
    VALUES (this_operacao_id, this_data, 1);

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        return 0;
    end if;

    INSERT INTO Aplicacao_FP(Operacao_id)
    VALUES (this_operacao_id);

    if IS_IN_TABLE_APLICACAO_FP(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP');
        return 0;
    end if;


    INSERT INTO APLICACAO_FP_VARIEDADE (OPERACAO_ID, METODO_APLICACAO_ID) VALUES (this_operacao_id, this_metodo_aplicacao_id);

    if IS_IN_TABLE_APLICACAO_FP_VARIEDADE(this_operacao_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela APLICACAO_FP_VARIEDADE');
        return 0;
    end if;


    INSERT INTO FP_APLICADOS(Operacao_id, fp_id, quantidade, unidade)
    VALUES (this_operacao_id, this_fp_id, this_quantidade, this_unidade);

    if IS_IN_TABLE_FP_APLICADOS(this_operacao_id, this_fp_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela FP_APLICADOS');
        return 0;
    end if;

    INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
    VALUES (this_operacao_id, this_parcela_id, this_variedade_id);

    if IS_IN_TABLE_PARCELAS_VARIEDADES_APLICADAS(this_operacao_id, this_parcela_id, this_variedade_id) = 0 then
        rollback to sp;
        DBMS_OUTPUT.PUT_LINE('Não foi possível fazer o registo na tabela PARCELAS_VARIEDADES_APLICADAS');
        return 0;
    end if;

    commit;
    return 1;
END;


-- caso de sucesso
declare
    parcelaId         number                       := 108;
    variedadeId       number                       := null;
    quantidade        aplicacao_fp.quantidade%TYPE := 4000;
    metodoAplicacaoId number                       := 7;
    area              aplicacao_fp.area%TYPE       := 1.1;
    fatorProducaoId   number                       := 12;
    data              date                         := to_date('2023-10-06', 'yyyy-mm-dd');
    result            number;
begin
    result := registrar_Aplicacao_FP(parcelaId, variedadeId, quantidade, metodoAplicacaoId, area,
                                     fatorProducaoId, data);
    if result = 1 then
        dbms_output.put_line('Aplicação de fator de produção registada com sucesso');
    else
        dbms_output.put_line('Aplicação de fator de produção não registada');
    end if;
end;


-- caso de insucesso
declare
    parcelaId         number                       := 108;
    variedadeId       number                       := null;
    quantidade        aplicacao_fp.quantidade%TYPE := 8000;
    metodoAplicacaoId number                       := 7;
    area              aplicacao_fp.area%TYPE       := 2.1;
    fatorProducaoId   number                       := 12;
    data              date                         := to_date('2023-10-08', 'yyyy-mm-dd');
    result            number;
begin
    result := registrar_Aplicacao_FP(parcelaId, variedadeId, quantidade, metodoAplicacaoId, area,
                                     fatorProducaoId, data);
    if result = 1 then
        dbms_output.put_line('Aplicação de fator de produção registada com sucesso');
    else
        dbms_output.put_line('Aplicação de fator de produção não registada');
    end if;
end;