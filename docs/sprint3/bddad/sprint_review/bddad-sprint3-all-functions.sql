CREATE OR REPLACE FUNCTION funcFatores
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM FATOR_PRODUCAO
        ORDER BY id;
    RETURN v_cursor;
END funcFatores;


CREATE OR REPLACE FUNCTION fncMetodosExecucao
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM Metodo_Execucao
        ORDER BY id;
    RETURN v_cursor;
END fncMetodosExecucao;


CREATE OR REPLACE FUNCTION funcParcelas
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM Parcela
        ORDER BY id;
    RETURN v_cursor;
END funcParcelas;


CREATE OR REPLACE FUNCTION fncVariedades
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT * FROM Variedade ORDER BY id;
    RETURN v_cursor;
END fncVariedades;


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

create or replace function check_if_sector_exists(sector_id SETOR_REGA.id%type,
                                                  this_date date)
    return number
    is
    other_sector_id  SETOR_REGA.id%type;
    other_begin_date setor_rega.data_inicio%type;
    other_end_date   setor_rega.data_fim%type;
    cursor c is select id, DATA_INICIO, DATA_FIM
                from SETOR_REGA;
begin
    open c;
    loop
        fetch c into other_sector_id, other_begin_date, other_end_date;
        if (other_sector_id = sector_id and
            ((this_date between other_begin_date and other_end_date) or
             (this_date > other_begin_date and other_end_date is null))) then
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


-- verifica se um id de operação foi registado na tabela aplicacao_fp_solo
create or replace function is_in_table_aplicacao_fp_solo(id OPERACAO_AGRICOLA.id%type)
    return number
    is
    other_Id OPERACAO_AGRICOLA.id%type;
    cursor c1 is select operacao_id
                 from aplicacao_fp_solo;
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



create or replace function obter_produtos_colhidos(v_parcela_id PARCELA.id%type,
                                                   data_inferior date,
                                                   data_superior date)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct PRODUTO.nome, sum(COLHEITA.quantidade)
        from PRODUTO,
             COLHEITA,
             PARCELA,
             OPERACAO_AGRICOLA
        where v_parcela_id = COLHEITA.PARCELA_ID
          and PRODUTO.ID = COLHEITA.PRODUTO_ID
          and COLHEITA.OPERACAO_ID = OPERACAO_AGRICOLA.ID
          and OPERACAO_AGRICOLA.DATA between data_inferior and data_superior
        group by PRODUTO.nome
        order by produto.NOME;
    return c;
end;



create or replace function obter_quantidade_fp_por_tipo(v_parcela_id parcela.id%type,
                                                        data_inicio date,
                                                        data_fim date)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct TIPO_FP.TIPO, count(distinct FATOR_PRODUCAO.ID)
        from OPERACAO_AGRICOLA,
             APLICACAO_FP,
             APLICACAO_FP_VARIEDADE,
             APLICACAO_FP_SOLO,
             PARCELAS_VARIEDADES_APLICADAS,
             FP_APLICADOS,
             FATOR_PRODUCAO,
             TIPO_FP,
             PARCELA
        where OPERACAO_AGRICOLA.ID = APLICACAO_FP.OPERACAO_ID
          and APLICACAO_FP.OPERACAO_ID = FP_APLICADOS.OPERACAO_ID
          and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.ID
          and FATOR_PRODUCAO.TIPO_ID = TIPO_FP.ID
          and ((APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_SOLO.OPERACAO_ID
            and APLICACAO_FP_SOLO.PARCELA_ID = PARCELA.ID) or
               (APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_VARIEDADE.OPERACAO_ID
                   and APLICACAO_FP_VARIEDADE.OPERACAO_ID = PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID
                   and PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID = PARCELA.ID))
          and PARCELA.ID = v_parcela_id
          and OPERACAO_AGRICOLA.DATA between data_inicio and data_fim
        group by TIPO_FP.TIPO;
    return c;
end;



create or replace function obter_aplicacoes_fp_por_tipo(data_inicio date,
                                                        data_fim date)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select tipo_fp.tipo, count(distinct APLICACAO_FP.OPERACAO_ID)
        from OPERACAO_AGRICOLA,
             APLICACAO_FP,
             FP_APLICADOS,
             FATOR_PRODUCAO,
             TIPO_FP
        where APLICACAO_FP.OPERACAO_ID = FP_APLICADOS.OPERACAO_ID
          and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.ID
          and FATOR_PRODUCAO.TIPO_ID = TIPO_FP.ID
          and APLICACAO_FP.OPERACAO_ID = OPERACAO_AGRICOLA.ID
          and OPERACAO_AGRICOLA.DATA between data_inicio and data_fim
        group by tipo_fp.tipo
        order by tipo_fp.TIPO;
    return c;
