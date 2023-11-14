-- tabela Exploracao_Agricola
INSERT INTO Exploracao_Agricola(id, nome) VALUES (1, 'exploraçao teste');

-- tabela Tipo_Edificio
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (1, 'Armazém', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (2, 'Garagem', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (3, 'Moinho', NULL);
INSERT INTO Tipo_Edificio(id, tipo, unidade) VALUES (4, 'Rega', 'm3');

-- tabela Parcela
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (101, 'Campo da bouça', 1.2, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (102, 'Campo grande', 3, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (103, 'Campo do poço', 1.5, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (104, 'Lameiro da ponte', 0.8, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (105, 'Lameiro do moinho', 1.1, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (106, 'Lameiro do moinho', 0.3, 1);
INSERT INTO Parcela(id, nome, area, exploracao_agricola_id) VALUES (107, 'Vinha', 2, 1);

-- tabela Edificio
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (201, 'Espigueiro', 600, 1, 1);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (202, 'Armazém novo', 800, 1, 1);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (203, 'Armazém grande', 900, 1, 2);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (250, 'Moinho', NULL, 1, 3);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (301, 'Tanque do campo grande', 18, 1, 4);
INSERT INTO Edificio(id, nome, dimensao, exploracao_agricola_id, tipo_edificio_id) VALUES (302, 'Poço da bouça', 35, 1, 4);
