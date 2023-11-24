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