end;



CREATE OR REPLACE FUNCTION checkIfSementeiraExists(id sementeira.operacao_id%TYPE)
    RETURN NUMBER
    IS
    otherId sementeira.operacao_id%TYPE;
    CURSOR c1 IS SELECT operacao_id
                 FROM SEMENTEIRA;
BEGIN
    OPEN c1;

    loop
        fetch c1 INTO otherID;
        IF (id = otherId) THEN
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

CREATE OR REPLACE FUNCTION registar_Sementeira(
    v_parcela_id Parcela.id%TYPE,
    v_variedade_id Variedade.id%TYPE,
    v_data Operacao_Agricola.data%TYPE,
    v_quantidade Sementeira.quantidade%TYPE,
    v_area Sementeira.area%TYPE,
    v_metodo_execucao_id Metodo_Execucao.id%TYPE
)
    RETURN NUMBER
    IS
    returnValue NUMBER                     := 0;
    v_id        Operacao_Agricola.id% TYPE := 0;

BEGIN

    SELECT MAX(v_id) + 1 INTO v_id FROM Operacao_Agricola;

    -----------------------------------------------------------------------------------------------------------------------

    -- Verificar se parcela existe
    IF CHECKIFPARCELEXISTS(v_parcela_id) = 0 THEN
        DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados');
        RETURN returnValue;
    END IF;

    -- Verificar se variedade existe
    IF CHECKIFVARIETYEXISTS(v_variedade_id) = 0 THEN
        DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
        RETURN returnValue;
    END IF;

    -- Verificar se Variedade esta dentro de parcela
    IF CHECKIFVARIETYISINPARCEL(v_parcela_id, v_variedade_id) = 0 THEN
        DBMS_OUTPUT.put_line('Variedade não existe na parcela especificada.');
        return returnValue; -- 0 Não Sucesso
    END IF;

    -- Verificar se area maior que area da parcela
    IF CHECK_IF_AREA_IS_GREATER_THEN_PARCEL(v_parcela_id, v_area) = 1 THEN
        DBMS_OUTPUT.put_line('Area especificada maior que area da parcela.');
        RETURN returnValue;
    end if;

    --Verificar se quantidade maior
    IF CHECK_IF_QUANTITY_IS_BIGGER(v_parcela_id, v_variedade_id, v_quantidade) = 1 THEN
        DBMS_OUTPUT.put_line('Quantidade inválida');
        RETURN returnValue;
    end if;

    -----------------------------------------------------------------------------------------------------------------------

    -- Insert into Operacao_Agricola
    SAVEPOINT savePoint1;

    INSERT INTO Operacao_Agricola(id, data, VALIDADE)
    VALUES (v_id, v_data, 1);

    -- Insert into Sementeira
    INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
    VALUES (v_id, v_parcela_id, v_variedade_id, v_quantidade, v_area, v_metodo_execucao_id);

-----------------------------------------------------------------------------------------------------------------------

    IF (CHECKIFOPERATIONIDEXISTS(v_id) = 1 OR checkIfSementeiraExists(v_id) = 1) THEN
        COMMIT;
        returnValue := 1;
    ELSE
        ROLLBACK TO savePoint1;
    END IF;

    RETURN returnValue;
END;



CREATE OR REPLACE FUNCTION is_monda_registered(id MONDA.operacao_id%TYPE)
    RETURN NUMBER
    IS
    other_id MONDA.operacao_id%TYPE;
    CURSOR c1 IS SELECT operacao_id
                 FROM MONDA;
BEGIN
    OPEN c1;

    loop
        fetch c1 INTO other_id;
        IF (id = other_id) THEN
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

CREATE OR REPLACE function registar_Monda(
    this_parcela_id parcela.id%type,
    this_variedade_id variedade.id%type,
    this_quantidade monda.quantidade%type,
    this_metodo_execucao_id METODO_EXECUCAO.id%type,
    this_data OPERACAO_AGRICOLA.data%type)
    return number
    IS
    this_operacao_id OPERACAO_AGRICOLA.id%type;
