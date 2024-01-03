--USBD20 - Como Gestor Agr´ıcola, pretendo obter os totais de rega mensal de cada
--parcela, num dado intervalo de tempo.

-- Função para obter o total mensal de rega
create or replace function getMonthlyWateringTotal(
    beginDate operacao_agricola.data%type,
    endDate operacao_agricola.data%type)
    return sys_refcursor
    is
    return sys_refcursor; -- Declaração de cursor para armazenar os resultados da consulta
begin
    open return for
        -- Consulta para obter o total de rega mensal
        SELECT distinct parcela.NOME as parcela, EXTRACT(MONTH FROM op_agr.data) as mes, sum(rg.duracao) as totais_rega
        FROM rega rg,
             operacao_agricola op_agr,
             setor_rega str,
             plantacao plt,
             setorrega_plantacao str_plt,
             parcela
        WHERE PARCELA.id = plt.PARCELA_ID
          and plt.id = str_plt.plantacao_id             -- Relacionamento entre plantação e setor de rega
          AND str.id = str_plt.setor_id                 -- Relacionamento entre setor de rega e plantação
          AND str.id = rg.setor_id                      -- Relacionamento entre setor de rega e rega
          AND rg.operacao_id = op_agr.id                -- Relacionamento entre rega e operação agrícola
          AND op_agr.data BETWEEN beginDate and endDate -- Filtrando por intervalo de datas
        GROUP BY parcela.nome, EXTRACT(MONTH FROM op_agr.data)
        order by parcela, mes;

    return return; -- Retorna o cursor contendo os resultados da consulta
end;

-- Procedimento para imprimir o total mensal de rega
create or replace procedure printMonthlyWateringTotal(
    beginDate operacao_agricola.data%type,
    endDate operacao_agricola.data%type)
    is
    c1          sys_refcursor := getMonthlyWateringTotal(beginDate, endDate); -- Chama a função para obter o cursor
    v_parcela   parcela.nome%type;
    mes         number(2);
    totalRega   number(10);
    parcelaNome parcela.nome%type;
begin

    -- Loop para processar os resultados do cursor
    loop
        fetch c1 into v_parcela, mes, totalRega; -- Obtém os resultados do cursor
        dbms_output.put_line('Parcela: ' || v_parcela);
        dbms_output.put_line('Mes: ' || mes);
        dbms_output.put_line('Total de rega: ' || totalRega); -- Imprime o total de rega para o mês
        dbms_output.put_line('-----------------------------');
        exit when c1%notfound; -- Sai do loop quando não há mais resultados
    end loop;
end;

-- Bloco anônimo para chamar o procedimento
begin
    printMonthlyWateringTotal(to_date('01-06-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
end;