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





-- OBTER ID DA OPERAÇÃO
SELECT *
FROM OPERACAO_AGRICOLA
order by ID desc ;





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

--464
SELECT *
FROM OPERACAO_AGRICOLA;