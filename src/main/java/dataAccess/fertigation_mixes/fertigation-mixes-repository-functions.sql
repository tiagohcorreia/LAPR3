create or replace function get_fertigation_mixes
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from RECEITA_FERTIRREGA;
    return c;
end;

create or replace function is_there_mix(mix_name RECEITA_FERTIRREGA.nome%type)
    return number
    is
    mixes              sys_refcursor := get_fertigation_mixes();
    ID                   SETOR_REGA.id%type;
    name                 setor_rega.nome%type;
begin
    loop
        fetch mixes into id, name;
        if lower(mix_name) = lower(name) then
            return 1;
        end if;
        exit when mixes%notfound;
    end loop;
    return 0;
end;

declare
    output number;
begin
    output:=is_there_mix('mix1');
    if output=1 then
        dbms_output.PUT_LINE('mix existe, retorno: '|| output);
    else
        dbms_output.PUT_LINE('mix não existe, retorno: '|| output);
    end if;
end;