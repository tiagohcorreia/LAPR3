-- US 31 ---------------------------------------------------------------------------------------------------------------


/*
CASO SUCESSO:

Inserir Receita 22
Tecniferti MOL, Tecniferti, 60 l/ha
Kiplant AllGrip, Asfertglobal, 2 l/ha
soluSOP 52, K+S, 2.5 kg/ha

Fazer pesquisa para mostrar que a receita ficou registada, incluindo os 3 componentes.

 */
declare
    v_nome          RECEITA_FERTIRREGA.nome%type := 'Receita 22';

    --Tecniferti MOL, Tecniferti, 60 l/ha
    dados_fp_1      dados_fp_receita             := dados_fp_receita(14, 60, 'l/ha');
    --Kiplant AllGrip, Asfertglobal, 2 l/ha
    dados_fp_2      dados_fp_receita             := dados_fp_receita(17, 2, 'l/ha');
    --soluSOP 52, K+S, 2.5 kg/ha
    dados_fp_3      dados_fp_receita             := dados_fp_receita(15, 2.5, 'kg/ha');
    v_dados_receita dados_receita                := dados_receita(dados_fp_1, dados_fp_2, dados_fp_3);
begin
    if registrar_receita_fertirrega(v_nome, v_dados_receita) then
        DBMS_OUTPUT.PUT_LINE('SUCESSO');
    else
        DBMS_OUTPUT.PUT_LINE('INSUCESSO');
    end if;
end;

select *
from RECEITA_FERTIRREGA
order by ID desc;

select distinct RECEITA_FERTIRREGA.nome as receita, FATOR_PRODUCAO.nome as fator_producao
from RECEITA_FERTIRREGA,
     FATOR_PRODUCAO,
     RECEITA_FP
where RECEITA_FERTIRREGA.ID = ?
  and RECEITA_FERTIRREGA.ID = RECEITA_FP.RECEITA_ID
  and RECEITA_FP.FP_ID = FATOR_PRODUCAO.ID;


/*
CASO INSUCESSO

Inserir Receita 23
Tecniferti MOL, Tecniferti, 60 l/ha
Kiplant AllFit Plus, Asfertglobal, 2.5 l/ha

Deve dar erro por não existir um dos componentes registado no sistema.
 */
declare
    v_nome          RECEITA_FERTIRREGA.nome%type := 'Receita 23';

    --Tecniferti MOL, Tecniferti, 60 l/ha
    dados_fp_1      dados_fp_receita             := dados_fp_receita(14, 60, 'l/ha');
    --Kiplant AllFit Plus, Asfertglobal, 2.5 l/ha
    dados_fp_2      dados_fp_receita             := dados_fp_receita(-1, 2.5, 'l/ha');
    v_dados_receita dados_receita                := dados_receita(dados_fp_1, dados_fp_2);
begin
    if registrar_receita_fertirrega(v_nome, v_dados_receita) then
        DBMS_OUTPUT.PUT_LINE('SUCESSO');
    else
        DBMS_OUTPUT.PUT_LINE('INSUCESSO');
    end if;
end;

select *
from RECEITA_FERTIRREGA
order by ID desc;








-- US 32 ---------------------------------------------------------------------------------------------------------------


-- USBD32 Como Gestor Agrícola, pretendo registar uma operação de rega, incluindo a componente de fertirrega (se aplicável).


/*
CASO DE SUCESSO

Inserir 02/09/2023 operação de fertirrega, setor 10, 90 min, 05:00, receita 10

Fazer pesquisa para mostrar que foram registadas as duas seguintes operações compostas:

#Operação X (número fictício)
- Rega em cultura de Oliveira Galega, localizada no campo grande, 90 min
- Aplicação de fator de produção em cultura de Oliveira Galega, localizada no campo grande (0.135 ha de área)
	- 8.1 l Tecniferti MOL
	- 0.27 l Kiplant AllGrip

#Operação Y (número fictício)
- Rega em cultura de Oliveira Picual, localizada no campo grande, 90 min
- Aplicação de fator de produção em cultura de Oliveira Picual, localizada no campo grande (0.09 ha de área)
	- 5.4 l Tecniferti MOL
	- 0.18 l Kiplant AllGrip

Cada operação tem de dar lugar a duas operações especializadas com o mesmo ID, uma rega e uma aplicação de fator de produção.
Não faz sentido registar a receita, uma vez que este conceito não existe numa aplicação de fator de produção isolada (se ser através de fertirrega).
*/

