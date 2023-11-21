--compostos químicos que faltavam em relação ao legacy
INSERT INTO Composto_Quimico(id, nome) VALUES (13, 'N');
INSERT INTO Composto_Quimico(id, nome) VALUES (14, 'P2O5');
INSERT INTO Composto_Quimico(id, nome) VALUES (15, 'K2O');
INSERT INTO Composto_Quimico(id, nome) VALUES (16, 'Ca');
INSERT INTO Composto_Quimico(id, nome) VALUES (17, 'MgO');

--Fatores de procução --tipo_id = 2: Adubo
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (12, 'Fertimax Extrume de Cavalo, da Nutrofertil', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (13, 'BIOFERTIL N6, da Nutrofertil', 2, 2);

--ficha tacnica
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 14, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 15, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 16, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 5, 0.0000004);

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 14, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 15, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 16, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 5, 0.0000020);
