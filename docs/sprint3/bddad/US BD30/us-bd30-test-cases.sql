
-- USBD30 Como Gestor Agrícola, pretendo anular uma operação que estava prevista e não se realizou ou que foi criada por engano, sabendo que isso só é possível até aos 3 dias seguintes à sua data prevista de execução, se não houver operações posteriores dependentes desta.

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


-- VER ID OPERAÇÃO
select *
from OPERACAO_AGRICOLA
order by id desc;



-- TENTAR ANULAR
begin
    if cancel_operation(?) = 1 then
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



-- VER ESTADO DA TABELA
select *
from OPERACAO_AGRICOLA;




begin
    if cancel_operation(403) = 1 then
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO ANULADA');
    else
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO NÃO ANULADA');
    end if;
end;