-- VER ESTADO DA TABELA
SELECT *
FROM OPERACAO_AGRICOLA
order by ID desc;



declare
    sector_id      SETOR_REGA.id%type          := 10;
    operation_date OPERACAO_AGRICOLA.data%type := to_date('02-09-2023', 'dd-mm-yyyy');
    duration       REGA.duracao%type           := 90;
    hour           rega.hora%type              := '05:00';
    mix_id         RECEITA_FERTIRREGA.id%type  := 2;
    out            number;
begin
    out := register_fertigation(sector_id, operation_date, duration, hour, mix_id);
    if out = 1 then
        dbms_output.PUT_LINE('SUCESSO. OUT = ' || out);
    else
        dbms_output.PUT_LINE('INSUCESSO. OUT = ' || out);
    end if;
end;


-- VER REGA REGISTADA
select distinct operacao_agricola.id as id_operacao,
                rega.operacao_id     as id_rega,
                PARCELA.NOME         as parcela,
                variedade.nome       as variedade,
                rega.DURACAO         as duracao_min

from operacao_agricola,
     rega,
     parcela,
     variedade,
     VARIEDADE_PERMANENTE,
     PLANTACAO,
     PLANTACAO_PERMANENTE,
     SETOR_REGA,
     SETORREGA_PLANTACAO

where OPERACAO_AGRICOLA.ID = ?

  and REGA.OPERACAO_ID = OPERACAO_AGRICOLA.ID

  and REGA.SETOR_ID = SETOR_REGA.ID

  AND SETOR_REGA.ID = SETORREGA_PLANTACAO.SETOR_ID
  AND SETORREGA_PLANTACAO.PLANTACAO_ID = PLANTACAO.ID
  AND PLANTACAO.PARCELA_ID = PARCELA.ID
  AND PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
  AND PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID;


-- VER PARCELA, VARIEDADES E HECTARES REGADOS
select distinct operacao_agricola.id                      as id_operacao,
                aplicacao_fp.operacao_id                  as id_aplicacao_id,
                PARCELA.NOME                              as parcela,
                variedade.nome                            as variedade,
                (PLANTACAO_PERMANENTE.compasso * PLANTACAO_PERMANENTE.DISTANCIA_FILAS *
                 PLANTACAO_PERMANENTE.QUANTIDADE) / 10000 as hectares_aplicados


from operacao_agricola,
     aplicacao_fp,
     aplicacao_fp_variedade,
     parcelas_variedades_aplicadas,
     parcela,
     plantacao,
     plantacao_permanente,
     variedade

where OPERACAO_AGRICOLA.ID = ?

  and APLICACAO_FP.OPERACAO_ID = OPERACAO_AGRICOLA.ID

  and APLICACAO_FP.OPERACAO_ID = APLICACAO_FP_VARIEDADE.OPERACAO_ID
  and APLICACAO_FP_VARIEDADE.OPERACAO_ID = PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID

  AND PARCELAS_VARIEDADES_APLICADAS.VARIEDADE_ID = VARIEDADE.ID

  and PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID = PARCELA.ID

  and PARCELA.ID = PLANTACAO.PARCELA_ID
  AND PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
  AND PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID
GROUP BY operacao_agricola.id, aplicacao_fp.operacao_id, PARCELA.NOME,
         (PLANTACAO_PERMANENTE.compasso * PLANTACAO_PERMANENTE.DISTANCIA_FILAS *
          PLANTACAO_PERMANENTE.QUANTIDADE) / 10000, variedade.nome;


-- VER PARCELAS, VARIEDADES, LITROS APLICADOS POR FP
select distinct operacao_agricola.id     as id_operacao,
                aplicacao_fp.operacao_id as id_aplicacao_id,
                PARCELA.NOME             AS PARCELA_C,
                VARIEDADE.NOME           AS VARIEDADE_C,
                fator_producao.nome      as fator_producao_c,
                receita_fp.PROPORCAO * (PLANTACAO_PERMANENTE.compasso * PLANTACAO_PERMANENTE.DISTANCIA_FILAS *
                                        PLANTACAO_PERMANENTE.QUANTIDADE / 10000)
                                         as litros_aplicados

