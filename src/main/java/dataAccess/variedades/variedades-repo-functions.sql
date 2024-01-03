create or replace function get_varieties_in_parcel(parcel_id parcela.id%type)
return sys_refcursor
is c sys_refcursor;
begin
    open c for
        select distinct variedade.*
        from parcela,
             plantacao,
             plantacao_permanente,
             plantacao_temporaria,
             variedade
        where parcel_id = plantacao.parcela_id
          and ((plantacao.id = plantacao_permanente.plantacao_id and
                plantacao_permanente.variedade_perm_id = variedade.id)
            or (plantacao.id = plantacao_temporaria.plantacao_id and
                plantacao_temporaria.variedade_temp_id = variedade.id));
    return c;
end;