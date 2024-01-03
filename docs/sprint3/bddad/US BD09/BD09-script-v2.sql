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