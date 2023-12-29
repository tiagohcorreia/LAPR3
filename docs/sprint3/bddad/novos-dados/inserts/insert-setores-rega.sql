/*
 Setor 10
    Início a 01/05/2017, sem data fim
    Caudal máximo: 2500 l/h
    Parcelas: Campo grande
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (10, NULL, 2500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Galega, 30 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (1, 10, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Oliveira Picual, 20 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (2, 10, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 11
Início a 01/05/2017, sem data fim
Caudal máximo: 1500 l/h
Parcelas: Campo grande
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (11, NULL, 1500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 40, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (3, 11, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 21
Início a 01/05/2017, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro da ponte, Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (21, NULL, 3500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Jonagored, 90 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (4, 21, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Fuji, 60 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (5, 21, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 40 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (6, 21, ?, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 30 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (7, 21, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (8, 21, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 22
Início a 01/05/2019, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (22, NULL, 3500, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (9, 22, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 20, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (10, 22, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (?, 'Macieira Canada', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (?, NULL, NULL, NULL, NULL);
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (11, 22, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (?, 'Macieira Grand Fay', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (?, NULL, NULL, NULL, NULL);
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (12, 22, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (?, 'Macieira Gronho Doce', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (?, NULL, NULL, NULL, NULL);
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (?, ?, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (13, 22, ?, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 41
Início a 01/04/2023, 10/10/2023
Caudal máximo: 2500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (41, NULL, 2500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (?, ?, 1, TO_DATE('05/04/2023', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (14, 41, ?, TO_DATE('05/04/2023', 'DD/MM/YYYY'), TO_DATE('31/05/2023', 'DD/MM/YYYY'));

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (?, ?, 1, TO_DATE('05/07/2023', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (15, 41, ?, TO_DATE('05/07/2023', 'DD/MM/YYYY'), TO_DATE('08/10/2023', 'DD/MM/YYYY'));

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 42
Início a 01/04/2023, 10/10/2023
Caudal máximo: 3500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (42, NULL, 3500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (?, ?);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (?, ?, 1, TO_DATE('06/04/2023', 'DD/MM/YYYY'), NULL);
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (16, 42, ?, TO_DATE('06/04/2023', 'DD/MM/YYYY'), TO_DATE('10/09/2023', 'DD/MM/YYYY'));