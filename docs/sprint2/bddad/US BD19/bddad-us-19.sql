/* Como Gestor Agrícola, pretendo obter a lista de aplicações de fator de produção aplicados na
   instalação agrícola, incluindo a parcela e cultura (se aplicável), por tipo de fator de produção,
   num dado intervalo de tempo.
 */
define or replace funtion obterAplicacoesFpDentroDeIntervalo(
dataInferior Operacao_agricola.data%TYPE,
dataSuperior Operacao_agricola.data%TYPE
)
begin
    select Aplicacao_fp.id, Operacao_Agricola.data, Parcela.nome, Variedade.nome
    from Aplicacao_fp,
         Operacao_agricola,
         Parcela,
         Variedade
    where Aplicacao_fp.parcela_id = Parcela.id
      and Aplicacao_fp.variedade_id = Variedade.id
      and Aplicacao_fp.operacao_id = Operacao_agricola.id
      and Operacao_agricola.data between dataInferior and dataSuperior;
end;