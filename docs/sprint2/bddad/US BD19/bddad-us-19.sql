/* Como Gestor Agrícola, pretendo obter a lista de aplicações de fator de produção aplicados na
   instalação agrícola, incluindo a parcela e cultura (se aplicável), por tipo de fator de produção,
   num dado intervalo de tempo.
 */
create or replace function obterAplicacoesFpDentroDeIntervalo(
    dataInferior Operacao_agricola.data%TYPE,
    dataSuperior Operacao_agricola.data%TYPE
)

    return sys_refcursor
    is queryCursor sys_refcursor;
begin
    open queryCursor for
        select Operacao_Agricola.data, Parcela.nome, fator_producao.nome, Variedade.nome
        from Aplicacao_fp,
             fator_producao,
             tipo_fp,
             Operacao_agricola,
             Parcela,
             Variedade
        where Aplicacao_fp.parcela_id = Parcela.id
          and aplicacao_fp.fator_producao_id=fator_producao.id
          and fator_producao.tipo_id=2
          and Aplicacao_fp.variedade_id = Variedade.id
          and Aplicacao_fp.operacao_id = Operacao_agricola.id
          and Operacao_agricola.data between dataInferior and dataSuperior;
    return queryCursor;
end;