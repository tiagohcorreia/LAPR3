
/* Operacoes campo grande */

INSERT INTO Operacao_Agricola(id,data) VALUES (309,TO_DATE('2016-10-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (310,TO_DATE('2016-01-13', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (311,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (312,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (313,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (314,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (315,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (316,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (317,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (318,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (319,TO_DATE('2016-01-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (320,TO_DATE('2023-11-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (321,TO_DATE('2023-11-05', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (322,TO_DATE('2023-11-08', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (323,TO_DATE('2023-06-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (324,TO_DATE('2023-07-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (325,TO_DATE('2023-08-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (326,TO_DATE('2023-09-04', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id,data) VALUES (327,TO_DATE('2023-10-02', 'YYYY-MM-DD'));

INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (310, ?); /* colocar id do fator producao BIOFERTIL N6 */
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (311, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (312, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (313, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (314, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (315, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (316, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (317, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (318, ?);
INSERT INTO Aplicacao_FP(operacao_id,fator_producao_id) values (319, ?);

INSERT INTO Op_Plantacao(operacao_id,parcela_id,variedade_perm_id,quantidade) values (309,102,185,40);

INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (320,102,86,400);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (321,102,89,300);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,quantidade) values (322,102,92,350);


INSERT INTO Rega(operacao_id,setor_id,duracao) VALUES (323,10,60);
INSERT INTO Rega(operacao_id,setor_id,duracao) VALUES (324,10,120);
INSERT INTO Rega(operacao_id,setor_id,duracao) VALUES (325,10,180);
INSERT INTO Rega(operacao_id,setor_id,duracao) VALUES (326,10,120);
INSERT INTO Rega(operacao_id,setor_id,duracao) VALUES (327,10,60);
