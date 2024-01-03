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