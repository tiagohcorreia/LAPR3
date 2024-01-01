-- tabela Tipo_FP
INSERT INTO Tipo_FP(id, tipo)
VALUES (1, 'Fitofármaco');
INSERT INTO Tipo_FP(id, tipo)
VALUES (2, 'Adubo');
INSERT INTO Tipo_FP(id, tipo)
VALUES (3, 'Corretor');

-- tabela Formulacao_FP
INSERT INTO Formulacao_FP(id, tipo)
VALUES (1, 'Pó molhável');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (2, 'Granulado');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (3, 'Pó');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (4, 'Líquido');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (5, 'Emulsão de óleo em água');

-- tabela Metodo_Aplicacao
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (1, 'Fungicida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (2, 'Adubo solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (3, 'Adubo foliar');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (4, 'Fertirrega');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (5, 'Correção solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (6, 'Insecticida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (7, 'Solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (8, 'Foliar');


-- tabela Composto_Quimico
INSERT INTO Composto_Quimico(id, nome)
VALUES (1, 'CU');
INSERT INTO Composto_Quimico(id, nome)
VALUES (2, 'S');
INSERT INTO Composto_Quimico(id, nome)
VALUES (3, 'K');
INSERT INTO Composto_Quimico(id, nome)
VALUES (4, 'Mg');
INSERT INTO Composto_Quimico(id, nome)
VALUES (5, 'B');
INSERT INTO Composto_Quimico(id, nome)
VALUES (6, 'Mn');
INSERT INTO Composto_Quimico(id, nome)
VALUES (7, 'CaCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (8, 'MgCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (9, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (10, 'Bacillus pumilus');
INSERT INTO Composto_Quimico(id, nome)
VALUES (11, 'Ácidos gordos (na forma de sais de potássio)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (12, 'Terpenóides');

-- tabela Fator_Producao
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (1, 'Calda Bordalesa ASCENZA', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (2, 'Enxofre Bayer 80 WG', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (3, 'Patentkali', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (4, 'ESTA Kieserit', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (5, 'EPSO Microtop', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (6, 'EPSO Top', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (7, 'Biocal CaCo3', 3, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (8, 'Biocal Composto', 3, 3);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (9, 'Sonata', 1, 4);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (10, 'FLiPPER ', 1, 5);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (11, 'Requiem Prime', 1, 4);

-- tabela FP_Metodo_Aplicacao
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (1, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (2, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (3, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (4, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 4);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (6, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (7, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (8, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (9, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (10, 6);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (11, 6);


-- tabela Ficha_Tecnica
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (1, 1, 0.2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (2, 2, 0.8);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 3, 0.249);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 4, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 2, 0.176);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 4, 0.151);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 2, 0.208);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 4, 0.09);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 2, 0.124);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 5, 0.009);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 6, 0.01);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 4, 0.096);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 2, 0.13);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 7, 0.882);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 8, 0.019);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 7, 0.717);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 8, 0.148);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 9, 0.079);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (9, 10, 0.9774);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (10, 11, 0.478);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (11, 12, 0.1442);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

--compostos químicos que faltavam em relação ao legacy
INSERT INTO Composto_Quimico(id, nome)
VALUES (13, 'N');
INSERT INTO Composto_Quimico(id, nome)
VALUES (14, 'P2O5');
INSERT INTO Composto_Quimico(id, nome)
VALUES (15, 'K2O');
INSERT INTO Composto_Quimico(id, nome)
VALUES (16, 'Ca');
INSERT INTO Composto_Quimico(id, nome)
VALUES (17, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (18, 'Materia Organica');

--Fatores de procução --tipo_id = 2: Adubo
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (12, 'Fertimax Extrume de Cavalo', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (13, 'BIOFERTIL N6', 2, 2);

INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (12, 7);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (13, 7);

--ficha tecnica Fertimax Extrume de Cavalo
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 18, 0.5);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 14, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 15, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 16, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 5, 0.00004);

--ficha tecnica BIOFERTIL N6
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 18, 0.53);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 14, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 15, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 16, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 5, 0.000020);

--Matéria Orgânica Líquida, Tecniferti MOL, da Tecniferti, líquido, Matéria Orgânica 27%, Azoto (N) 3,6%, Azoto orgânico (N) 2%,
-- Fósforo total (P2O5) 1%, Potássio total (K2O) 3%, Carbono Orgânico Total (COT) 15%, Ácidos Fúlvicos (AF) 10%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (14, 'Tecniferti MOL', 4, 4);

insert into TIPO_FP(id, tipo)
values (4, 'Matéria Orgânica Líquida');

INSERT INTO Composto_Quimico(id, nome)
VALUES (19, 'Azoto orgânico (N)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (20, 'Carbono Orgânico Total (COT)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (21, 'Ácidos Fúlvicos (AF)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 4, 27);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 13, 3.6);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 19, 2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 14, 1);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 15, 1);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 20, 15);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 21, 10);


--Adubo orgânico, soluSOP 52, da K+S, pó molhavel, Enxofre (SO3) 45%, Potássio total (K2O) 52,5%, pH 7
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (15, 'soluSOP 52', 5, 1);

insert into TIPO_FP(id, tipo)
values (5, 'Adubo orgânico');

INSERT INTO Composto_Quimico(id, nome)
VALUES (22, 'Enxofre (SO3)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (15, 22, 45);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (15, 15, 52.5);


--Adubo líquido, Floracal Flow SL, da Plymag, líquido, pH 7.8, densidade 1,6 kg/l, Óxido de calcio (CaO) 35%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (16, 'Floracal Flow SL', 6, 4);

insert into TIPO_FP(id, tipo)
values (6, 'Adubo líquido');

INSERT INTO Composto_Quimico(id, nome)
VALUES (23, 'Óxido de calcio (CaO)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (16, 23, 35);


--Adubo líquido, Kiplant AllGrip, da Asfertglobal, líquido
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (17, 'Kiplant AllGrip', 6, 4);


--Adubo líquido, Cuperdem, da Asfertglobal, líquido, Cobre (Cu) 6%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (18, 'Cuperdem', 6, 4);

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (18, 1, 6);