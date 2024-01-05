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
/


/*
 <Caso de sucesso>
Inserir operação de rega com data no dia da defesa, setor 11, 60 min, 15:00
Anular operação de rega de cultura de Oliveira Arbequina, localizada no campo grande, no dia da defesa, 60 min, 15:00
Fazer pesquisa a mostrar operação como anulada.
<\Caso de sucesso>
 */

declare
    sector_id      SETOR_REGA.id%type          := 11;
    operation_date OPERACAO_AGRICOLA.data%type := sysdate;
    duration       REGA.duracao%type           := 60;
    hour           rega.hora%type              := '15:00';
begin
    if REGISTER_WATERING(sector_id, operation_date, duration, hour) = 1 then
        DBMS_OUTPUT.PUT_LINE('REGISTADO COM SUCESSO');
    else
        DBMS_OUTPUT.PUT_LINE('NÃO REGISTADO');
    end if;
end;

select *
from OPERACAO_AGRICOLA;

begin
    if cancel_operation(466) = 1 then
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO ANULADA');
    else
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO NÃO ANULADA');
    end if;
end;



/*
<Caso de insucesso>
Anular operação de rega de cultura de Oliveira Picual, localizada no campo grande, em 02/10/2023, 60 min, 06:00
Deve dar erro por já passarem mais de 3 dias sobre a data de realização.
<\Caso de insucesso>
 */

-- OBTER ID DA OPERAÇÃO
SELECT operacao_agricola.id, operacao_agricola.data, parcela.nome, variedade.nome, rega.duracao, rega.hora
from OPERACAO_AGRICOLA,
     PARCELA,
     VARIEDADE,
     REGA,
     PLANTACAO,
     PLANTACAO_PERMANENTE,
     SETORREGA_PLANTACAO
where OPERACAO_AGRICOLA.ID = REGA.OPERACAO_ID
  and PARCELA.ID = 102
  and VARIEDADE.ID = 89
  and OPERACAO_AGRICOLA.DATA = to_date('02/10/2023', 'dd/mm/yyyy')
  and rega.SETOR_ID = SETORREGA_PLANTACAO.SETOR_ID
  and SETORREGA_PLANTACAO.PLANTACAO_ID = PLANTACAO.ID
  and plantacao.PARCELA_ID = parcela.ID
  and plantacao.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
  and PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID;

select *
from OPERACAO_AGRICOLA;

begin
    if cancel_operation(403) = 1 then
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO ANULADA');
    else
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO NÃO ANULADA');
    end if;
end;