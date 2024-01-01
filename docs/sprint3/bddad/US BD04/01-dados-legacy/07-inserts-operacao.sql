

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (101, TO_DATE('06-10-2016', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (101, 102, 92, null, 30);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (102, TO_DATE('10-10-2016', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (102, 102, 89, null, 20);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (103, TO_DATE('07-01-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (103, 104, 41, null, 90);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (104, TO_DATE('08-01-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (104, 104, 37, null, 60);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (105, TO_DATE('08-01-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (105, 104, 48, null, 40);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (113, TO_DATE('04-11-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (113, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (114, TO_DATE('04-11-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (114, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (115, TO_DATE('10-12-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (115, 102, 92, 7, 15, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (115, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (116, TO_DATE('10-12-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (116, 102, 89, 7, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (116, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (117, TO_DATE('07-01-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (117, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (118, TO_DATE('08-01-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (118, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (119, TO_DATE('08-01-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (119, 104, 48, 40, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (120, TO_DATE('10-01-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (120, 107, 94, null, 500);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (121, TO_DATE('11-01-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (121, 107, 95, null, 700);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (122, TO_DATE('06-02-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (122, 104, 41, 7, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (122, 4);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (123, TO_DATE('06-02-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (123, 104, 37, 7, 6, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (123, 4);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (124, TO_DATE('06-02-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (124, 104, 48, 7, 5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (124, 4);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (135, TO_DATE('17-11-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (135, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (136, TO_DATE('17-11-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (136, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (137, TO_DATE('10-12-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, variedade_id, metodo_execucao_id, quantidade)
VALUES (137, 104, 48, null, 30);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (138, TO_DATE('16-12-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (138, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (139, TO_DATE('18-12-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (139, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (140, TO_DATE('07-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (140, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (141, TO_DATE('08-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (141, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (142, TO_DATE('08-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (142, 104, 48, 40, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (143, TO_DATE('20-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (143, 107, 94, null, 2, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (143, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (144, TO_DATE('20-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (144, 107, 95, null, 2.5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (144, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (145, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (145, 104, 41, 7, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (145, 4);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (146, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (146, 104, 37, 7, 5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (146, 4);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (147, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (147, 104, 48, 7, 7, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (147, 4);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (156, TO_DATE('15-11-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (156, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (157, TO_DATE('15-11-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (157, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (158, TO_DATE('16-12-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (158, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (159, TO_DATE('18-12-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (159, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (160, TO_DATE('20-01-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (160, 107, 94, null, 2, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (160, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (161, TO_DATE('20-01-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (161, 107, 95, null, 2.5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (161, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (162, TO_DATE('12-03-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (163, TO_DATE('30-03-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (163, 103, null, 7, 600, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (163, 8);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (164, TO_DATE('05-04-2020', 'dd-mm-yyyy'), null, 1);


INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (167, TO_DATE('02-06-2020', 'dd-mm-yyyy'), null, 1);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (182, TO_DATE('20-09-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (183, TO_DATE('10-10-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (184, TO_DATE('12-10-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (185, TO_DATE('10-11-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (185, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (186, TO_DATE('10-11-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (186, 102, 89, 20, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (188, TO_DATE('05-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (188, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (189, TO_DATE('05-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (189, 104, 41, 50, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (190, TO_DATE('10-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (190, 102, 92, 7, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (190, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (191, TO_DATE('10-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (191, 102, 89, 7, 7, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (191, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (192, TO_DATE('15-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (192, 104, 41, 40, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (193, TO_DATE('15-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (193, 104, 37, 60, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (194, TO_DATE('16-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (194, 107, 94, 500, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (196, TO_DATE('18-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (196, 107, 95, 700, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (198, TO_DATE('20-01-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (198, 107, 94, null, 2, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (198, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (199, TO_DATE('20-01-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (199, 107, 95, null, 2.5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (199, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (200, TO_DATE('10-03-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (201, TO_DATE('14-03-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (201, 103, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (202, TO_DATE('30-03-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (202, 101, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (203, TO_DATE('03-04-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (204, TO_DATE('15-04-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (205, TO_DATE('02-05-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (205, 104, null, null, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (205, 5);


INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (208, TO_DATE('02-06-2021', 'dd-mm-yyyy'), null, 1);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (232, TO_DATE('20-09-2021', 'dd-mm-yyyy'), null, 1);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (234, TO_DATE('03-10-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (235, TO_DATE('06-10-2021', 'dd-mm-yyyy'), null, 1);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (241, TO_DATE('17-11-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (241, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (242, TO_DATE('17-11-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (242, 102, 89, 20, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (243, TO_DATE('28-11-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (243, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (244, TO_DATE('03-12-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (244, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (245, TO_DATE('16-12-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (245, 107, 94, 500, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (246, TO_DATE('18-12-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (246, 104, 37, 60, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (248, TO_DATE('18-12-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (248, 107, 95, 700, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (250, TO_DATE('20-01-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (250, 107, 94, null, 3, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (250, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (251, TO_DATE('20-01-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (251, 107, 95, null, 3.5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (251, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (252, TO_DATE('06-03-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (253, TO_DATE('19-03-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (253, 103, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (254, TO_DATE('05-04-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (254, 101, 80, 1.3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (255, TO_DATE('08-04-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (256, TO_DATE('15-04-2022', 'dd-mm-yyyy'), null, 1);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (258, TO_DATE('13-05-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (258, 104, null, null, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (258, 5);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (260, TO_DATE('30-05-2022', 'dd-mm-yyyy'), null, 1);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (288, TO_DATE('20-09-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (289, TO_DATE('12-10-2022', 'dd-mm-yyyy'), null, 1);


INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (292, TO_DATE('10-11-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (292, 102, 92, 30, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (293, TO_DATE('10-11-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (293, 102, 89, 20, null);



INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (297, TO_DATE('04-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (297, 104, 48, 70, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (298, TO_DATE('07-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (298, 104, 41, 90, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (299, TO_DATE('11-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (299, 102, 92, 7, 15, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (299, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (300, TO_DATE('11-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (300, 102, 89, 7, 10, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (300, 3);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (301, TO_DATE('16-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (301, 107, 94, 500, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (303, TO_DATE('18-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (303, 107, 95, 700, null);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (304, TO_DATE('12-01-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Poda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (304, 104, 37, 60, null);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (306, TO_DATE('20-01-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (306, 107, 94, null, 4, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (306, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (307, TO_DATE('20-01-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, metodo_aplicacao_id, quantidade, area)
VALUES (307, 107, 95, null, 5, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id)
VALUES (307, 1);
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (308, TO_DATE('20-03-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (308, 103, 80, 1.3);