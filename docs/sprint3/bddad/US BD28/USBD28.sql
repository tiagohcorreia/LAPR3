-- USBD28 - Anular, não apagar Operação Agrícola

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



/*CREATE OR REPLACE FUNCTION anular_operacao(v_operacao_id OPERACAO_AGRICOLA.id%type)
    RETURN boolean IS
    v_validade OPERACAO_AGRICOLA.validade%type;
BEGIN
    if CHECKIFOPERATIONIDEXISTS(v_operacao_id) = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: A operação não existe');
        return false;
    end if;

    select VALIDADE into v_validade from OPERACAO_AGRICOLA where ID = v_operacao_id;

    if v_validade = 0 then
        DBMS_OUTPUT.PUT_LINE('ERRO: A operação já está anulada');
        return false;
    end if;

    -- Anular a operação
    UPDATE OPERACAO_AGRICOLA SET validade = 0 WHERE id = v_operacao_id;

    select VALIDADE into v_validade from OPERACAO_AGRICOLA where ID = v_operacao_id;

    if v_validade = 1 then
        DBMS_OUTPUT.PUT_LINE('ERRO: Não foi possível anular a operação');
        return false;
    end if;

    COMMIT;
    RETURN true; -- Operação anulada com sucesso
END;*/
/



