create or replace function get_metodos_aplicacao
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from METODO_APLICACAO;
    return c;
end;