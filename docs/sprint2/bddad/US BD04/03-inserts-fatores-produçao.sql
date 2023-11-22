-- tabela Tipo_FP
INSERT INTO Tipo_FP(id, tipo) VALUES (1, 'Fitofármaco');
INSERT INTO Tipo_FP(id, tipo) VALUES (2, 'Adubo');
INSERT INTO Tipo_FP(id, tipo) VALUES (3, 'Corretor');

-- tabela Formulacao_FP
INSERT INTO Formulacao_FP(id, tipo) VALUES (1, 'Pó molhável');
INSERT INTO Formulacao_FP(id, tipo) VALUES (2, 'Granulado');
INSERT INTO Formulacao_FP(id, tipo) VALUES (3, 'Pó');
INSERT INTO Formulacao_FP(id, tipo) VALUES (4, 'Líquido');
INSERT INTO Formulacao_FP(id, tipo) VALUES (5, 'Emulsão de óleo em água');

-- tabela Metodo_Aplicacao
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (1, 'Fungicida');
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (2, 'Adubo solo');
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (3, 'Adubo foliar');
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (4, 'Fertirrega');
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (5, 'Correção solo');
INSERT INTO Metodo_Aplicacao(id, tipo) VALUES (6, 'Insecticida');

-- tabela Composto_Quimico
INSERT INTO Composto_Quimico(id, nome) VALUES (1, 'CU');
INSERT INTO Composto_Quimico(id, nome) VALUES (2, 'S');
INSERT INTO Composto_Quimico(id, nome) VALUES (3, 'K');
INSERT INTO Composto_Quimico(id, nome) VALUES (4, 'Mg');
INSERT INTO Composto_Quimico(id, nome) VALUES (5, 'B');
INSERT INTO Composto_Quimico(id, nome) VALUES (6, 'Mn');
INSERT INTO Composto_Quimico(id, nome) VALUES (7, 'CaCO3');
INSERT INTO Composto_Quimico(id, nome) VALUES (8, 'MgCO3');
INSERT INTO Composto_Quimico(id, nome) VALUES (9, 'MgO');
INSERT INTO Composto_Quimico(id, nome) VALUES (10, 'Bacillus pumilus');
INSERT INTO Composto_Quimico(id, nome) VALUES (11, 'Ácidos gordos (na forma de sais de potássio)');
INSERT INTO Composto_Quimico(id, nome) VALUES (12, 'Terpenóides');
INSERT INTO Composto_Quimico(id, nome) VALUES (13, 'N');
INSERT INTO Composto_Quimico(id, nome) VALUES (14, 'P2O5');
INSERT INTO Composto_Quimico(id, nome) VALUES (15, 'K2O');
INSERT INTO Composto_Quimico(id, nome) VALUES (16, 'Ca');
INSERT INTO Composto_Quimico(id, nome) VALUES (17, 'MgO');

-- tabela Fator_Producao
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (1, 'Calda Bordalesa ASCENZA', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (2, 'Enxofre Bayer 80 WG', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (3, 'Patentkali', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (4, 'ESTA Kieserit', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (5, 'EPSO Microtop', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (6, 'EPSO Top', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (7, 'Biocal CaCo3', 3, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (8, 'Biocal Composto', 3, 3);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (9, 'Sonata', 1, 4);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (10, 'FLiPPER ', 1, 5);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (11, 'Requiem Prime', 1, 4);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (12, 'Fertimax Extrume de Cavalo, da Nutrofertil', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id) VALUES (13, 'BIOFERTIL N6, da Nutrofertil', 2, 2);

-- tabela FP_Metodo_Aplicacao
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (1, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (2, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (3, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (4, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (5, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (6, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (7, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (8, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (9, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (10, 6);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (11, 6);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id) VALUES (5, 4);

-- tabela Ficha_Tecnica
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (1, 1, 0.2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (2, 2, 0.8);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (3, 3, 0.249);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (3, 4, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (3, 2, 0.176);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (4, 4, 0.151);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (4, 2, 0.208);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (5, 4, 0.09);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (5, 2, 0.124);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (5, 5, 0.009);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (5, 6, 0.01);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (6, 4, 0.096);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (6, 2, 0.13);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (7, 7, 0.882);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (7, 8, 0.019);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (8, 7, 0.717);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (8, 8, 0.148);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (8, 9, 0.079);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (9, 10, 0.9774);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (10, 11, 0.478);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (11, 12, 0.1442);

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 14, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 15, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 16, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (12, 5, 0.0000004);

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 14, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 15, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 16, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade) VALUES (13, 5, 0.0000020);