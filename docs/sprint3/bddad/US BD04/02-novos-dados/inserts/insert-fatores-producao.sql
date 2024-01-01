--compostos químicos que faltavam em relação ao legacy

INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'Materia Organica');
INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'N');
INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'P2O5');
INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'K2O');
INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'Ca');
INSERT INTO Composto_Quimico(id, nome)
VALUES (?, 'MgO');

--Fatores de procução --tipo_id = 2: Adubo
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (?, 'Fertimax Extrume de Cavalo, da Nutrofertil', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (?, 'BIOFERTIL N6, da Nutrofertil', 2, 2);

INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (?, ?);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (?, ?);


--ficha tecnica Fertimax Extrume de Cavalo
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.0000004);

--ficha tecnica BIOFERTIL N6
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (?, ?, 0.0000020);

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