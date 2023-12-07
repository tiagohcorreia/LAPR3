create or replace procedure getMonthlyWateringTotal(parcelaId parcela.id%type,
    beginDate operacao_agricola.data%type,
    endDate operacao_agricola.data%type)
is
    cursor c1 is SELECT EXTRACT(MONTH FROM op_agr.data) as mes, sum(rg.duracao) as totais_rega
    FROM rega rg, operacao_agricola op_agr, setor_rega str, plantacao plt, setorrega_plantacao str_plt
    WHERE parcelaId = plt.parcela_id
    AND plt.id = str_plt.plantacao_id
    AND str.id = str_plt.setor_id
    AND str.id = rg.setor_id
    AND rg.operacao_id = op_agr.id
    AND op_agr.data BETWEEN beginDate and endDate
    GROUP BY EXTRACT(MONTH FROM op_agr.data);

	mes number(2);
	totalRega number(10);
	parcelaNome parcela.nome%type;
begin
	select nome into parcelaNome
    from parcela
    where parcela.id=parcelaId;
	dbms_output.put_line('Parcela: ' || parcelaNome);
	dbms_output.put_line('-----------------------------');
	open c1;
    loop
    fetch c1 into mes, totalRega;
	dbms_output.put_line('Mes: ' || mes);
	dbms_output.put_line('Total de rega: ' || mes);
	dbms_output.put_line('-----------------------------');
	exit when c1%notfound;
	end loop;
	close c1;
end;

begin 
    getMonthlyWateringTotal(108, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
end;