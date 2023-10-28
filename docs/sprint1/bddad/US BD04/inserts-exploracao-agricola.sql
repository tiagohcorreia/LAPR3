-- tabela Exploracao_Agricola
INSERT INTO Exploracao_Agricola(id, nome) VALUES (101, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (102, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (103, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (104, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (105, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (106, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (107, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (201, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (202, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (203, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (250, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (301, '...');
INSERT INTO Exploracao_Agricola(id, nome) VALUES (302, '...');

-- tabela Tipo_Edificio
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (1, 'Armazém', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (2, 'Garagem', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (3, 'Moinho', NULL);
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (4, 'Rega', 'm3');

-- tabela Edificio
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (8, 'Espigueiro', 600, 201, 1);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (9, 'Armazém novo', 800, 202, 1);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (10, 'Armazém grande', 900, 203, 2);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (11, 'Moinho', NULL, 250, 3);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (12, 'Tanque do campo grande', 18, 301, 4);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edifício_id) VALUES (13, 'Poço da bouça', 35, 302, 4);

-- tabela Parcela
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (1, 'Campo da bouça', 1.2, 101);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (2, 'Campo grande', 3, 102);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (3, 'Campo do poço', 1.5, 103);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (4, 'Lameiro da ponte', 0.8, 104);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (5, 'Lameiro do moinho', 1.1, 105);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (6, 'Lameiro do moinho', 0.3, 106);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (7, 'Vinha', 2, 107);
