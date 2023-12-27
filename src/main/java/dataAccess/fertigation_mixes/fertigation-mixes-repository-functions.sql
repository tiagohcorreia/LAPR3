create or replace function get_fertigation_mixes
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from RECEITA_FERTIRREGA;
    return c;
end;