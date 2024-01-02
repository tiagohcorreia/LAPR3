create or replace function get_execution_methods
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        select * from METODO_EXECUCAO;
    return c;
end;


create or replace function is_there_execution_method(id METODO_EXECUCAO.id%type)
    return number
    is
    other_id METODO_APLICACAO.id%type;
    cursor c is select id
                from METODO_EXECUCAO;
begin
    open c;
    loop
        fetch c into other_id;
        if other_id = id then
            return 1;
        end if;
        exit when c%notfound;
    end loop;
    close c;
    return 0;
end;