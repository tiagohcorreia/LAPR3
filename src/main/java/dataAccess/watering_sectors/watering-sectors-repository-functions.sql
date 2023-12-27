create or replace function get_watering_sectors
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from setor_rega;
    return c;
end;

create or replace function is_there_sector(sector_name setor_rega.nome%type)
    return number
    is
    sectors              sys_refcursor := get_watering_sectors();
    ID                   SETOR_REGA.id%type;
    name                 setor_rega.nome%type;
    AREA                 setor_rega.area%type;
    max_flow_rate        setor_rega.caudal_maximo%type;
    begin_date           setor_rega.data_inicio%type;
    end_date             setor_rega.data_fim%type;
    dispensing_method_id setor_rega.metodo_dispensasao_id%type;
begin
    loop
        fetch sectors into id, name, area, max_flow_rate, begin_date, end_date, dispensing_method_id;
        if lower(sector_name) = lower(name) then
            return 1;
        end if;
        exit when sectors%notfound;
    end loop;
    return 0;
end;

declare
    output number;
begin
    output:=is_there_sector('Setor 10');
    if output=1 then
        dbms_output.PUT_LINE('setor existe, retorno: '|| output);
    else
        dbms_output.PUT_LINE('setor não existe, retorno: '|| output);
    end if;
end;