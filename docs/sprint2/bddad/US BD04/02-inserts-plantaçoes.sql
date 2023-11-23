/*INSERT INTO Cultura(id, nome_comum, nome_cientifico) VALUES (1, 'Cultura1', 'NULL');

INSERT INTO Variedade(id, nome, cultura_id) VALUES (1, 'Variedade1', 1);

INSERT INTO Parcela(id, nome, area) VALUES (1, 'Campo Novo', 1.1);

INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita) VALUES (1, NULL, NULL);

INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita) VALUES (1, NULL, NULL, NULL, NULL);
*/

INSERT INTO Plantacao(id, parcela_id)
VALUES (1, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (2, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (3, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (4, 101);
INSERT INTO Plantacao(id, parcela_id)
VALUES (5, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (6, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (7, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (8, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (9, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (10, 103);
INSERT INTO Plantacao(id, parcela_id)
VALUES (11, 102);
INSERT INTO Plantacao(id, parcela_id)
VALUES (12, 102);
INSERT INTO Plantacao(id, parcela_id)
VALUES (13, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (14, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (15, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (16, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (17, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (18, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (19, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (20, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (21, 106);
INSERT INTO Plantacao(id, parcela_id)
VALUES (22, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (23, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (24, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (25, 104);
INSERT INTO Plantacao(id, parcela_id)
VALUES (26, 107);
INSERT INTO Plantacao(id, parcela_id)
VALUES (27, 107);

INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (11, 92, 30, TO_DATE('2016/10/06', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (12, 89, 20, TO_DATE('2016/10/10', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (22, 41, 90, TO_DATE('2017/01/07', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (23, 37, 60, TO_DATE('2017/01/08', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (24, 48, 40, TO_DATE('2017/01/08', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (25, 48, 30, TO_DATE('2018/12/10', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (26, 94, 500, TO_DATE('2018/01/10', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (27, 95, 700, TO_DATE('2018/01/11', 'YYYY/MM/DD'), TO_DATE('1900/01/00', 'YYYY/MM/DD'));

INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (1, 80, 1.1, TO_DATE('10/10/2020', 'MM/DD/YYYY'), TO_DATE('03/30/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (2, 83, 0.9, TO_DATE('04/10/2021', 'MM/DD/YYYY'), TO_DATE('08/12/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (3, 80, 1.1, TO_DATE('10/03/2021', 'MM/DD/YYYY'), TO_DATE('04/05/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (4, 83, 0.9, TO_DATE('04/15/2022', 'MM/DD/YYYY'), TO_DATE('08/21/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (5, 82, 1.2, TO_DATE('04/05/2020', 'MM/DD/YYYY'), TO_DATE('08/20/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (6, 80, 1.3, TO_DATE('10/12/2020', 'MM/DD/YYYY'), TO_DATE('03/15/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (7, 82, 1.2, TO_DATE('04/03/2021', 'MM/DD/YYYY'), TO_DATE('08/25/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (8, 80, 1.3, TO_DATE('10/06/2021', 'MM/DD/YYYY'), TO_DATE('03/19/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (9, 82, 1.2, TO_DATE('04/08/2022', 'MM/DD/YYYY'), TO_DATE('08/18/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (10, 80, 1.3, TO_DATE('10/12/2022', 'MM/DD/YYYY'), TO_DATE('03/20/2023', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (13, 79, 0.15, TO_DATE('03/10/2020', 'MM/DD/YYYY'), TO_DATE('05/15/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (14, 78, 0.1, TO_DATE('06/02/2020', 'MM/DD/YYYY'), TO_DATE('09/08/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (15, 93, 0.2, TO_DATE('09/20/2020', 'MM/DD/YYYY'), TO_DATE('01/10/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (16, 77, 0.15, TO_DATE('03/10/2021', 'MM/DD/YYYY'), TO_DATE('05/15/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (17, 75, 0.1, TO_DATE('06/02/2021', 'MM/DD/YYYY'), TO_DATE('09/08/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (18, 93, 0.2, TO_DATE('09/20/2021', 'MM/DD/YYYY'), TO_DATE('01/10/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (19, 77, 0.15, TO_DATE('03/06/2022', 'MM/DD/YYYY'), TO_DATE('05/16/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (20, 78, 0.15, TO_DATE('05/30/2022', 'MM/DD/YYYY'), TO_DATE('09/05/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (21, 84, 0.25, TO_DATE('09/20/2022', 'MM/DD/YYYY'), TO_DATE('01/14/2023', 'MM/DD/YYYY'));

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
-- inserir em Campo Grande
INSERT INTO Plantacao(id, parcela_id)
VALUES (27, 102);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (27, 86, 40, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (28, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (28, 61, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (29, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (29, 44, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (30, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (30, 56, 20, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (31, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (31, 97, 30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (32, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (32, 98, 40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (33, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim)
VALUES (33, 99, 50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (34, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (34, 77, 1, TO_DATE('05/04/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (35, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (35, 75, 1, TO_DATE('05/07/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (36, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (36, 96, 1, TO_DATE('06/04/2023', 'DD/MM/YYYY'), NULL);