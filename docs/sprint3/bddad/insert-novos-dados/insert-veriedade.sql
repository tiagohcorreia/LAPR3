-- Abóbora manteiga, designada por Cucurbita moschata var 'Butternut'
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
VALUES (?, 'Abóbora', 'Cucurbita');
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (?, 'Abóbora manteiga', ?);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (?, null, null);

