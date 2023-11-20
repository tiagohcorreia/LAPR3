INSERT INTO Cultura(id, nome_comum, nome_cientifico) VALUES (1, 'Cultura1', 'NULL');

INSERT INTO Variedade(id, nome, cultura_id) VALUES (1, 'Variedade1', 1);

INSERT INTO Parcela(id, nome, area) VALUES (1, 'Campo Novo', 1.1);

INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita) VALUES (1, NULL, NULL);

INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita) VALUES (1, NULL, NULL, NULL, NULL);

INSERT INTO Plantacao(id, parcela_id) VALUES (101, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (102, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (103, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (104, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (105, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (106, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (107, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (108, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (109, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (110, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (111, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (112, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (113, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (114, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (115, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (116, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (117, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (118, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (119, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (120, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (121, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (122, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (123, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (124, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (125, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (126, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (127, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (128, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (129, 1);
INSERT INTO Plantacao(id, parcela_id) VALUES (130, 1);

INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (101,  1,  10, TO_DATE('10/10/2020', 'MM/DD/YYYY'), TO_DATE('03/30/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (102,  1,  10, TO_DATE('04/10/2021', 'MM/DD/YYYY'), TO_DATE('08/12/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (103,  1,  10, TO_DATE('10/03/2021', 'MM/DD/YYYY'), TO_DATE('04/05/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (104,  1,  10, TO_DATE('04/15/2022', 'MM/DD/YYYY'), TO_DATE('08/21/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (105,  1,  10, TO_DATE('04/05/2020', 'MM/DD/YYYY'), TO_DATE('08/20/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (106,  1,  10, TO_DATE('10/12/2020', 'MM/DD/YYYY'), TO_DATE('03/15/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (107,  1,  10, TO_DATE('04/03/2021', 'MM/DD/YYYY'), TO_DATE('08/25/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (108,  1,  10, TO_DATE('10/06/2021', 'MM/DD/YYYY'), TO_DATE('03/19/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (109,  1,  10, TO_DATE('04/08/2022', 'MM/DD/YYYY'), TO_DATE('08/18/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (110,  1,  10, TO_DATE('10/12/2022', 'MM/DD/YYYY'), TO_DATE('03/20/2023', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (111, 1, 30,  TO_DATE('10/06/2016', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (112, 1, 20,  TO_DATE('10/10/2016', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (113,  1,  10, TO_DATE('03/10/2020', 'MM/DD/YYYY'), TO_DATE('05/15/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (114,  1,  10, TO_DATE('06/02/2020', 'MM/DD/YYYY'), TO_DATE('09/08/2020', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (115,  1,  10, TO_DATE('09/20/2020', 'MM/DD/YYYY'), TO_DATE('01/10/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (116,  1,  10, TO_DATE('03/10/2021', 'MM/DD/YYYY'), TO_DATE('05/15/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (117,  1,  10, TO_DATE('06/02/2021', 'MM/DD/YYYY'), TO_DATE('09/08/2021', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (118,  1,  10, TO_DATE('09/20/2021', 'MM/DD/YYYY'), TO_DATE('01/10/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (119,  1,  10, TO_DATE('03/06/2022', 'MM/DD/YYYY'), TO_DATE('05/16/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (120,  1,  10, TO_DATE('05/30/2022', 'MM/DD/YYYY'), TO_DATE('09/05/2022', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Temporaria(plantacao_id,  variedade_temp_id, area, data_início, data_fim) VALUES (121,  1,  10, TO_DATE('09/20/2022', 'MM/DD/YYYY'), TO_DATE('01/14/2023', 'MM/DD/YYYY'));
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (122, 1, 90,  TO_DATE('01/07/2017', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (123, 1, 60,  TO_DATE('01/08/2017', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (124, 1, 40,  TO_DATE('01/08/2017', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (125, 1, 30,  TO_DATE('12/10/2018', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (126, 1, 500,  TO_DATE('01/10/2018', 'MM/DD/YYYY'), NULL);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, quantidade, data_inicio, data_fim) VALUES (127, 1, 700,  TO_DATE('01/11/2018', 'MM/DD/YYYY'), NULL);




