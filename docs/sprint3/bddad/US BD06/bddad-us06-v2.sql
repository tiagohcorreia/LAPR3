-- US BD06 Como Gestor Agrícola, pretendo saber o número de fatores de produção aplicados numa
-- dada parcela, para cada tipo de fator, num dado intervalo de tempo.

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

