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