/* Operacoes campo novo */

-- Operacao_Agricola
INSERT INTO Operacao_Agricola(id, data) VALUES (328, TO_DATE('2023-06-14', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (329, TO_DATE('2023-06-28', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (330, TO_DATE('2023-09-15', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (331, TO_DATE('2023-09-25', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (332, TO_DATE('2023-09-18', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (333, TO_DATE('2023-09-22', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (334, TO_DATE('2023-10-05', 'YYYY-MM-DD'));


INSERT INTO Operacao_Agricola(id, data) VALUES (335, TO_DATE('2023-06-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (336, TO_DATE('2023-06-19', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (337, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (338, TO_DATE('2023-07-08', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (339, TO_DATE('2023-07-15', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (340, TO_DATE('2023-07-22', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (341, TO_DATE('2023-07-29', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (342, TO_DATE('2023-08-05', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (343, TO_DATE('2023-08-12', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (344, TO_DATE('2023-08-19', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (345, TO_DATE('2023-08-26', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (346, TO_DATE('2023-08-31', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (347, TO_DATE('2023-09-05', 'YYYY-MM-DD'));

INSERT INTO Operacao_Agricola(id, data) VALUES (348, TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (349, TO_DATE('2023-06-02', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (350, TO_DATE('2023-06-09', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (351, TO_DATE('2023-07-09', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (352, TO_DATE('2023-07-16', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (353, TO_DATE('2023-07-23', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (354, TO_DATE('2023-07-30', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (355, TO_DATE('2023-08-07', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (356, TO_DATE('2023-08-14', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (357, TO_DATE('2023-08-21', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (358, TO_DATE('2023-08-28', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (359, TO_DATE('2023-09-06', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (360, TO_DATE('2023-09-13', 'YYYY-MM-DD'));
INSERT INTO Operacao_Agricola(id, data) VALUES (361, TO_DATE('2023-09-20', 'YYYY-MM-DD'));

-- Colheita
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (328, 108, ?, ?, 8000);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (329, 108, ?, ?, 5000);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (330, 108, ?, ?,900);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (331, 108, ?, ?,1500);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (332, 108, ?, ?, 1200);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (333, 108, ?, ?, 1200);
INSERT INTO Colheita(operacao_id,parcela_id,produto_id,metodo_execucao_id, quantidade) values (334, 108, ?, ?, 1200);

-- Rega
-- Setor 42
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (335, 42, 60, '06:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (336, 42, 60, '06:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (337, 42, 120, '04:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (338, 42, 120, '04:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (339, 42, 120, '04:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (340, 42, 150, '04:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (341, 42, 150, '04:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (342, 42, 120, '21:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (343, 42, 120, '21:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (344, 42, 120, '21:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (345, 42, 120, '21:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (346, 42, 120, '21:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (347, 42, 120, '21:30');

-- Setor 41
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (348, 41, 120, '07:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (349, 41, 120, '07:30');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (350, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (351, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (352, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (353, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (354, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (355, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (356, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (357, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (358, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (359, 41, 120, '06:20');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (360, 41, 120, '07:00');
INSERT INTO Rega(operacao_id, setor_id, duracao, hora) VALUES (361, 41, 120, '07:00');



-- Monda
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id) VALUES (360, 1, 1, 1, 1, 1);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id) VALUES (361, 2, 2, 2, 2, 2);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id) VALUES (362, 3, 3, 3, 3, 3);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id) VALUES (363, 4, 4, 4, 4, 4);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id, fator_producao_id) VALUES (364, 5, 5, 5, 5, 5);

--Semeadura