BEGIN

    if CHECKIFPARCELEXISTS(this_parcela_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: O id da parcela não existe na base de dados');
        return 0;
    end if;

    if CHECKIFVARIETYEXISTS(this_variedade_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: O id da variedade não existe na base de dados');
        return 0;
    end if;

    if CHECKIFVARIETYISINPARCEL(this_parcela_id, this_variedade_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: A variedade não existe na parcela');
        return 0;
    end if;

    select max(id) + 1
    into this_operacao_id
    from OPERACAO_AGRICOLA;

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id) = 1 then
        DBMS_OUTPUT.PUT_LINE('ERRO: O id da operação já existe na tabela');
        return 0;
    end if;

    savepoint sp;

    insert into OPERACAO_AGRICOLA(id, data, validade) VALUES (this_operacao_id, this_data, 1);

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: Não foi possível fazer o registo na tabela OPERACAO_AGRICOLA');
        rollback to sp;
        return 0;
    end if;

    insert into MONDA(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
    VALUES (this_operacao_id, this_parcela_id, this_variedade_id, this_quantidade, this_metodo_execucao_id);

    if is_monda_registered(this_operacao_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: Não foi possível fazer o registo na tabela MONDA');
        rollback to sp;
        return 0;
    end if;

    commit;
    return 1;
END;



create or replace function checkIfHarvestIsRegistered(id colheita.operacao_id%type)
    return number
    is
    otherId colheita.operacao_id%type;
    cursor c1 is select operacao_id
                 from colheita;
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

create or replace function registar_Colheita(
    p_data Operacao_Agricola.data%TYPE,
    p_parcela_id Parcela.id%TYPE,
    p_produto_id Produto.id%TYPE,
    p_quantidade Colheita.quantidade%TYPE,
    p_metodo_execucao_id Metodo_Execucao.id%TYPE
)
    return number
    IS
    operation_id number;
    variedade_id variedade.id%TYPE;

BEGIN

    select max(id) into operation_id from Operacao_Agricola;
    operation_id := operation_id + 1;

    -- Check if the provided id already exists
    if (checkIfOperationIdExists(operation_id) = 1) then
        return 0;
    end if;

    if (CHECKIFPARCELEXISTS(p_parcela_id) = 0) then
        return 0;
    end if;

    if check_if_product_exists(p_produto_id) = 0 then
        return 0;
    end if;

    select variedade_id
    into variedade_id
    from produto,
         VARIEDADE
    where p_produto_id = produto.id
      and produto.VARIEDADE_ID = VARIEDADE.id;

    if (CHECKIFVARIETYISINPARCEL(p_parcela_id, variedade_id) = 0) then
        return 0;
    end if;


    savepoint s1;
    INSERT INTO Operacao_Agricola(id, data, validade)
    VALUES (operation_id, p_data, 1);
-- Insert into Colheita
    INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
    VALUES (operation_id, p_parcela_id, p_produto_id, p_metodo_execucao_id, p_quantidade);

    if (CHECKIFOPERATIONIDEXISTS(operation_id) = 0 or checkIfHarvestIsRegistered(operation_id) = 0) then
        rollback to s1;
        return 0;
    end if;

    commit;
    return 1;
end;



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


    INSERT INTO APLICACAO_FP_VARIEDADE (OPERACAO_ID, METODO_APLICACAO_ID)
    VALUES (this_operacao_id, this_metodo_aplicacao_id);

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



create or replace function checkIfPodaIsRegistered(id poda.operacao_id%type)
    return number
    is
    otherId poda.operacao_id%type;
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



create or replace function obterProdutosEmParcelaDeIntervalo(
    dataInferior Operacao_agricola.data%TYPE,
    dataSuperior Operacao_agricola.data%TYPE,
    parcelaId Parcela.id%type
)
    return sys_refcursor
    is
    queryCursor sys_refcursor;
begin
    open queryCursor for
        SELECT distinct Variedade.nome           AS nome_variedade,
                        Produto.nome             AS nome_produto,
                        sum(colheita.QUANTIDADE) AS quantidade_colhida
        FROM Colheita,
             Produto,
             Variedade,
             Parcela,
             Operacao_Agricola
        WHERE OPERACAO_AGRICOLA.ID = COLHEITA.OPERACAO_ID
          and COLHEITA.PARCELA_ID = parcelaId
          and COLHEITA.PRODUTO_ID = PRODUTO.ID
          and PRODUTO.VARIEDADE_ID = VARIEDADE.ID
          and Operacao_Agricola.data BETWEEN dataInferior AND dataSuperior
          AND Parcela.id = parcelaId
        group by Variedade.nome, Produto.nome
        order by nome_variedade, nome_produto;
    return queryCursor;
end;
/

create or replace procedure imprimirProdutosEmParcelaDeIntervalo(parcelaId Parcela.id%type,
                                                                 dataInferior OPERACAO_AGRICOLA.data%type,
                                                                 dataSuperior OPERACAO_AGRICOLA.data%type)
    is
    nomeParcela   Parcela.nome%type;
    nomeCultura   Cultura.nome_comum%type;
    nomeVariedade Variedade.nome%type;
    nomeProduto   Produto.nome%type;
    Quantidade    Colheita.quantidade%type;
    Data          OPERACAO_AGRICOLA.data%type;
    c1            sys_refcursor := obterProdutosEmParcelaDeIntervalo(dataInferior, dataSuperior, parcelaId);
begin
    select nome
    into nomeParcela
    from parcela p
    where p.id = parcelaId;

    dbms_output.put_line('Parcela: ' || nomeParcela);
    dbms_output.put_line('------------------------------');

    loop
        fetch c1 into nomecultura,nomevariedade,nomeproduto,Quantidade,data;
        dbms_output.put_line('CULTURA: ' || nomecultura);
        dbms_output.put_line('VARIEDADE: ' || nomevariedade);
        dbms_output.put_line('PRODUTO: ' || nomeproduto);
        dbms_output.put_line('QUANTIDADE: ' || quantidade);
        dbms_output.put_line('DATA_OPERAÇÃO: ' || data);
        dbms_output.put_line('------------------------------');
        exit when c1%notfound;
    end loop;
end;



create or replace function obterParcelasFP(parcelaId PARCELA.id%type, dataInicio OPERACAO_AGRICOLA.data%type,
                                           dataFim OPERACAO_AGRICOLA.data%type)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        SELECT distinct Fator_Producao.nome,
                        Composto_Quimico.nome,
                        sum(Ficha_Tecnica.quantidade)
        FROM Fator_Producao,
             Ficha_Tecnica,
             Composto_Quimico,
             FP_APLICADOS,
             Aplicacao_FP,
             APLICACAO_FP_SOLO,
             APLICACAO_FP_VARIEDADE,
             PARCELAS_VARIEDADES_APLICADAS,
             Operacao_Agricola,
             Parcela
        WHERE (
            (APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_SOLO.OPERACAO_ID and APLICACAO_FP_SOLO.PARCELA_ID = parcelaId) or
            (APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_VARIEDADE.OPERACAO_ID and
             APLICACAO_FP.OPERACAO_ID = PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID and
             PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID = parcelaId))

          and Fator_Producao.id = Ficha_Tecnica.fator_producao_id
          and Ficha_Tecnica.composto_quimico_id = Composto_Quimico.id
          and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.id
          and APLICACAO_FP.OPERACAO_ID = FP_APLICADOS.OPERACAO_ID
          and Aplicacao_FP.operacao_id = Operacao_Agricola.id
          AND Operacao_Agricola.data BETWEEN dataInicio AND dataFim
        group by Fator_Producao.nome, COMPOSTO_QUIMICO.NOME
        order by FATOR_PRODUCAO.NOME, COMPOSTO_QUIMICO.NOME;

    return c;
end;

create or replace procedure imprimirParcelasFP(parcelaId PARCELA.id%type, dataInicio OPERACAO_AGRICOLA.data%type,
                                               dataFim OPERACAO_AGRICOLA.data%type)
    is
    nomeFp     FATOR_PRODUCAO.nome%type;
    nomeCq     COMPOSTO_QUIMICO.nome%type;
    quantidade FICHA_TECNICA.quantidade%type;
    data       OPERACAO_AGRICOLA.data%type;
    c          sys_refcursor := obterParcelasFP(parcelaId, dataInicio, dataFim);
begin
    loop
        fetch c into nomeFp, nomeCq, quantidade, data;
        DBMS_OUTPUT.PUT_LINE('FATOR PRODUÇÃO = ' || nomeFp);
        DBMS_OUTPUT.PUT_LINE('COMPOSTO QUÍMICO = ' || nomeCq);
        DBMS_OUTPUT.PUT_LINE('QUANTIDADE = ' || quantidade);
        DBMS_OUTPUT.PUT_LINE('DATA = ' || data);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
        exit when c%notfound;
    end loop;
end;



CREATE OR REPLACE FUNCTION obterOperacoesPorParcela(
    p_parcela_id NUMBER,
    p_data_inicio DATE,
    p_data_fim DATE
)
    RETURN SYS_REFCURSOR
    IS
    v_cursor SYS_REFCURSOR;

BEGIN

    OPEN v_cursor FOR
        SELECT oa.id   AS operacao_id,
               oa.data,
               CASE
                   WHEN afp.operacao_id IS NOT NULL THEN 'Aplicacao_FP'
                   WHEN col.operacao_id IS NOT NULL THEN 'Colheita'
                   WHEN inc.operacao_id IS NOT NULL THEN 'Incorporacao_Solo'
                   WHEN mon.operacao_id IS NOT NULL THEN 'Monda'
                   WHEN op_plant.operacao_id IS NOT NULL THEN 'Op_Plantacao'
                   WHEN pod.operacao_id IS NOT NULL THEN 'Poda'
                   WHEN rega.operacao_id IS NOT NULL THEN 'Rega'
                   WHEN sem.operacao_id IS NOT NULL THEN 'Sementeira'
                   ELSE 'Outra Operacao'
                   END AS tipo_operacao

        FROM Operacao_Agricola oa

                 LEFT JOIN Aplicacao_FP afp ON oa.id = afp.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Colheita col ON oa.id = col.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Incorporacao_Solo inc
                           ON oa.id = inc.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Monda mon ON oa.id = mon.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Op_Plantacao op_plant
                           ON oa.id = op_plant.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Poda pod ON oa.id = pod.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Rega rega ON oa.id = rega.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim
                 LEFT JOIN Sementeira sem ON oa.id = sem.operacao_id AND oa.data BETWEEN p_data_inicio AND p_data_fim

        WHERE oa.data BETWEEN p_data_inicio AND p_data_fim
          AND sem.parcela_id = p_parcela_id;

    RETURN v_cursor;
END;



create or replace function obterAplicacoesFpDentroDeIntervalo(
    v_parcela_id parcela.id%type,
    data_Inferior Operacao_agricola.data%TYPE,
    data_Superior Operacao_agricola.data%TYPE,
    tipo_Fp_Id tipo_fp.id%type
)
    return sys_refcursor
    is
    queryCursor sys_refcursor;
begin
    open queryCursor for
        select distinct Operacao_Agricola.data, fator_producao.nome, Variedade.nome, FP_APLICADOS.QUANTIDADE
        from Aplicacao_fp,
             FP_APLICADOS,
             APLICACAO_FP_SOLO,
             APLICACAO_FP_VARIEDADE,
             PARCELAS_VARIEDADES_APLICADAS,
             fator_producao,
             tipo_fp,
             Operacao_agricola,
             Parcela,
             Variedade,
             PLANTACAO,
             PLANTACAO_PERMANENTE,
             PLANTACAO_TEMPORARIA

        where PARCELA.ID = v_parcela_id
          and Aplicacao_fp.operacao_id = Operacao_agricola.id
          and APLICACAO_FP.OPERACAO_ID = FP_APLICADOS.OPERACAO_ID
          and FP_APLICADOS.FP_ID = fator_producao.id
          and fator_producao.tipo_id = tipo_Fp_Id
          and Operacao_agricola.data between data_Inferior and data_Superior

          and ((APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_SOLO.OPERACAO_ID and
                APLICACAO_FP_SOLO.PARCELA_ID = PARCELA.ID) or
               (APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_VARIEDADE.OPERACAO_ID and
                APLICACAO_FP_VARIEDADE.OPERACAO_ID = PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID and
                PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID = PARCELA.ID and
                PARCELAS_VARIEDADES_APLICADAS.VARIEDADE_ID = VARIEDADE.ID))

          and ((PLANTACAO.PARCELA_ID = PARCELA.ID
            and PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
            and PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID)
            or (PLANTACAO.PARCELA_ID = PARCELA.ID
                and PLANTACAO.ID = PLANTACAO_TEMPORARIA.PLANTACAO_ID
                and PLANTACAO_TEMPORARIA.VARIEDADE_TEMP_ID = VARIEDADE.ID))

        order by Operacao_Agricola.data, FATOR_PRODUCAO.NOME, VARIEDADE.NOME, QUANTIDADE desc;
    return queryCursor;
end;

create or replace procedure imprimirAplicacoesFpDentroDeIntervalo(parcela_id parcela.id%type,
                                                                  dataInferior OPERACAO_AGRICOLA.data%type,
                                                                  dataSuperior OPERACAO_AGRICOLA.data%type,
                                                                  tipoFpId tipo_fp.id%type)
    is
    tipoFpNome    tipo_fp.tipo%type;
    data          operacao_agricola.data%type;
    parcelaNome   parcela.nome%type;
    fpNome        fator_producao.nome%type;
    variedadeNome variedade.nome%type;
    v_quantidade  FP_APLICADOS.QUANTIDADE%type;
    c1            sys_refcursor := obterAplicacoesFpDentroDeIntervalo(parcela_id, dataInferior, dataSuperior, tipoFpId);
begin
    select tipo
    into tipoFpNome
    from tipo_fp tfp
    where tfp.id = tipoFpId;

    select nome
    into parcelanome
    from PARCELA
    where parcela.id = parcela_id;

    dbms_output.put_line('TIPO_FP: ' || tipoFpNome);
    dbms_output.put_line('------------------------------');
    dbms_output.put_line('PARCELA: ' || parcelaNome);
    dbms_output.put_line('------------------------------');

    loop
        fetch c1 into data, fpNome, variedadeNome, v_quantidade;
        dbms_output.put_line('DATA_OPERAÇÃO: ' || data);
        dbms_output.put_line('FATOR_PRODUÇÁO: ' || fpNome);
        dbms_output.put_line('VARIEDADE: ' || variedadeNome);
        dbms_output.put_line('QUANTIDADE: ' || v_quantidade);
        dbms_output.put_line('------------------------------');
        exit when c1%notfound;
    end loop;
end;



create or replace function getMonthlyWateringTotal(
    beginDate operacao_agricola.data%type,
    endDate operacao_agricola.data%type)
    return sys_refcursor
    is
    return sys_refcursor; -- Declaração de cursor para armazenar os resultados da consulta
begin
    open return for
        -- Consulta para obter o total de rega mensal
        SELECT distinct parcela.NOME as parcela, EXTRACT(MONTH FROM op_agr.data) as mes, sum(rg.duracao) as totais_rega
        FROM rega rg,
             operacao_agricola op_agr,
             setor_rega str,
             plantacao plt,
             setorrega_plantacao str_plt,
             parcela
        WHERE PARCELA.id = plt.PARCELA_ID
          and plt.id = str_plt.plantacao_id             -- Relacionamento entre plantação e setor de rega
          AND str.id = str_plt.setor_id                 -- Relacionamento entre setor de rega e plantação
          AND str.id = rg.setor_id                      -- Relacionamento entre setor de rega e rega
          AND rg.operacao_id = op_agr.id                -- Relacionamento entre rega e operação agrícola
          AND op_agr.data BETWEEN beginDate and endDate -- Filtrando por intervalo de datas
        GROUP BY parcela.nome, EXTRACT(MONTH FROM op_agr.data)
        order by parcela, mes;

    return return; -- Retorna o cursor contendo os resultados da consulta
end;

-- Procedimento para imprimir o total mensal de rega
create or replace procedure printMonthlyWateringTotal(
    beginDate operacao_agricola.data%type,
    endDate operacao_agricola.data%type)
    is
    c1          sys_refcursor := getMonthlyWateringTotal(beginDate, endDate); -- Chama a função para obter o cursor
    v_parcela   parcela.nome%type;
    mes         number(2);
    totalRega   number(10);
    parcelaNome parcela.nome%type;
begin

    -- Loop para processar os resultados do cursor
    loop
        fetch c1 into v_parcela, mes, totalRega; -- Obtém os resultados do cursor
        dbms_output.put_line('Parcela: ' || v_parcela);
        dbms_output.put_line('Mes: ' || mes);
        dbms_output.put_line('Total de rega: ' || totalRega); -- Imprime o total de rega para o mês
        dbms_output.put_line('-----------------------------');
        exit when c1%notfound; -- Sai do loop quando não há mais resultados
    end loop;
end;



CREATE OR REPLACE TRIGGER register_moment
    BEFORE INSERT
    ON Operacao_Agricola
    FOR EACH ROW

BEGIN
    :NEW.instante_registo := CURRENT_TIMESTAMP;
END;



CREATE OR REPLACE TRIGGER log_operacao_update_trigger
    BEFORE UPDATE
    ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Updates are not allowed on the LOG_OPERACAO table.');
END;
/

CREATE OR REPLACE TRIGGER log_operacao_delete_trigger
    BEFORE DELETE
    ON LOG_OPERACAO
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20002, 'Deletions are not allowed on the LOG_OPERACAO table.');
END;



create or replace trigger nao_apagar_operacoes
    before delete
    on OPERACAO_AGRICOLA
begin
    RAISE_APPLICATION_ERROR(-20003, 'Não é permitida a deleção de registos na tabela OPERACAO_AGRICOLA');
end;

create or replace trigger nao_apagar_regas
    before delete
    on REGA
begin
    RAISE_APPLICATION_ERROR(-20003, 'Não é permitida a deleção de registos na tabela REGA');
end;



CREATE OR REPLACE FUNCTION cancel_operation(p_operacao_id NUMBER)
    RETURN NUMBER IS
    returnValue     NUMBER := 0;
    v_data_prevista DATE;
    v_data_atual    DATE;

BEGIN
    -------------------------------------------------------------------------------------------------------------------

    --Verificar se operação pode ser anulada

    SELECT data
    INTO v_data_prevista
    FROM OPERACAO_AGRICOLA
    WHERE id = p_operacao_id;

    v_data_atual := SYSDATE;

    IF v_data_atual > v_data_prevista + 3 THEN
        --ja se passaram mais de 3 dias desde a data prevista
        DBMS_OUTPUT.put_line('Já se passaram mais de 3 dias desde a data prevista. Não é possível anular a operação');
        RETURN returnValue; -- falha na anulação da operação
    END IF;

    -------------------------------------------------------------------------------------------------------------------

    -- Verificar operações dependentes

    --IF EXISTS(SELECT 1 FROM OPERACAO_AGRICOLA WHERE id_dependente = p_operacao_id) THEN
    --existem operações dependentes
    --DBMS_OUTPUT.put_line('Não é possível anular a operação. Existem operações dependentes');
    --RETURN returnValue; -- falha na anulação da operação
    --end if;

    -------------------------------------------------------------------------------------------------------------------

    -- Anula a operação

    UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = p_operacao_id;

    COMMIT;
    RETURN 1;
    -- Operação Anulada com sucesso

    -------------------------------------------------------------------------------------------------------------------

END;



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



CREATE OR REPLACE FUNCTION obterCulturasComMaiorConsumoAgua(ano NUMBER)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        SELECT C.nome_comum AS Cultura, SUM(R.duracao) AS Consumo_Agua_Minutos
        FROM Rega R
                 JOIN Operacao_Agricola OA ON R.operacao_id = OA.id
                 JOIN Setor_Rega SR ON R.setor_id = SR.id
                 JOIN SetorRega_Plantacao SRP ON R.setor_id = SRP.setor_id
                 JOIN Plantacao PL
                 JOIN Plantacao_Permanente PLP ON PL.id = PLP.plantacao_id
                 LEFT JOIN Plantacao_Temporaria PLT ON PL.id = PLT.plantacao_id
                           ON SRP.plantacao_id = PL.id
                 JOIN Parcela P ON PL.parcela_id = P.id
                 JOIN Variedade V ON (PLP.variedade_perm_id = V.id OR PLT.variedade_temp_id = V.id)
                 JOIN Cultura C ON V.cultura_id = C.id
        WHERE EXTRACT(YEAR FROM OA.data) = ano
          AND V.id IN (SELECT DISTINCT VARIEDADE.id
                       FROM VARIEDADE
                                JOIN VARIEDADE_PERMANENTE ON VARIEDADE.id = VARIEDADE_PERMANENTE.variedade_id
                                JOIN PLANTACAO_PERMANENTE
                                     ON VARIEDADE_PERMANENTE.variedade_id = PLANTACAO_PERMANENTE.variedade_perm_id
                                JOIN PLANTACAO ON PLANTACAO_PERMANENTE.plantacao_id = PLANTACAO.id
                       WHERE PLANTACAO.id = PLANTACAO_PERMANENTE.plantacao_id

                       UNION

                       SELECT DISTINCT VARIEDADE.id
                       FROM VARIEDADE
                                JOIN VARIEDADE_TEMPORARIA ON VARIEDADE.id = VARIEDADE_TEMPORARIA.variedade_id
                                JOIN PLANTACAO_TEMPORARIA
                                     ON VARIEDADE_TEMPORARIA.variedade_id = PLANTACAO_TEMPORARIA.variedade_temp_id
                                JOIN PLANTACAO ON PLANTACAO_TEMPORARIA.plantacao_id = PLANTACAO.id
                       WHERE PLANTACAO.id = PLANTACAO_TEMPORARIA.plantacao_id)
        GROUP BY C.nome_comum
        ORDER BY Consumo_Agua_Minutos DESC;
    return c;
end;

CREATE OR REPLACE PROCEDURE imprimirCulturasComMaiorConsumoAgua(ano NUMBER)
    IS
    c           SYS_REFCURSOR := obterCulturasComMaiorConsumoAgua(ano);
    nomeCultura CULTURA.nome_comum%TYPE;
    consumoAgua NUMBER;
BEGIN
    LOOP
        FETCH c INTO nomeCultura, consumoAgua;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('CULTURA = ' || nomeCultura);
        DBMS_OUTPUT.PUT_LINE('CONSUMO DE ÁGUA (Minutos) = ' || consumoAgua);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;
    CLOSE c;
END;



create or replace function obter_compostos_quimicos_usados_nao_nesse_ano(v_ano number)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct COMPOSTO_QUIMICO.nome as composto
        from OPERACAO_AGRICOLA,
             FP_APLICADOS,
             FATOR_PRODUCAO,
             FICHA_TECNICA,
             COMPOSTO_QUIMICO
        where not extract(year from OPERACAO_AGRICOLA.DATA) = v_ano
          and OPERACAO_AGRICOLA.ID = FP_APLICADOS.OPERACAO_ID
          and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.ID
          and FP_APLICADOS.FP_ID = FICHA_TECNICA.FATOR_PRODUCAO_ID
          and FICHA_TECNICA.COMPOSTO_QUIMICO_ID = COMPOSTO_QUIMICO.ID
        order by COMPOSTO_QUIMICO.NOME;
    return c;
end;



create or replace procedure imprimir_compostos_quimicos_usados_nao_nesse_ano(v_ano number)
    is
    v_compostos sys_refcursor := OBTER_COMPOSTOS_QUIMICOS_USADOS_NAO_NESSE_ANO(v_ano);
    v_composto  COMPOSTO_QUIMICO.nome%type;
begin
    DBMS_OUTPUT.PUT_LINE('COMPOSTOS QUÍMICOS: ');
    loop
        fetch v_compostos into v_composto;
        exit when v_compostos%notfound;
        DBMS_OUTPUT.PUT_LINE('- ' || v_composto);
    end loop;
end;



CREATE OR REPLACE FUNCTION obter_fp
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM FATOR_PRODUCAO
        ORDER BY id;
    RETURN v_cursor;
END;



create or replace function get_metodos_aplicacao
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from METODO_APLICACAO;
    return c;
end;



create or replace function get_execution_methods
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from METODO_EXECUCAO;
    return c;
end;


create or replace function is_there_execution_method(id METODO_EXECUCAO.id%type)
    return number
    is
    other_id METODO_APLICACAO.id%type;
    cursor c is select id
                from METODO_EXECUCAO;
begin
    open c;
    loop
        fetch c into other_id;
        if other_id = id then
            return 1;
        end if;
        exit when c%notfound;
    end loop;
    close c;
    return 0;
end;



CREATE OR REPLACE FUNCTION obter_parcelas
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM Parcela
        ORDER BY id;
    RETURN v_cursor;
END;



CREATE OR REPLACE FUNCTION get_produtos
    RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
    OPEN v_cursor FOR
        SELECT *
        FROM PRODUTO
        ORDER BY id;
    RETURN v_cursor;
END;

create or replace function get_produtos_in_parcela(parcelaId Parcela.id%TYPE)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct produto.id, produto.nome
        from parcela,
             plantacao,
             plantacao_permanente,
             plantacao_temporaria,
             variedade,
             produto
        where parcelaId = plantacao.parcela_id
          and ((plantacao.id = plantacao_permanente.plantacao_id and
                plantacao_permanente.variedade_perm_id = variedade.id)
            or (plantacao.id = plantacao_temporaria.plantacao_id and
                plantacao_temporaria.variedade_temp_id = variedade.id))
          and produto.VARIEDADE_ID = VARIEDADE.ID;
    return c;
end;



create or replace function get_fertigation_mixes
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from RECEITA_FERTIRREGA;
    return c;
end;

create or replace function is_there_mix(mix_name RECEITA_FERTIRREGA.nome%type)
    return number
    is
    mixes sys_refcursor := get_fertigation_mixes();
    ID    SETOR_REGA.id%type;
    name  setor_rega.nome%type;
begin
    loop
        fetch mixes into id, name;
        if lower(mix_name) = lower(name) then
            return 1;
        end if;
        exit when mixes%notfound;
    end loop;
    return 0;
end;



create or replace function get_watering_sectors
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from setor_rega;
    return c;
end;



create or replace function is_there_sector(sector_name setor_rega.nome%type)
    return number
    is
    sectors              sys_refcursor := get_watering_sectors();
    ID                   SETOR_REGA.id%type;
    name                 setor_rega.nome%type;
    AREA                 setor_rega.area%type;
    max_flow_rate        setor_rega.caudal_maximo%type;
    begin_date           setor_rega.data_inicio%type;
    end_date             setor_rega.data_fim%type;
    dispensing_method_id setor_rega.metodo_dispensasao_id%type;
begin
    loop
        fetch sectors into id, name, area, max_flow_rate, begin_date, end_date, dispensing_method_id;
        if lower(sector_name) = lower(name) then
            return 1;
        end if;
        exit when sectors%notfound;
    end loop;
    return 0;
end;



create or replace function obter_tipos_fp
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from TIPO_FP;
    return c;
end;



create or replace function get_varieties_in_parcel(parcel_id parcela.id%type)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select distinct variedade.*
        from parcela,
             plantacao,
             plantacao_permanente,
             plantacao_temporaria,
             variedade
        where parcel_id = plantacao.parcela_id
          and ((plantacao.id = plantacao_permanente.plantacao_id and
                plantacao_permanente.variedade_perm_id = variedade.id)
            or (plantacao.id = plantacao_temporaria.plantacao_id and
                plantacao_temporaria.variedade_temp_id = variedade.id));
    return c;
end;