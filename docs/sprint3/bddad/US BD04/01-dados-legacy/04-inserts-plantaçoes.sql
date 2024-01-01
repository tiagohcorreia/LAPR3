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

INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (11, 92, 6, 7.5, 30, TO_DATE('06/10/2016', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (12, 89, 6, 7.5, 20, TO_DATE('10/10/2016', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (22, 41, 5, 5, 90, TO_DATE('07/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (23, 37, 5, 5, 60, TO_DATE('08/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (24, 48, 5, 5, 40, TO_DATE('08/01/2017', 'dd/mm/yyyy'), null);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id, compasso, distancia_filas, quantidade, data_inicio,
                                 data_fim)
VALUES (25, 48, 5, 5, 30, TO_DATE('10/12/2018', 'dd/mm/yyyy'), null);

INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (1, 80, 1.1, TO_DATE('10/10/2020', 'dd/mm/yyyy'), TO_DATE('30/03/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (2, 83, 0.9, TO_DATE('10/04/2021', 'dd/mm/yyyy'), TO_DATE('12/08/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (3, 80, 1.1, TO_DATE('03/10/2021', 'dd/mm/yyyy'), TO_DATE('05/04/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (4, 83, 0.9, TO_DATE('15/04/2022', 'dd/mm/yyyy'), TO_DATE('21/08/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (5, 82, 1.2, TO_DATE('05/04/2020', 'dd/mm/yyyy'), TO_DATE('20/08/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (6, 80, 1.3, TO_DATE('12/10/2020', 'dd/mm/yyyy'), TO_DATE('15/03/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (7, 82, 1.2, TO_DATE('03/04/2021', 'dd/mm/yyyy'), TO_DATE('25/08/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (8, 80, 1.3, TO_DATE('06/10/2021', 'dd/mm/yyyy'), TO_DATE('19/03/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (9, 82, 1.2, TO_DATE('08/04/2022', 'dd/mm/yyyy'), TO_DATE('18/08/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (10, 80, 1.3, TO_DATE('12/10/2022', 'dd/mm/yyyy'), TO_DATE('20/03/2023', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (13, 79, 0.15, TO_DATE('10/03/2020', 'dd/mm/yyyy'), TO_DATE('15/05/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (14, 78, 0.1, TO_DATE('02/06/2020', 'dd/mm/yyyy'), TO_DATE('08/09/2020', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (15, 93, 0.2, TO_DATE('20/09/2020', 'dd/mm/yyyy'), TO_DATE('10/01/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (16, 77, 0.15, TO_DATE('10/03/2021', 'dd/mm/yyyy'), TO_DATE('15/05/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (17, 75, 0.1, TO_DATE('02/06/2021', 'dd/mm/yyyy'), TO_DATE('08/09/2021', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (18, 93, 0.2, TO_DATE('20/09/2021', 'dd/mm/yyyy'), TO_DATE('10/01/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (19, 77, 0.15, TO_DATE('06/03/2022', 'dd/mm/yyyy'), TO_DATE('16/05/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (20, 78, 0.15, TO_DATE('30/05/2022', 'dd/mm/yyyy'), TO_DATE('05/09/2022', 'dd/mm/yyyy'));
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (21, 84, 0.25, TO_DATE('20/09/2022', 'dd/mm/yyyy'), TO_DATE('14/01/2023', 'dd/mm/yyyy'));