from operacao_agricola,
     aplicacao_fp,
     fp_aplicados,
     RECEITA_FP,
     RECEITA_FERTIRREGA,
     FATOR_PRODUCAO,
     parcela,
     VARIEDADE,
     PARCELAS_VARIEDADES_APLICADAS,
     plantacao,
     plantacao_permanente

where OPERACAO_AGRICOLA.ID = ?

  and APLICACAO_FP.OPERACAO_ID = OPERACAO_AGRICOLA.ID

  and APLICACAO_FP.OPERACAO_ID = FP_APLICADOS.OPERACAO_ID
  and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.ID

  AND RECEITA_FERTIRREGA.ID = RECEITA_FP.RECEITA_ID
  AND RECEITA_FP.FP_ID = FATOR_PRODUCAO.ID

  and APLICACAO_FP.OPERACAO_ID = PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID

  and PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID = PARCELA.ID
  AND PARCELAS_VARIEDADES_APLICADAS.VARIEDADE_ID = VARIEDADE.ID

  and PARCELA.ID = PLANTACAO.PARCELA_ID
  AND PLANTACAO.ID = PLANTACAO_PERMANENTE.PLANTACAO_ID
  AND PLANTACAO_PERMANENTE.VARIEDADE_PERM_ID = VARIEDADE.ID

GROUP BY operacao_agricola.id, aplicacao_fp.operacao_id, PARCELA.NOME, VARIEDADE.NOME, fator_producao.nome,
         receita_fp.PROPORCAO * (PLANTACAO_PERMANENTE.compasso * PLANTACAO_PERMANENTE.DISTANCIA_FILAS *
                                 PLANTACAO_PERMANENTE.QUANTIDADE / 10000)
ORDER BY operacao_agricola.id, aplicacao_fp.operacao_id, PARCELA.NOME, VARIEDADE.NOME, fator_producao.nome;


/*
CASO INSUCESSO

Inserir 02/09/2023 operação de fertirrega, setor 10, 90 min, 05:00, receita 50
Deve dar erro por não existir receita de fertirrega registada no sistema.
 */

SELECT *
FROM OPERACAO_AGRICOLA
order by id desc;



declare
    sector_id      SETOR_REGA.id%type          := 10;
    operation_date OPERACAO_AGRICOLA.data%type := to_date('02-09-2023', 'dd-mm-yyyy');
    duration       REGA.duracao%type           := 90;
    hour           rega.hora%type              := '05:00';
    mix_id         RECEITA_FERTIRREGA.id%type  := -1;
    out            number;
begin
    out := register_fertigation(sector_id, operation_date, duration, hour, mix_id);
    if out = 1 then
        dbms_output.PUT_LINE('SUCESSO. OUT = ' || out);
    else
        dbms_output.PUT_LINE('INSUCESSO. OUT = ' || out);
    end if;
end;





-- US 30 ---------------------------------------------------------------------------------------------------------------


-- USBD30 Como Gestor Agrícola, pretendo anular uma operação que estava prevista e não se realizou ou que foi criada por engano, sabendo que isso só é possível até aos 3 dias seguintes à sua data prevista de execução, se não houver operações posteriores dependentes desta.

/*
 <Caso de sucesso>
Inserir operação de rega com data no dia da defesa, setor 11, 60 min, 15:00
Anular operação de rega de cultura de Oliveira Arbequina, localizada no campo grande, no dia da defesa, 60 min, 15:00
Fazer pesquisa a mostrar operação como anulada.
<\Caso de sucesso>
 */

SELECT *
FROM OPERACAO_AGRICOLA
order by id desc;


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
select id, validade
from OPERACAO_AGRICOLA
where id=403;



begin
    if cancel_operation(403) = 1 then
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO ANULADA');
    else
        DBMS_OUTPUT.PUT_LINE('OPERAÇÃO NÃO ANULADA');
    end if;
end;






