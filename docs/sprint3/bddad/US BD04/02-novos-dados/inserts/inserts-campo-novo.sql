/* Operacoes campo novo */

-- 01/04/2023 operação de aplicação de fator de produção Biocal Composto, no solo, 1.1 ha, 500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('01/04/2023', 'DD/MM/YYY'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, null, ?, ?, 500, 1.1);


-- 05/04/2023 operação de semeadura de cenouras Sugarsnax Hybrid, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('05/04/2023', 'DD/MM/YYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (?, ?, ?, 1.2, 0.5, null);


-- 06/04/2023 operação de semeadura de abóbora manteiga, 0.6 ha, 1.5 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('06/04/2023', 'DD/MM/YYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (?, ?, ?, 1.5, 0.6, null);

-- 08/05/2023 operação de monda de plantação de cenouras Sugarsnax Hybrid, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('08/05/2023', 'DD/MM/YYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (?, ?, ?, 0.5, null, null);

-- 20/05/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('20/05/2023', 'DD/MM/YYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (?, ?, ?, 0.6, ?, null);

-- 14/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 1500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('14/06/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 1500);

-- 20/06/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('20/06/2023', 'DD/MM/YYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (?, ?, ?, 0.6, ?, null);

-- 28/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 2500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('28/06/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 2500);

-- 03/07/2023 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, 0.5 ha, 1800 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('03/07/2023', 'DD/MM/YYY'));
INSERT INTO Aplicacao_FP(operacao_id, parcela_id, variedade_id, fator_producao_id, metodo_aplicacao_id, quantidade,
                         area)
VALUES (?, ?, null, ?, ?, 1800, 0.5);


-- 04/07/2023 operação de mobilização do solo, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('04/07/2023', 'DD/MM/YYY'));
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (?, ?, 0.5);


-- 05/07/2023 operação de semeadura de cenouras Danvers Half Long, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('05/07/2023', 'DD/MM/YYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (?, ?, ?, 1.2, 0.5, null);

-- 08/08/2023 operação de monda de plantação de cenouras Danvers Half Long, 0.5 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('08/08/2023', 'DD/MM/YYY'));
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id)
VALUES (?, ?, ?, 0.5, ?, null);

-- 15/09/2023 operação de colheita de abóbora manteiga, 8000 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('15/09/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 8000);

-- 25/09/2023 operação de colheita de abóbora manteiga, 5000 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('25/09/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 5000);

-- 18/09/2023 operação de colheita de cenouras Danvers Half Long, 900 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('18/09/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 900);

-- 22/09/2023 operação de colheita de cenouras Danvers Half Long, 1500 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('22/09/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 1500);

-- 05/10/2023 operação de colheita de cenouras Danvers Half Long, 1200 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('05/10/2023', 'DD/MM/YYY'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (?, ?, ?, ?, 1200);

-- 10/10/2023 operação de mobilização do solo, 1.1 ha
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('10/10/2023', 'DD/MM/YYY'));
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (?, ?, 1.1);

-- 12/10/2023 operação de semeadura de Tremoço Amarelo, 1.1 ha, 32 kg
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, TO_DATE('12/10/2023', 'DD/MM/YYY'));
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (?, ?, ?, 32, 1.1, null);


