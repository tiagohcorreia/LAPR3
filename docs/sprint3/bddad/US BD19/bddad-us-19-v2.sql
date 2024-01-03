/* Como Gestor Agrícola, pretendo obter a lista de aplicações de fator de produção aplicados na
   instalação agrícola, incluindo a parcela e cultura (se aplicável), por tipo de fator de produção,
   num dado intervalo de tempo.
 */
create or replace function obterAplicacoesFpDentroDeIntervalo(
    parcela_id parcela.id%type,
    data_Inferior Operacao_agricola.data%TYPE,
    data_Superior Operacao_agricola.data%TYPE,
    tipo_Fp_Id tipo_fp.id%type
)
    return sys_refcursor
    is
    queryCursor sys_refcursor;
begin
    open queryCursor for
        select Operacao_Agricola.data, fator_producao.nome, Variedade.nome
        from Aplicacao_fp,
             FP_APLICADOS,
             APLICACAO_FP_SOLO,
             APLICACAO_FP_VARIEDADE,
             PARCELAS_VARIEDADES_APLICADAS,
             fator_producao,
             tipo_fp,
             Operacao_agricola,
             Parcela,
             Variedade

        where ((APLICACAO_FP.OPERACAO_ID=APLICACAO_FP_SOLO.OPERACAO_ID and
                APLICACAO_FP_SOLO.PARCELA_ID=parcela_id) or

               (APLICACAO_FP.OPERACAO_ID=APLICACAO_FP_VARIEDADE.OPERACAO_ID and
                APLICACAO_FP_VARIEDADE.OPERACAO_ID=PARCELAS_VARIEDADES_APLICADAS.OPERACAO_ID and
                PARCELAS_VARIEDADES_APLICADAS.PARCELA_ID=parcela_id and
                PARCELAS_VARIEDADES_APLICADAS.VARIEDADE_ID=VARIEDADE.ID))

          and APLICACAO_FP.OPERACAO_ID=FP_APLICADOS.OPERACAO_ID
          and FP_APLICADOS.FP_ID = fator_producao.id
          and fator_producao.tipo_id = tipo_Fp_Id
          and Aplicacao_fp.operacao_id = Operacao_agricola.id
          and Operacao_agricola.data between data_Inferior and data_Superior

        order by Operacao_Agricola.data asc;
    return queryCursor;
end;

create or replace procedure imprimirAplicacoesFpDentroDeIntervalo(parcela_id parcela.id%type,
                                                                  dataInferior OPERACAO_AGRICOLA.data%type,
                                                                  dataSuperior OPERACAO_AGRICOLA.data%type,
                                                                  tipoFpId tipo_fp.id%type)
    is
    tipoFpNome    tipo_fp.tipo%type;
    data          operacao_agricola.data%type;
    parcelaNome   parcela.nome%type;
    fpNome        fator_producao.nome%type;
    variedadeNome variedade.nome%type;
    c1            sys_refcursor := obterAplicacoesFpDentroDeIntervalo(parcela_id, dataInferior, dataSuperior, tipoFpId);
begin
    select tipo
    into tipoFpNome
    from tipo_fp tfp
    where tfp.id = tipoFpId;

    select nome
    into parcelanome
    from PARCELA
    where parcela.id = parcela_id;

    dbms_output.put_line('TIPO_FP: ' || tipoFpNome);
    dbms_output.put_line('------------------------------');
    dbms_output.put_line('PARCELA: ' || parcelaNome);
    dbms_output.put_line('------------------------------');

    loop
        fetch c1 into data, fpNome, variedadeNome;
        dbms_output.put_line('DATA_OPERAÇÃO: ' || data);
        dbms_output.put_line('FATOR_PRODUÇÁO: ' || fpNome);
        dbms_output.put_line('VARIEDADE: ' || variedadeNome);
        dbms_output.put_line('------------------------------');
        exit when c1%notfound;
    end loop;
end;

declare
    parcela_id parcela.id%type:= 105;
    tipoFpId     tipo_fp.id%type             := 2;
    dataInferior OPERACAO_AGRICOLA.data%type := to_date('01-01-2019', 'dd-mm-yyyy');
    dataSuperior OPERACAO_AGRICOLA.data%type := to_date('06-07-2023', 'dd-mm-yyyy');
begin
    imprimirAplicacoesFpDentroDeIntervalo(parcela_id, dataInferior, dataSuperior, tipoFpId);
end;