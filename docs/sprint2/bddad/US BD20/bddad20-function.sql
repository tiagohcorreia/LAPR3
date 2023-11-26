
SELECT EXTRACT(MONTH FROM op_agr.data) as mes, sum(rg.duracao) as totais_rega
FROM rega rg, operacao_agricola op_agr, setor_rega str, plantacao plt, setorrega_plantacao str_plt
WHERE 108 = plt.parcela_id
  AND plt.id = str_plt.plantacao_id
  AND str.id = str_plt.setor_id
  AND str.id = rg.setor_id
  AND rg.operacao_id = op_agr.id
  AND op_agr.data BETWEEN TO_DATE('01-06-2023', 'dd-mm-yyyy') and TO_DATE('06-11-2023', 'dd-mm-yyyy')
GROUP BY EXTRACT(MONTH FROM op_agr.data);