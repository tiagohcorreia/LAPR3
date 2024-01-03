CREATE OR REPLACE FUNCTION is_monda_registered(id MONDA.operacao_id%TYPE)
    RETURN NUMBER
    IS
    other_id MONDA.operacao_id%TYPE;
    CURSOR c1 IS SELECT operacao_id FROM MONDA;
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

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id)=1 then
        DBMS_OUTPUT.PUT_LINE('ERRO: O id da operação já existe na tabela');
        return 0;
    end if;

    savepoint sp;

    insert into OPERACAO_AGRICOLA(id, data, validade) VALUES (this_operacao_id, this_data, 1);

    if CHECKIFOPERATIONIDEXISTS(this_operacao_id)=0 then
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

-- caso sucesso
-- Registar uma operação de monda no Campo novo, em 08/09/2023, na plantação de cenouras Danvers Half Long, 0.5 ha
declare
    p_parcelaId        NUMBER := 108;
    p_variedadeId      NUMBER := 75;
    p_quantidade       NUMBER := 0.5;
    p_metodoExecucaoId NUMBER := NULL;
    p_fatorProducaoId  NUMBER := NULL;
    p_data             DATE   := to_date('08-09-2023', 'dd-mm-yyyy');
begin
    registrarMonda(p_parcelaId, p_variedadeId, p_quantidade, p_metodoExecucaoId, p_fatorProducaoId, p_data);
end;


-- caso insucesso
-- Registar uma operação de monda no Campo novo, em 11/10/2023, na plantação de cenouras Danvers Half Long, 0.5 ha
declare
    p_parcelaId        NUMBER := 108;
    p_variedadeId      NUMBER := 75;
    p_quantidade       NUMBER := 0.5;
    p_metodoExecucaoId NUMBER := NULL;
    p_fatorProducaoId  NUMBER := NULL;
    p_data             DATE   := to_date('11-10-2023', 'dd-mm-yyyy');
begin
    registrarMonda(p_parcelaId, p_variedadeId, p_quantidade, p_metodoExecucaoId, p_fatorProducaoId, p_data);
end;


