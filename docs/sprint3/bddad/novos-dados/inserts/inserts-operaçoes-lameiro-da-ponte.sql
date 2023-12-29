-- 14/05/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('14-05-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '07:00');

--01/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('01-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '07:00');

--15/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('15-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '07:00');

--30/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('30-06-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '07:00');

--07/07/2023 operação de rega, setor 21, 180 min, 07:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('07-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 180, '07:00');

--14/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('14-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 180, '22:00');

--21/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('21-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 180, '22:00');

--28/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('28-07-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 180, '22:00');

--04/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('04-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 150, '22:00');

--11/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('11-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 150, '22:00');

--18/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('19-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 150, '22:00');

--25/08/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('25-08-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '22:00');

--01/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('01-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '22:00');

--08/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('08-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '22:00');

--15/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('15-09-2023', 'dd-mm-yyyy'));
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (?, 21, 120, '22:00');

--18/08/2023 operação de colheita de maçã Royal Gala, 700 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('18-08-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 700);


--30/08/2023 operação de colheita de maçã Royal Gala, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('30-08-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 900);

--05/09/2023 operação de colheita de maçã Jonagored, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('05-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 900);

--08/09/2023 operação de colheita de maçã Jonagored, 1050 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('08-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 1050);

--28/09/2023 operação de colheita de maçã Fuji, 950 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('28-09-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 950);

--03/10/2023 operação de colheita de maçã Fuji, 800 kgº
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data)
VALUES (?, to_date('03-10-2023', 'dd-mm-yyyy'));
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (?, ?, ?, null, 800);

