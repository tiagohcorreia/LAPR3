
-- ** USBD24 Como Gestor Agrícola, pretendo que todos os registos relacionados com operações tenham registado o instante em que foram criados, gerado pelo SGBD.

/*
 PRIMEIRO VERIFICAR O ESTADO DA TABELA OPERAÇÃO AGRICOLA, DE SEGUIDA FAZER OS INSERTS E VERIFICAR QUE OS INSTANTES FORAM REGISTADOS
 */

select id, INSTANTE_REGISTO
from OPERACAO_AGRICOLA;

declare
    v_parcela    parcela.id%type             := 105;
    v_variedade  variedade.id%type           := 44;
    v_quantidade monda.quantidade%type       := 10;
    v_metodo     METODO_EXECUCAO.id%type     := 1;
    v_data       OPERACAO_AGRICOLA.data%type := to_date('10-10-2020', 'dd-mm-yyyy');
    v_produto    produto.id%type             := 10;
    tmp          number;
begin
    tmp := REGISTAR_MONDA(v_parcela, v_variedade, v_quantidade, v_metodo, v_data);
    tmp := REGISTAR_PODA(v_parcela, v_variedade, v_data, v_quantidade, v_metodo);
    tmp := registar_colheita(v_data, v_parcela, v_produto, v_quantidade, v_metodo);
end;