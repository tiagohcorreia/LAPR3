create or replace function get_watering_sectors
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from setor_rega;
    return c;
end;