-- tabela Tipo_Edificio
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (1, 'Armazém', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (2, 'Garagem', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (3, 'Moinho', NULL);
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (4, 'Rega', 'm3');

-- tabela Parcela
INSERT INTO Parcela(id, nome, area)
VALUES (101, 'Campo da bouça', 1.2);
INSERT INTO Parcela(id, nome, area)
VALUES (102, 'Campo grande', 3);
INSERT INTO Parcela(id, nome, area)
VALUES (103, 'Campo do poço', 1.5);
INSERT INTO Parcela(id, nome, area)
VALUES (104, 'Lameiro da ponte', 0.8);
INSERT INTO Parcela(id, nome, area)
VALUES (105, 'Lameiro do moinho', 1.1);
INSERT INTO Parcela(id, nome, area)
VALUES (106, 'Horta Nova', 0.3);
INSERT INTO Parcela(id, nome, area)
VALUES (107, 'Vinha', 2);

-- tabela Edificio
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (201, 'Espigueiro', 600, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (202, 'Armazém novo', 800, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (203, 'Armazém grande', 900, 2);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (250, 'Moinho', NULL, 3);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (301, 'Tanque do campo grande', 18, 4);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (302, 'Poço da bouça', 35, 4);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Em 01/12/2022, Campo Novo, 1.1 ha
INSERT INTO Parcela(id, nome, area)
VALUES (108, 'Campo Novo', 1.1);