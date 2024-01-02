-- 17/06/2023 operação de rega, setor 10, 30 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (450, to_date('17/06/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (450, 10, 30, '05:00');

-- 17/07/2023 operação de rega, setor 10, 30 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (451, to_date('17/07/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (451, 10, 30, '05:00');

-- 17/08/2023 operação de rega, setor 10, 60 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (452, to_date('17/08/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (452, 10, 60, '05:00');

-- 18/09/2023 operação de rega, setor 10, 30 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (453, to_date('18/09/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (453, 10, 30, '05:00');

-- 13/05/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (370, TO_DATE('13/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (370, 22, 120, '23:00');

-- 02/06/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (371, TO_DATE('02/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (371, 22, 120, '23:00');

-- 16/06/2023 operação de fertirrega, setor 22, 120 min, 23:00, receita 10
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (372, TO_DATE('16/06/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (372, 22, 120, '23:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (372);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (372, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (372, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (372, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (372, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (372, 105, 44);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (372, 105, 56);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (372, 105, 97);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (372, 105, 98);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (372, 105, 57);

-- 01/07/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (373, TO_DATE('01/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (373, 22, 120, '23:00');

-- 08/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (375, TO_DATE('08/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (375, 22, 180, '23:00');

-- 15/07/2023 operação de fertirrega, setor 22, 180 min, 23:00, receita 11
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (376, TO_DATE('15/07/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (376, 22, 180, '23:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (376);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (376, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (376, 14);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (376, 17);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (376, 105, 44);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (376, 105, 56);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (376, 105, 97);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (376, 105, 98);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (376, 105, 57);

-- 22/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (377, TO_DATE('22/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (377, 22, 180, '23:00');

-- 29/07/2023 operação de rega, setor 22, 180 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (378, TO_DATE('29/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (378, 22, 180, '23:00');

-- 05/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (379, TO_DATE('05/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (379, 22, 150, '23:00');

-- 10/08/2023 operação de fertirrega, setor 22, 150 min, 23:00, receita 10
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (380, TO_DATE('10/08/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (380, 22, 150, '23:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (380);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (380, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (380, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (380, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (380, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (380, 105, 44);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (380, 105, 56);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (380, 105, 97);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (380, 105, 98);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (380, 105, 57);

-- 17/08/2023 operação de rega, setor 22, 150 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (381, TO_DATE('17/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (381, 22, 150, '23:00');

-- 24/08/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (382, TO_DATE('24/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (382, 22, 120, '23:00');

-- 02/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (383, TO_DATE('02/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (383, 22, 120, '23:00');

-- 09/09/2023 operação de fertirrega, setor 22, 120 min, 23:00, receita 10
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (384, TO_DATE('09/09/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (384, 22, 120, '23:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (384);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (384, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (384, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (384, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (384, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (384, 105, 44);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (384, 105, 56);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (384, 105, 97);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (384, 105, 98);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (384, 105, 57);

-- 18/09/2023 operação de rega, setor 22, 120 min, 23:00
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (385, TO_DATE('18/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (385, 22, 120, '23:00');


--02/06/2023 operação de fertirrega, setor 10, 60 min, 06:00, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (399, TO_DATE('2023-06-02', 'YYYY-MM-DD'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (399, 10, 60, '06:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (399);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (399, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (399, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (399, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (399, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (399, 102, 92);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (399, 102, 89);


-- 02/07/2023 operação de fertirrega, setor 10, 120 min, 06:00, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (400, TO_DATE('2023-07-02', 'YYYY-MM-DD'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (400, 10, 120, '06:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (400);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (400, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (400, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (400, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (400, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (400, 102, 92);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (400, 102, 89);


-- 02/08/2023 operação de fertirrega, setor 10, 180 min, 05:00, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (401, TO_DATE('2023-08-02', 'YYYY-MM-DD'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (401, 10, 180, '05:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (401);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (401, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (401, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (401, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (401, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (401, 102, 92);
INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (401, 102, 89);

-- 04/09/2023 operação de rega, setor 10, 120 min, 06:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (402, TO_DATE('2023-09-04', 'YYYY-MM-DD'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (402, 10, 120, '06:00');

-- 02/10/2023 operação de rega, setor 10, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (403, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (403, 10, 60, '06:00');


-- 12/06/2023 operação de rega, setor 42, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (423, TO_DATE('12/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (423, 42, 60, '06:00');

-- 19/06/2023 operação de rega, setor 42, 60 min, 06:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (424, TO_DATE('19/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (424, 42, 60, '06:00');

-- 30/06/2023 operação de fertirrega, setor 42, 120 min, 04:00, receita 11
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (425, TO_DATE('30/06/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (425, 42, 120, '04:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (425);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (425, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (425, 14);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (425, 17);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (425, 108, 96);

-- 08/07/2023 operação de rega, setor 42, 120 min, 04:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (426, TO_DATE('08/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (426, 42, 120, '04:00');

-- 15/07/2023 operação de fertirrega, setor 42, 120 min, 04:00, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (427, TO_DATE('15/07/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (427, 42, 120, '04:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (427);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (427, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (427, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (427, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (427, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (427, 108, 96);

-- 22/07/2023 operação de rega, setor 42, 150 min, 04:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (428, TO_DATE('22/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (428, 42, 150, '04:00');

-- 29/07/2023 operação de fertirrega, setor 42, 150 min, 04:00, receita 11
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (429, TO_DATE('29/07/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (429, 42, 150, '04:00');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (429);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (429, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (429, 14);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (429, 17);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (429, 108, 96);

-- 05/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (430, TO_DATE('05/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (430, 42, 120, '21:30');

-- 12/08/2023 operação de fertirrega, setor 42, 120 min, 21:30, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (431, TO_DATE('12/08/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (431, 42, 120, '21:30');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (431);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (431, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (431, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (431, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (431, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (431, 108, 96);

-- 19/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (432, TO_DATE('19/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (432, 42, 120, '21:30');

-- 26/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (433, TO_DATE('26/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (433, 42, 120, '21:30');

-- 31/08/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (434, TO_DATE('31/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (434, 42, 120, '21:30');

-- 05/09/2023 operação de rega, setor 42, 120 min, 21:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (435, TO_DATE('05/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (435, 42, 120, '21:30');


-- 20/05/2023 operação de fertirrega, setor 41, 120 min, 07:30, receita 11
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (436, TO_DATE('20/05/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (436, 41, 120, '07.30');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (436);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (436, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (436, 14);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (436, 17);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (436, 108, 77);

-- 02/06/2023 operação de rega, setor 41, 120 min, 07:30
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (437, TO_DATE('02/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (437, 41, 120, '07.30');

-- 09/06/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (438, TO_DATE('09/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (438, 41, 120, '06:20');

-- 09/07/2023 operação de fertirrega, setor 41, 120 min, 06:20, receita 10
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (439, TO_DATE('09/07/2023', 'DD/MM/YYYY'), 1);

INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (439, 41, 120, '06:20');

INSERT INTO Aplicacao_FP(Operacao_id)
VALUES (439);

INSERT INTO APLICACAO_FP_VARIEDADE(Operacao_id, Metodo_Aplicacao_id)
VALUES (439, 4);

INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (439, 6);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (439, 15);
INSERT INTO FP_APLICADOS(Operacao_id, fp_id)
VALUES (439, 16);

INSERT INTO Parcelas_Variedades_Aplicadas(Operacao_id, Parcela_id, Variedade_id)
VALUES (439, 108, 75);

-- 16/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (440, TO_DATE('16/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (440, 41, 120, '06:20');

-- 23/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (441, TO_DATE('23/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (441, 41, 120, '06:20');

-- 30/07/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (442, TO_DATE('30/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (442, 41, 120, '06:20');

-- 07/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (443, TO_DATE('07/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (443, 41, 120, '06:20');

-- 14/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (444, TO_DATE('14/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (444, 41, 120, '06:20');

-- 21/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (445, TO_DATE('21/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (445, 41, 120, '06:20');

-- 28/08/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (446, TO_DATE('28/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (446, 41, 120, '06:20');

-- 06/09/2023 operação de rega, setor 41, 120 min, 06:20
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (447, TO_DATE('06/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (447, 41, 120, '06:20');

-- 13/09/2023 operação de rega, setor 41, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (448, TO_DATE('13/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (448, 41, 120, '07:00');

-- 20/09/2023 operação de rega, setor 41, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (449, TO_DATE('20/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (449, 41, 120, '07:00');