-- US 24 e 25 ---------------------------------------------------------------------------------------------------------------

-- ** USBD24 Como Gestor Agrícola, pretendo que todos os registos relacionados com operações tenham registado o instante em que foram criados, gerado pelo SGBD.

-- ** USBD25 Como Gestor Agrícola, pretendo que a identificação da operação seja um número sequencial, não gerado automaticamente pelo SGBD, que deve ser gerado no contexto da transação de registo da operação. Se este registo falhar, não deve haver consequências, nomeadamente a existência de "buracos" na numeração.
--
-- <Caso de sucesso>
-- Efetuar pesquisa sobre a tabela de operações para mostrar que TODAS as operações inseridas acima aparecem com um timestamp correspondente ao dia da apresentação e que a numeração é sequencial e sem falhas.
-- <\Caso de sucesso>

select id, INSTANTE_REGISTO
from OPERACAO_AGRICOLA
order by id desc;






-- US 27 e 28 ---------------------------------------------------------------------------------------------------------------


-- ** USBD27 Como Gestor Agrícola, pretendo que não seja possível alterar ou apagar os logs.

/*
 <Caso de sucesso>
Tentar apagar o último registo da tabela de logs
Deve dar erro por operação ilegal/não permitida.

Tentar alterar texto do último registo da tabela de logs
Deve dar erro por operação ilegal/não permitida.
<\Caso de sucesso>



  ** USBD28 Como Gestor Agrícola, pretendo que não seja possível apagar operações, mas deve ser possível anular uma operação, ficando isso registado na BD.

<Caso de sucesso>
Tentar apagar o último registo da tabela de rega
Deve dar erro por operação ilegal/não permitida.

O log da anulação realizada na demonstração da USBD30 deve estar na tabela de logs.
<\Caso de sucesso>
 */

select *
from REGA
order by OPERACAO_ID desc;

delete
from REGA
where OPERACAO_ID = ?;



select *
from LOG_OPERACAO;

insert into LOG_OPERACAO(id, OPERACAO_ID, log)
values (-1, 101, 'log_teste');

update LOG_OPERACAO
set LOG='log_teste_update'
where id = -1;

delete
from LOG_OPERACAO
where id = -1;




-- US 33 ---------------------------------------------------------------------------------------------------------------

/*
 ** USBD33 Como Gestor Agrícola, pretendo obter a lista das culturas com maior consumo de água (rega) para um dado ano civil. O consumo é em minutos e, em caso de empate, devem ser dadas todas essas culturas.

Ano civil 2023, culturas com 2130 min de rega:
Macieira Jonagored
Macieira Fuji
Macieira Royal Gala
Macieira Royal Gala
Macieira Pipo de Basto
Macieira Porta da Loja
Macieira Malápio
Macieira Canada
Macieira Grand Fay
Macieira Gronho Doce
 */

DECLARE
    ano  NUMBER := 2023;
BEGIN
    imprimirCulturasComMaiorConsumoAgua(ano);
END;




-- US 33 ---------------------------------------------------------------------------------------------------------------

/*
 ** USBD34 Como Gestor Agrícola, pretendo obter a lista das substâncias de fatores de produção usadas noutros anos civis, mas não usadas no ano civil indicado.
 */

begin
    IMPRIMIR_COMPOSTOS_QUIMICOS_USADOS_NAO_NESSE_ANO(2023);
end;


select distinct extract(year from OPERACAO_AGRICOLA.DATA) as ano,
                COMPOSTO_QUIMICO.nome as composto
from OPERACAO_AGRICOLA,
     FP_APLICADOS,
     FATOR_PRODUCAO,
     FICHA_TECNICA,
     COMPOSTO_QUIMICO
where not extract(year from OPERACAO_AGRICOLA.DATA) = ?
  and OPERACAO_AGRICOLA.ID = FP_APLICADOS.OPERACAO_ID
  and FP_APLICADOS.FP_ID = FATOR_PRODUCAO.ID
  and FP_APLICADOS.FP_ID = FICHA_TECNICA.FATOR_PRODUCAO_ID
  and FICHA_TECNICA.COMPOSTO_QUIMICO_ID = COMPOSTO_QUIMICO.ID
order by ano desc, composto;