SELECT Fator_Producao.nome,
       Composto_Quimico.nome,
       Ficha_Tecnica.quantidade,
       Operacao_Agricola.data
FROM Fator_Producao
         JOIN
     Ficha_Tecnica ON Fator_Producao.id = Ficha_Tecnica.fator_producao_id
         JOIN
     Composto_Quimico ON Ficha_Tecnica.composto_quimico_id = Composto_Quimico.id
         JOIN
     Aplicacao_FP ON Fator_Producao.id = Aplicacao_FP.fator_producao_id
         JOIN
     Operacao_Agricola ON Aplicacao_FP.operacao_id = Operacao_Agricola.id
         JOIN
     Parcela ON Aplicacao_FP.parcela_id = Parcela.id
WHERE Parcela.id = 105 -- substitua :id_da_parcela pelo ID da parcela desejada
  AND Operacao_Agricola.data BETWEEN TO_DATE('2019-01-04', 'YYYY-MM-DD') AND TO_DATE('2019-01-04', 'YYYY-MM-DD');

create or replace function obterParcelasFP(parcelaId PARCELA.id%type, dataInicio OPERACAO_AGRICOLA.data%type,
                                           dataFim OPERACAO_AGRICOLA.data%type)
    return sys_refcursor
    is
    c sys_refcursor;
begin
    open c for
        SELECT Fator_Producao.nome,
               Composto_Quimico.nome,
               Ficha_Tecnica.quantidade,
               Operacao_Agricola.data
        FROM Fator_Producao
                 JOIN
             Ficha_Tecnica ON Fator_Producao.id = Ficha_Tecnica.fator_producao_id
                 JOIN
             Composto_Quimico ON Ficha_Tecnica.composto_quimico_id = Composto_Quimico.id
                 JOIN
             Aplicacao_FP ON Fator_Producao.id = Aplicacao_FP.fator_producao_id
                 JOIN
             Operacao_Agricola ON Aplicacao_FP.operacao_id = Operacao_Agricola.id
                 JOIN
             Parcela ON Aplicacao_FP.parcela_id = Parcela.id
        WHERE Parcela.id = parcelaId -- substitua :id_da_parcela pelo ID da parcela desejada
          AND Operacao_Agricola.data BETWEEN dataInicio AND dataFim;
    return c;
end;

create or replace procedure imprimirParcelasFP(parcelaId PARCELA.id%type, dataInicio OPERACAO_AGRICOLA.data%type,
                                               dataFim OPERACAO_AGRICOLA.data%type)
    is
    nomeFp     FATOR_PRODUCAO.nome%type;
    nomeCq     COMPOSTO_QUIMICO.nome%type;
    quantidade FICHA_TECNICA.quantidade%type;
    data       OPERACAO_AGRICOLA.data%type;
    c          sys_refcursor := obterParcelasFP(parcelaId, dataInicio, dataFim);
begin
    loop
        fetch c into nomeFp, nomeCq, quantidade, data;
        DBMS_OUTPUT.PUT_LINE('FATOR PRODUÇÃO = ' || nomeFp);
        DBMS_OUTPUT.PUT_LINE('COMPOSTO QUÍMICO = ' || nomeCq);
        DBMS_OUTPUT.PUT_LINE('QUANTIDADE = ' || quantidade);
        DBMS_OUTPUT.PUT_LINE('DATA = ' || data);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
        exit when c%notfound;
    end loop;
end;

declare
    parcelaId  parcela.id%type := 105;
    dataInicio OPERACAO_AGRICOLA.data%type:=TO_DATE('2019-01-04', 'YYYY-MM-DD');
    dataFim    OPERACAO_AGRICOLA.data%type:=TO_DATE('2019-01-04', 'YYYY-MM-DD');
begin
    imprimirParcelasFP(parcelaId, dataInicio, dataFim);
end;
