create or replace function obter_tipos_fp
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from TIPO_FP;
    return c;
end;