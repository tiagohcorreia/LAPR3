-- tabela Tipo_Edificio
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (1, 'Armazém', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (2, 'Garagem', 'm2');
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (3, 'Moinho', NULL);
INSERT INTO Tipo_Edificio(id, tipo, unidade)
VALUES (4, 'Rega', 'm3');

-- tabela Parcela
INSERT INTO Parcela(id, nome, area)
VALUES (101, 'Campo da bouça', 1.2);
INSERT INTO Parcela(id, nome, area)
VALUES (102, 'Campo grande', 3);
INSERT INTO Parcela(id, nome, area)
VALUES (103, 'Campo do poço', 1.5);
INSERT INTO Parcela(id, nome, area)
VALUES (104, 'Lameiro da ponte', 0.8);
INSERT INTO Parcela(id, nome, area)
VALUES (105, 'Lameiro do moinho', 1.1);
INSERT INTO Parcela(id, nome, area)
VALUES (106, 'Horta Nova', 0.3);
INSERT INTO Parcela(id, nome, area)
VALUES (107, 'Vinha', 2);

-- tabela Edificio
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (201, 'Espigueiro', 600, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (202, 'Armazém novo', 800, 1);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (203, 'Armazém grande', 900, 2);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (250, 'Moinho', NULL, 3);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (301, 'Tanque do campo grande', 18, 4);
INSERT INTO Edificio(id, nome, dimensao, tipo_edificio_id)
VALUES (302, 'Poço da bouça', 35, 4);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Em 01/12/2022, Campo Novo, 1.1 ha
INSERT INTO Parcela(id, nome, area)
VALUES (108, 'Campo Novo', 1.1);

-- DADOS LEGACY

INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (1, 'Ameixoeira', 'Prunus domestica');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (2, 'Damasqueiro', 'Prunus armeniaca');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (3, 'Macieira', 'Malus domestica');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (4, 'Pera Nashi', 'Pyrus pyrifolia');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (5, 'Cenoura', 'Daucus carota subsp. Sativus');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (6, 'Tremoço', 'Lupinus luteus');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (7, 'Milho', 'Zea mays');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (8, 'Nabo greleiro', 'Brassica rapa');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (9, 'Oliveira', 'Olea europaea');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (10, 'Nabo', 'Brassica rapa');
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
values (11, 'Videira', 'Vitis vinifera');

INSERT INTO Variedade(id, nome, cultura_id)
values (1, 'Ameixoeira Rainha Claudia Caranguejeira', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (2, 'Ameixoeira President', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (3, 'Ameixoeira Stanley', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (4, 'Ameixoeira Angeleno', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (5, 'Ameixoeira Black Beauty', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (6, 'Ameixoeira Black Star', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (7, 'Ameixoeira Black Gold', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (8, 'Ameixoeira Black Diamond', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (9, 'Ameixoeira Black Amber', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (10, 'Ameixoeira Black Splendor', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (11, 'Ameixoeira Fortuna', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (12, 'Ameixoeira Friar', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (13, 'Ameixoeira El Dorado', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (14, 'Ameixoeira Elephant Heart', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (15, 'Ameixoeira Golden Japan', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (16, 'Ameixoeira Harry Pitchon', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (17, 'Ameixoeira Laetitia', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (18, 'Ameixoeira Metley', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (19, 'Ameixoeira Mirabelle de Nancy', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (20, 'Ameixoeira Queen Rose', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (21, 'Ameixoeira Red Beaut', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (22, 'Ameixoeira Santa Rosa', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (23, 'Ameixoeira Shiro', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (24, 'Ameixoeira Sungold', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (25, 'Ameixoeira Wilson Perfection', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (26, 'Ameixoeira Autumn Giant', 1);
INSERT INTO Variedade(id, nome, cultura_id)
values (27, 'Damasqueiro Bulida', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (28, 'Damasqueiro Canino', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (29, 'Damasqueiro Liabaud', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (30, 'Damasqueiro Maillot Jaune', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (31, 'Damasqueiro Polonais', 2);
INSERT INTO Variedade(id, nome, cultura_id)
values (32, 'Macieira Akane', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (33, 'Macieira Belgolden', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (34, 'Macieira Bravo de Esmolfe', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (35, 'Macieira Casa Nova de Alcobaça', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (36, 'Macieira Erovan', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (37, 'Macieira Fuji', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (38, 'Macieira Granny Smith', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (39, 'Macieira Golden Delicious', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (40, 'Macieira Hi-Early', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (41, 'Macieira Jonagored', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (42, 'Macieira Lysgolden', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (43, 'Macieira Mutsu', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (44, 'Macieira Porta da Loja', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (45, 'Macieira Reinette ou Canada', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (46, 'Macieira Reinette ou Grand Fay', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (47, 'Macieira Riscadinha de Palmela', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (48, 'Macieira Royal Gala', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (49, 'Macieira Redchief', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (50, 'Macieira Starking', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (51, 'Macieira Summer Red', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (52, 'Macieira Wellspur Delicious', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (53, 'Macieira Noiva', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (54, 'Macieira Olho Aberto', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (55, 'Macieira Camoesa Rosa', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (56, 'Macieira Malapio', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (57, 'Macieira Gronho Doce', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (58, 'Macieira Pé de Boi', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (59, 'Macieira Pinova', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (60, 'Macieira Pardo Lindo', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (61, 'Macieira Pipo de Basto', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (62, 'Macieira Prima', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (63, 'Macieira Querina', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (64, 'Macieira Vista Bella', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (65, 'Macieira Golden Smoothee', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (66, 'Macieira Golden Suprema', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (67, 'Macieira Gloster 69', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (68, 'Macieira Freedom', 3);
INSERT INTO Variedade(id, nome, cultura_id)
values (69, 'Pera Nashi Sninseiki', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (70, 'Pera Nashi Kumoi', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (71, 'Pera Nashi Hosui', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (72, 'Pera Nashi Nijisseiki', 4);
INSERT INTO Variedade(id, nome, cultura_id)
values (73, 'Cenoura Carson Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (74, 'Cenoura Red Cored Chantenay', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (75, 'Cenoura Danvers Half Long', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (76, 'Cenoura Imperator 58', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (77, 'Cenoura Sugarsnax Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (78, 'Cenoura Nelson Hybrid', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (79, 'Cenoura Scarlet Nantes', 5);
INSERT INTO Variedade(id, nome, cultura_id)
values (80, 'Tremoço Amarelo', 6);
INSERT INTO Variedade(id, nome, cultura_id)
values (81, 'Tremoço Branco', 6);
INSERT INTO Variedade(id, nome, cultura_id)
values (82, 'Milho Mas 24.C', 7);
INSERT INTO Variedade(id, nome, cultura_id)
values (83, 'Milho Doce Golden Bantam', 7);
INSERT INTO Variedade(id, nome, cultura_id)
values (84, 'Nabo Greleiro Senhora Conceição', 8);
INSERT INTO Variedade(id, nome, cultura_id)
values (85, 'Oliveira Cobrançosa', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (86, 'Oliveira Arbequina', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (87, 'Oliveira Hojiblanca', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (88, 'Oliveira Negrinha do Freixo', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (89, 'Oliveira Picual', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (90, 'Oliveira Maçanilha', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (91, 'Oliveira Conserva de Elvas', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (92, 'Oliveira Galega', 9);
INSERT INTO Variedade(id, nome, cultura_id)
values (93, 'Nabo S. Cosme', 10);
INSERT INTO Variedade(id, nome, cultura_id)
values (94, 'Videira Dona Maria', 11);
INSERT INTO Variedade(id, nome, cultura_id)
values (95, 'Videira Cardinal', 11);

INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (1, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (2, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (3, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (4, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (5, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (6, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (7, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (8, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (9, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (10, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (11, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (12, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (13, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (14, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (15, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (16, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (17, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (18, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (19, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (20, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (21, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (22, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (23, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (24, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (25, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (26, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (27, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (28, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (29, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (30, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (31, 'Novembro a dezembro', 'Fevereiro a março', 'Julho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (32, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (33, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (34, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (35, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (36, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (37, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (38, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (39, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (40, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (41, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (42, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (43, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (44, 'Janeiro', 'Abril a maio', 'Novembro a dezembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (45, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (46, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (47, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (48, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (49, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (50, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (51, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (52, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (53, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (54, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (55, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (56, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (57, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (58, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (59, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (60, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (61, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (62, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (63, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (64, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (65, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (66, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (67, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (68, 'Novembro a dezembro', 'Março a abril', 'Agosto a setembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (69, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (70, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (71, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (72, null, null, null);
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (85, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (86, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (87, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (88, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (89, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (90, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (91, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (92, null, null, 'Outubro a novembro');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (94, 'Dezembro a janeiro', 'Maio', 'Junho a agosto');
INSERT INTO Variedade_Permanente(variedade_id, fase_poda, fase_floracao, fase_colheita)
VALUES (95, 'Dezembro a janeiro', 'Maio', 'Junho a agosto');

INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (73, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (74, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (75, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (76, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (77, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (78, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (79, null, '80 dias');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (80, null, null);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (81, null, null);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (82, 'Abril a junho', 'Julho a setembro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (83, 'Abril a junho', 'Julho a setembro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (84, 'Março a setembro', 'Junho a fevereiro');
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (93, 'Fevereiro a abril, agosto a outubro', '90 dias');

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Abóbora manteiga, designada por Cucurbita moschata var 'Butternut'
INSERT INTO Cultura(id, nome_comum, nome_cientifico)
VALUES (12, 'Abóbora', 'Cucurbita Moschata');
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (96, 'Abóbora manteiga', 12);
INSERT INTO Variedade_Temporaria(variedade_id, fase_sementeira, fase_colheita)
VALUES (96, null, null);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (97, 'Macieira Canada', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (97, NULL, NULL, NULL, NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Variedade(id, nome, cultura_id)
VALUES (98, 'Macieira Grand Fay', 3);
INSERT INTO Variedade_Permanente(variedade_id, fase_plantacao, fase_poda, fase_floracao, fase_colheita)
VALUES (98, NULL, NULL, NULL, NULL);

INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (1, 'Abóbora Manteiga', 96);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (2, 'Maçã Royal Gala', 48);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (3, 'Maçã Jonagored', 41);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (4, 'Maçã Fuji', 37);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (5, 'Maçã Canada', 97);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (6, 'Maçã Grand Fay', 98);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (7, 'Maçã Pipo de Basto', 61);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (8, 'Maçã Gronho Doce', 57);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (9, 'Maçã Malápio', 56);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (10, 'Maçã Porta da Loja', 44);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (11, 'Azeitona Arbequina', 86);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (12, 'Azeitona Picual', 89);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (13, 'Azeitona Galega', 92);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (14, 'Cenoura Sugarsnax Hybrid', 77);
INSERT INTO PRODUTO (ID, NOME, VARIEDADE_ID)
VALUES (15, 'Cenoura Danvers Half Long', 75);

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

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
-- inserir em Campo Grande
INSERT INTO Plantacao(id, parcela_id)
VALUES (28, 102);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (28, 86,12,12,40, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (29, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (29, 61,12,12,40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO Plantacao(id, parcela_id)
VALUES (30, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (30, 44,12,12,50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (31, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (31, 56,12,12,20, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (32, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (32, 97,12,12,30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (33, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (33, 98,12,12,40, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO Plantacao(id, parcela_id)
VALUES (34, 105);
INSERT INTO Plantacao_Permanente(plantacao_id, variedade_perm_id,compasso,distancia_filas, quantidade, data_inicio, data_fim)
VALUES (34, 57,12,12,50, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (35, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (35, 77, 1, TO_DATE('05/04/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (36, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (36, 75, 1, TO_DATE('05/07/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO Plantacao(id, parcela_id)
VALUES (37, 108);
INSERT INTO Plantacao_Temporaria(plantacao_id, variedade_temp_id, area, data_início, data_fim)
VALUES (37, 96, 1, TO_DATE('06/04/2023', 'DD/MM/YYYY'), NULL);

-- tabela Tipo_FP
INSERT INTO Tipo_FP(id, tipo)
VALUES (1, 'Fitofármaco');
INSERT INTO Tipo_FP(id, tipo)
VALUES (2, 'Adubo');
INSERT INTO Tipo_FP(id, tipo)
VALUES (3, 'Corretor');

-- tabela Formulacao_FP
INSERT INTO Formulacao_FP(id, tipo)
VALUES (1, 'Pó molhável');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (2, 'Granulado');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (3, 'Pó');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (4, 'Líquido');
INSERT INTO Formulacao_FP(id, tipo)
VALUES (5, 'Emulsão de óleo em água');

-- tabela Metodo_Aplicacao
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (1, 'Fungicida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (2, 'Adubo solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (3, 'Adubo foliar');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (4, 'Fertirrega');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (5, 'Correção solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (6, 'Insecticida');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (7, 'Solo');
INSERT INTO Metodo_Aplicacao(id, tipo)
VALUES (8, 'Foliar');


-- tabela Composto_Quimico
INSERT INTO Composto_Quimico(id, nome)
VALUES (1, 'CU');
INSERT INTO Composto_Quimico(id, nome)
VALUES (2, 'S');
INSERT INTO Composto_Quimico(id, nome)
VALUES (3, 'K');
INSERT INTO Composto_Quimico(id, nome)
VALUES (4, 'Mg');
INSERT INTO Composto_Quimico(id, nome)
VALUES (5, 'B');
INSERT INTO Composto_Quimico(id, nome)
VALUES (6, 'Mn');
INSERT INTO Composto_Quimico(id, nome)
VALUES (7, 'CaCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (8, 'MgCO3');
INSERT INTO Composto_Quimico(id, nome)
VALUES (9, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (10, 'Bacillus pumilus');
INSERT INTO Composto_Quimico(id, nome)
VALUES (11, 'Ácidos gordos (na forma de sais de potássio)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (12, 'Terpenóides');

-- tabela Fator_Producao
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (1, 'Calda Bordalesa ASCENZA', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (2, 'Enxofre Bayer 80 WG', 1, 1);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (3, 'Patentkali', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (4, 'ESTA Kieserit', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (5, 'EPSO Microtop', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (6, 'EPSO Top', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (7, 'Biocal CaCo3', 3, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (8, 'Biocal Composto', 3, 3);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (9, 'Sonata', 1, 4);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (10, 'FLiPPER ', 1, 5);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (11, 'Requiem Prime', 1, 4);

-- tabela FP_Metodo_Aplicacao
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (1, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (2, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (3, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (4, 2);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (5, 4);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (6, 3);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (7, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (8, 5);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (9, 1);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (10, 6);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (11, 6);


-- tabela Ficha_Tecnica
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (1, 1, 0.2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (2, 2, 0.8);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 3, 0.249);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 4, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (3, 2, 0.176);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 4, 0.151);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (4, 2, 0.208);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 4, 0.09);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 2, 0.124);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 5, 0.009);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (5, 6, 0.01);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 4, 0.096);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (6, 2, 0.13);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 7, 0.882);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (7, 8, 0.019);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 7, 0.717);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 8, 0.148);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (8, 9, 0.079);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (9, 10, 0.9774);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (10, 11, 0.478);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (11, 12, 0.1442);

-- NOVOS DADOS ----------------------------------------------------------------------------------------------

--compostos químicos que faltavam em relação ao legacy
INSERT INTO Composto_Quimico(id, nome)
VALUES (13, 'N');
INSERT INTO Composto_Quimico(id, nome)
VALUES (14, 'P2O5');
INSERT INTO Composto_Quimico(id, nome)
VALUES (15, 'K2O');
INSERT INTO Composto_Quimico(id, nome)
VALUES (16, 'Ca');
INSERT INTO Composto_Quimico(id, nome)
VALUES (17, 'MgO');
INSERT INTO Composto_Quimico(id, nome)
VALUES (18, 'Materia Organica');

--Fatores de procução --tipo_id = 2: Adubo
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (12, 'Fertimax Extrume de Cavalo', 2, 2);
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (13, 'BIOFERTIL N6', 2, 2);

INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (12, 7);
INSERT INTO FP_Metodo_Aplicacao(fator_producao_id, metodo_aplicacao_id)
VALUES (13, 7);

--ficha tecnica Fertimax Extrume de Cavalo
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 18, 0.5);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 14, 0.008);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 15, 0.004);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 16, 0.016);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (12, 5, 0.00004);

--ficha tecnica BIOFERTIL N6
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 18, 0.53);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 13, 0.03);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 14, 0.025);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 15, 0.024);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 16, 0.06);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 17, 0.003);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (13, 5, 0.000020);

--Matéria Orgânica Líquida, Tecniferti MOL, da Tecniferti, líquido, Matéria Orgânica 27%, Azoto (N) 3,6%, Azoto orgânico (N) 2%,
-- Fósforo total (P2O5) 1%, Potássio total (K2O) 3%, Carbono Orgânico Total (COT) 15%, Ácidos Fúlvicos (AF) 10%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (14, 'Tecniferti MOL', 4, 4);

insert into TIPO_FP(id, tipo)
values (4, 'Matéria Orgânica Líquida');

INSERT INTO Composto_Quimico(id, nome)
VALUES (19, 'Azoto orgânico (N)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (20, 'Carbono Orgânico Total (COT)');
INSERT INTO Composto_Quimico(id, nome)
VALUES (21, 'Ácidos Fúlvicos (AF)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 4, 27);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 13, 3.6);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 19, 2);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 14, 1);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 15, 1);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 20, 15);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (14, 21, 10);


--Adubo orgânico, soluSOP 52, da K+S, pó molhavel, Enxofre (SO3) 45%, Potássio total (K2O) 52,5%, pH 7
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (15, 'soluSOP 52', 5, 1);

insert into TIPO_FP(id, tipo)
values (5, 'Adubo orgânico');

INSERT INTO Composto_Quimico(id, nome)
VALUES (22, 'Enxofre (SO3)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (15, 22, 45);
INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (15, 15, 52.5);


--Adubo líquido, Floracal Flow SL, da Plymag, líquido, pH 7.8, densidade 1,6 kg/l, Óxido de calcio (CaO) 35%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (16, 'Floracal Flow SL', 6, 4);

insert into TIPO_FP(id, tipo)
values (6, 'Adubo líquido');

INSERT INTO Composto_Quimico(id, nome)
VALUES (23, 'Óxido de calcio (CaO)');

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (16, 23, 35);


--Adubo líquido, Kiplant AllGrip, da Asfertglobal, líquido
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (17, 'Kiplant AllGrip', 6, 4);


--Adubo líquido, Cuperdem, da Asfertglobal, líquido, Cobre (Cu) 6%
INSERT INTO Fator_Producao(id, nome, tipo_id, formulacao_id)
VALUES (18, 'Cuperdem', 6, 4);

INSERT INTO Ficha_Tecnica(fator_producao_id, composto_quimico_id, quantidade)
VALUES (18, 1, 6);


--Receita 10
-- EPSO TOP, K+S, 1.5 kg/ha
-- soluSOP 52, K+S, 2.5 kg/ha
-- Floracal Flow SL, Plymag, 1.7 l/ha
INSERT INTO Receita_Fertirrega(id, nome)
VALUES (1, 'Receita 10');

INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 6, 1.5, 'kg/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 15, 2.5, 'kg/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (1, 16, 1.7, 'l/ha');


-- Receita 11
-- Tecniferti MOL, Tecniferti, 60 l/ha
-- Kiplant AllGrip, Asfertglobal, 2 l/ha
INSERT INTO Receita_Fertirrega(id, nome)
VALUES (2, 'Receita 11');

INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (2, 14, 60, 'l/ha');
INSERT INTO Receita_FP(receita_id, fp_id, proporcao, unidade)
VALUES (2, 17, 2, 'l/ha');


/*
 Setor 10
    Início a 01/05/2017, sem data fim
    Caudal máximo: 2500 l/h
    Parcelas: Campo grande
 */

INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (10, 'Setor 10', NULL, 2500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Galega, 30 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (1, 10, 11, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Oliveira Picual, 20 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (2, 10, 12, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 11
Início a 01/05/2017, sem data fim
Caudal máximo: 1500 l/h
Parcelas: Campo grande
 */
INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (11, 'Setor 11', NULL, 1500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Oliveira Arbequina, 40 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (3, 11, 28, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);


-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 21
Início a 01/05/2017, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro da ponte, Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (21, 'Setor 21', NULL, 3500, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Jonagored, 90 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (4, 21, 22, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Fuji, 60 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (5, 21, 23, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 40 un, 01/05/2017, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (6, 21, 24, TO_DATE('01/05/2017', 'DD/MM/YYYY'), NULL);

-- Macieira Royal Gala, 30 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (7, 21, 25, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Pipo de Basto, 40 un, 01/05/2019, sem data fim
-- inserir em Lameiro do Moinho
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (8, 21, 29, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 22
Início a 01/05/2019, sem data fim
Caudal máximo: 3500 l/h
Parcelas: Lameiro do Moinho
 */
INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (22, 'Setor 22', NULL, 3500, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL, NULL);

-- Macieira Porta da Loja, 50 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (9, 22, 30, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Malápio, 20 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (10, 22, 31, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Canada, 30 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (11, 22, 32, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Grand Fay, 40 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (12, 22, 33, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);

-- Macieira Gronho Doce, 50 un, 01/05/2019, sem data fim
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (13, 22, 34, TO_DATE('01/05/2019', 'DD/MM/YYYY'), NULL);


-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 41
Início a 01/04/2023, 10/10/2023
Caudal máximo: 2500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (41, 'Setor 41', NULL, 2500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Cenoura Sugarsnax Hybrid, 05/04/2023 a 31/05/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (14, 41, 35, TO_DATE('05/04/2023', 'DD/MM/YYYY'), TO_DATE('31/05/2023', 'DD/MM/YYYY'));

-- Cenoura Danvers Half Long, 05/07/2023 a 08/10/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (15, 41, 36, TO_DATE('05/07/2023', 'DD/MM/YYYY'), TO_DATE('08/10/2023', 'DD/MM/YYYY'));

-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
Setor 42
Início a 01/04/2023, 10/10/2023
Caudal máximo: 3500 l/h
Parcelas: Campo Novo
 */

INSERT INTO Setor_Rega(id, nome, area, caudal_maximo, data_inicio, data_fim, metodo_dispensasao_id)
VALUES (42, 'Setor 42', NULL, 3500, TO_DATE('01/04/2023', 'DD/MM/YYYY'), TO_DATE('10/10/2023', 'DD/MM/YYYY'), NULL);

-- Abóbora Manteiga, 06/04/2023 a 10/09/2023
INSERT INTO SetorRega_Plantacao(id, setor_id, plantacao_id, data_inicio, data_fim)
VALUES (16, 42, 37, TO_DATE('06/04/2023', 'DD/MM/YYYY'), TO_DATE('10/09/2023', 'DD/MM/YYYY'));



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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (115);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (115,7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (115,102,92);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, UNIDADE)
VALUES (115, 3, 15, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (116, TO_DATE('10-12-2017', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (116);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (116, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (116,102,89);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (116, 3, 10, 'kg');
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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (122);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (122, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (122,104,41);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, UNIDADE)
VALUES (122, 4, 10, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (123, TO_DATE('06-02-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (123);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (123, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (123,104,37);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (123, 4, 6, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (124, TO_DATE('06-02-2018', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (124);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (124, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (124,104,48);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (124, 4, 5, 'kg');



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

INSERT INTO Aplicacao_FP(operacao_id)
VALUES (143);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (143, null);;
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (143,107,94);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (143, 1, 2, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (144, TO_DATE('20-01-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (144);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (144, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (144,107,95);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (144, 1, 2.5, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (145, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (145);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (145, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (145,104,41);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (145, 4, 10, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (146, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (146);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (146, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (146,104,37);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (146, 4, 5, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (147, TO_DATE('06-02-2019', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (147);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (147, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (147,104,48);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (147, 4, 7, 'kg');



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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (160);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (160, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (160,107,94);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (160, 1, 2, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (161, TO_DATE('20-01-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (161);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (161, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (161,107,95);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (161, 1, 2.5, 'kd');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (162, TO_DATE('12-03-2020', 'dd-mm-yyyy'), null, 1);

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (163, TO_DATE('30-03-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (163);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (163, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (163,103,40);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (163, 8, 600, 'kg');

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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (190);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (190, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (190,102,92);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (190, 3, 10, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (191, TO_DATE('10-12-2020', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (191);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (191, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (191,102,89);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (191, 3, 7, 'kg');

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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (198);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (198,null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (198,107,94);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (198, 1, 2, 'kg');

INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (199, TO_DATE('20-01-2021', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (199);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (199, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (199,107,95);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (199, 1, 2.5, 'kg');
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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (205);
INSERT INTO Aplicacao_FP_Solo(operacao_id,parcela_id,area)
VALUES (205, 104,null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (205, 5, 10, 'kg');


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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (250);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (250,  null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (250,107,94);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (250, 1, 3, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (251, TO_DATE('20-01-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (251);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (251, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (251,107,95);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (251, 1, 3.5, 'kg');
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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (258);
INSERT INTO Aplicacao_FP_Solo(operacao_id,parcela_id, area)
VALUES (258, 104, null);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (258, 5, 10, 'kg');

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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (299);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (299, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (299,102,92);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (299, 3, 15, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (300, TO_DATE('11-12-2022', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (300);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (300, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (300,107,89);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (300, 3, 10, 'kg');
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
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (306);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (306, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (306,107,94);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (306, 1, 4, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (307, TO_DATE('20-01-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (307);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,METODO_APLICACAO_ID)
VALUES (307,null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (307,107,95);
INSERT INTO FP_APLICADOS(operacao_id, fp_id, quantidade, unidade)
VALUES (307, 1, 5, 'kg');
INSERT INTO Operacao_Agricola (id, data, instante_registo, validade)
VALUES (308, TO_DATE('20-03-2023', 'dd-mm-yyyy'), null, 1);
INSERT INTO Incorporacao_Solo(operacao_id, parcela_id, variedade_id, quantidade)
VALUES (308, 103, 80, 1.3);



---------------------------------------------------------------------------------

-- OPERAÇOES LAMEIRO DA PONTE

-- 14/05/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (309, to_date('14-05-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (309, 21, 120, '07:00');

--01/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (310, to_date('01-06-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (310, 21, 120, '07:00');

--15/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (311, to_date('15-06-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (311, 21, 120, '07:00');

--30/06/2023 operação de rega, setor 21, 120 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (312, to_date('30-06-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (312, 21, 120, '07:00');

--07/07/2023 operação de rega, setor 21, 180 min, 07:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (313, to_date('07-07-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (313, 21, 180, '07:00');

--14/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (314, to_date('14-07-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (314, 21, 180, '22:00');

--21/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (315, to_date('21-07-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (315, 21, 180, '22:00');

--28/07/2023 operação de rega, setor 21, 180 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (316, to_date('28-07-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (316, 21, 180, '22:00');

--04/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (317, to_date('04-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (317, 21, 150, '22:00');

--11/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (318, to_date('11-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (318, 21, 150, '22:00');

--18/08/2023 operação de rega, setor 21, 150 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (319, to_date('19-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (319, 21, 150, '22:00');

--25/08/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (320, to_date('25-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (320, 21, 120, '22:00');

--01/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (321, to_date('01-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (321, 21, 120, '22:00');

--08/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (322, to_date('08-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (322, 21, 120, '22:00');

--15/09/2023 operação de rega, setor 21, 120 min, 22:00
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (323, to_date('15-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Rega(operacao_id, setor_id, duracao, hora)
VALUES (323, 21, 120, '22:00');

--18/08/2023 operação de colheita de maçã Royal Gala, 700 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (324, to_date('18-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (324, 104, 2, null, 700);


--30/08/2023 operação de colheita de maçã Royal Gala, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (325, to_date('30-08-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (325, 104, 2, null, 900);

--05/09/2023 operação de colheita de maçã Jonagored, 900 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (326, to_date('05-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (326, 104, 3, null, 900);

--08/09/2023 operação de colheita de maçã Jonagored, 1050 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (327, to_date('08-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (327, 104, 3, null, 1050);

--28/09/2023 operação de colheita de maçã Fuji, 950 kg
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (328, to_date('28-09-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (328, 104, 4, null, 950);

--03/10/2023 operação de colheita de maçã Fuji, 800 kgº
-- Lameiro da Ponte
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (329, to_date('03-10-2023', 'dd-mm-yyyy'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
VALUES (329, 104, 4, null, 800);

---------------------------------------------------------------------------------

-- OPERAÇOES LAMEIRO DO MOINHO

-- 04/01/2019 operação de aplicação de fator de produção BIOFERTIL N6, no solo, 1.1 ha, 3200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (330, TO_DATE('04/01/2019', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (330);
INSERT INTO APLICACAO_FP_Solo(OPERACAO_ID,parcela_id,area)
VALUES (330, 105,1.1);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (330,13, 3200, 'kg');


-- 09/01/2019 operação de plantação de Macieira Porta da Loja, 50 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (331, TO_DATE('09/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (331, 105, 44, NULL, 50, 5, 5);

-- 09/01/2019 operação de plantação de Macieira Malápio, 20 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (332, TO_DATE('09/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (332, 105, 56, NULL, 20, 5, 5);

-- 10/01/2019 operação de plantação de Macieira Pipo de Basto, 40 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (333, TO_DATE('10/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (333, 105, 61, NULL, 40, 5, 5);

-- 10/01/2019 operação de plantação de Macieira Canada, 30 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (334, TO_DATE('10/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (334, 105, 97, NULL, 30, 5, 5);

-- 11/01/2019 operação de plantação de Macieira Grand Fay, 40 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (335, TO_DATE('11/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (335, 105, 98, NULL, 40, 5, 5);

-- 11/01/2019 operação de plantação de Macieira Gronho Doce, 50 un, compasso de 5 m, distancia entre filas de 5 m
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, INSTANTE_REGISTO, VALIDADE)
VALUES (336, TO_DATE('11/01/2019', 'DD/MM/YYYY'), null, 1);
INSERT INTO OP_PLANTACAO(OPERACAO_ID, PARCELA_ID, VARIEDADE_ID, METODO_EXECUCAO_ID, QUANTIDADE, COMPASSO, DISTANCIA_FILAS)
VALUES (336, 105, 57, NULL, 50, 5, 5);

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (337, TO_DATE('06/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (337);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (337, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (337,105,44);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (337,12, 100, 'kg');

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 40 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (338, TO_DATE('06/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (338);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (338, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (338,105,56);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (338,12, 40, 'kg');

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (339, TO_DATE('06/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (339);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (339, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (339,105,61);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (339,12, 80, 'kg');

-- 06/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (340, TO_DATE('06/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (340);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (340, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (340,105,97);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (340,12, 60, 'kg');

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 80 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (341, TO_DATE('07/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (341);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (341, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (341,105,98);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (341,12, 80, 'kg');

-- 07/01/2020 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 100 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (342, TO_DATE('07/01/2020', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (342);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (342, 7);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (342,12, 100, 'kg');
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (342,105,57);


-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (343, TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (343);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (343, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (343,105,44);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (343,12, 150, 'kg');

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (344, TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (344);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (344, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (344,105,56);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (344,12, 60, 'kg');

-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (345, TO_DATE('08/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (345);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (345, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (345,105,61);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (345,12, 120, 'kg');

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (346, TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (346);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (346, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (346,105,97);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (346,12, 90, 'kg');

-- 07/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (347, TO_DATE('07/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (347);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (347, 7);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (347,12, 120, 'kg');
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (347,105,98);


-- 08/01/2021 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (348, TO_DATE('08/01/2021', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (348);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (348, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (348,105,57);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (348,12, 150, 'kg');

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Porta da Loja, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (349, TO_DATE('15/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (349);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (349, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (349,105,44);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (349,13, 150, 'kg');

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Malápio, 60 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (350, TO_DATE('15/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (350);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (350, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (350,105,56);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (350,13, 60, 'kg');

-- 15/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Pipo de Basto, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (351, TO_DATE('15/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (351);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (351, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (351,105,61);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (351,13, 120, 'kg');

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Canada, 90 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (352, TO_DATE('16/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (352);
INSERT INTO APLICACAO_FP_Solo(OPERACAO_ID,parcela_id,area)
VALUES (352, 105, null);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (352,13, 90, 'kg');

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Grand Fay, 120 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (353, TO_DATE('16/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (353);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (353, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (353,105,98);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (353,13, 120, 'kg');

-- 16/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, no solo, Macieira Gronho Doce, 150 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (354, TO_DATE('16/01/2022', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (354);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (354, 7);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (354,105,57);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (354,13,150,'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Porta da Loja, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (355, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (355);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (355, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (355,105,44);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (338,5, 5, 'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Malápio, 2 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (356, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (356);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (356, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (356,105,56);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (356,5, 2, 'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Pipo de Basto, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (357, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (357);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (357, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (357,105,61);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (357,5, 4, 'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Canada, 3 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (358, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (358);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (358, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (358,105,97);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (358,5, 3, 'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Grand Fay, 4 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (359, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (359);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (359, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (359,105,98);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (359,5, 4, 'kg');

-- 15/05/2023 operação de aplicação de fator de produção EPSO Microtop, foliar, Macieira Gronho Doce, 5 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (360, TO_DATE('15/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (360);
INSERT INTO APLICACAO_FP_Variedade(OPERACAO_ID,METODO_APLICACAO_ID)
VALUES (360, 8);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (360,105,57);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (360,5, 5, 'kg');


-- 15/09/2023 operação de colheita de maçã Canada, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (361, TO_DATE('15/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (361, 105, 5, NULL, 700);

-- 16/09/2023 operação de colheita de maçã Grand Fay, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (362, TO_DATE('16/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (362, 105, 6, NULL, 600);

-- 20/09/2023 operação de colheita de maçã Grand Fay, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (363, TO_DATE('20/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (363, 105, 6, NULL, 700);

-- 27/09/2023 operação de colheita de maçã Pipo de Basto, 600 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (364, TO_DATE('27/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (364, 105, 7, NULL, 600);

-- 05/10/2023 operação de colheita de maçã Pipo de Basto, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (365, TO_DATE('05/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (365, 105, 7, NULL, 700);

-- 15/10/2023 operação de colheita de maçã Gronho Doce, 1200 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (366, TO_DATE('15/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (366, 105, 8, NULL, 1200);

-- 15/10/2023 operação de colheita de maçã Malápio, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (367, TO_DATE('15/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (367, 105, 9, NULL, 700);

-- 12/11/2023 operação de colheita de maçã Porta da Loja, 700 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (368, TO_DATE('12/11/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (368, 105, 10, NULL, 700);

-- 15/11/2023 operação de colheita de maçã Porta da Loja, 800 kg
INSERT INTO OPERACAO_AGRICOLA(ID, DATA, validade)
VALUES (369, TO_DATE('15/11/2023', 'DD/MM/YYYY'), 1);
INSERT INTO COLHEITA(OPERACAO_ID, PARCELA_ID, PRODUTO_ID, METODO_EXECUCAO_ID, QUANTIDADE)
VALUES (369, 105, 10, NULL, 800);

---------------------------------------------------------------------------------

-- OPERAÇOES CAMPO GRANDE

-- 12/10/2016 operação de plantação de Oliveira Arbequina, 40 un, compasso de 6 m, distancia entre filas de 6 m
INSERT INTO Operacao_Agricola(id, data, INSTANTE_REGISTO, VALIDADE)
VALUES (386, TO_DATE('2016-10-12', 'YYYY-MM-DD'), null, 1);
INSERT INTO Op_Plantacao(operacao_id, parcela_id, VARIEDADE_ID, quantidade, COMPASSO, DISTANCIA_FILAS)
values (386, 102, 86, 40, 6, 6);

-- 13/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (387, TO_DATE('2021-01-13', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (387);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (387, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (387,102,89);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (387,13, 120, 'kg');

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (388, TO_DATE('2021-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (388);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (388, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (388,102,92);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (388,13, 180, 'kg');

-- 12/01/2021 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (389, TO_DATE('2021-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (389);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (389, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (389,102,86);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (389,13, 240, 'kg');

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (390, TO_DATE('2022-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (390);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (390, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (390,102,89);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (390,13, 120, 'kg');

-- 12/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (391, TO_DATE('2022-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (391);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (391, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (391,102,92);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (391,13, 180, 'kg');

-- 13/01/2022 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (392, TO_DATE('2022-01-13', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (392);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (392, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (392,102,86);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (392,13, 240, 'kg');

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Picual, 120 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (393, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (393);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (393, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (393,102,89);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (393,13, 120, 'kg');

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Galega, 180 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (394, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (394);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (394, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (394,102,92);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (394,13, 120, 'kg');

-- 12/01/2023 operação de aplicação de fator de produção BIOFERTIL N6, Oliveira Arbequina, 240 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (395, TO_DATE('2023-01-12', 'YYYY-MM-DD'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (395);
INSERT INTO Aplicacao_FP_Variedade(operacao_id,metodo_aplicacao_id)
VALUES (395, null);
INSERT INTO Parcelas_Variedades_Aplicadas(operacao_id,parcela_id,variedade_id)
VALUES (395,102,86);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (395,13, 240, 'kg');
--
-- 02/11/2023 operação de colheita de azeitona Arbequina, 400 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (396, TO_DATE('2023-11-02', 'YYYY-MM-DD'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (396, 102, 11, 400);

-- 05/11/2023 operação de colheita de azeitona Picual, 300 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (397, TO_DATE('2023-11-05', 'YYYY-MM-DD'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (397, 102, 12, 300);

-- 08/11/2023 operação de colheita de azeitona Galega, 350 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (398, TO_DATE('2023-11-08', 'YYYY-MM-DD'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, quantidade)
values (398, 102, 13, 350);
--


---------------------------------------------------------------------------------

-- OPERAÇOES CAMPO NOVO

-- 01/04/2023 operação de aplicação de fator de produção Biocal Composto, no solo, 1.1 ha, 500 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (404, TO_DATE('01/04/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (404);
INSERT INTO Aplicacao_FP_Solo(operacao_id,parcela_id,area)
VALUES (404, 108, 1.1);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (404,8, 500, 'kg');


-- 05/04/2023 operação de semeadura de cenouras Sugarsnax Hybrid, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (405, TO_DATE('05/04/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (405, 108, 77, 1.2, 0.5, null);


-- 06/04/2023 operação de semeadura de abóbora manteiga, 0.6 ha, 1.5 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (406, TO_DATE('06/04/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (406, 108, 96, 1.5, 0.6, null);

-- 08/05/2023 operação de monda de plantação de cenouras Sugarsnax Hybrid, 0.5 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (407, TO_DATE('08/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (407, 108, 77, 0.5, null);

-- 20/05/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (408, TO_DATE('20/05/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (408, 108, 96, 0.6, null);

-- 14/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 1500 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (409, TO_DATE('14/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (409, 108, 14, null, 1500);

-- 20/06/2023 operação de monda de plantação de abóbora manteiga, 0.6 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (410, TO_DATE('20/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (410, 108, 96, 0.6, null);

-- 28/06/2023 operação de colheita de cenouras Sugarsnax Hybrid, 2500 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (411, TO_DATE('28/06/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (411, 108, 14, null, 2500);

-- 03/07/2023 operação de aplicação de fator de produção Fertimax Extrume de Cavalo, no solo, 0.5 ha, 1800 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (412, TO_DATE('03/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Aplicacao_FP(operacao_id)
VALUES (412);
INSERT INTO Aplicacao_FP_Solo(operacao_id,parcela_id,area)
VALUES (412, 108,0.5);
INSERT INTO FP_Aplicados(operacao_id,fp_id, quantidade, unidade)
VALUES (412,12, 1800, 'kg');





-- 04/07/2023 operação de mobilização do solo, 0.5 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (413, TO_DATE('04/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (413, 108, 0.5);


-- 05/07/2023 operação de semeadura de cenouras Danvers Half Long, 0.5 ha, 1.2 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (414, TO_DATE('05/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (414, 108, 75, 1.2, 0.5, null);

-- 08/08/2023 operação de monda de plantação de cenouras Danvers Half Long, 0.5 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (415, TO_DATE('08/08/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Monda(operacao_id, parcela_id, variedade_id, quantidade, metodo_execucao_id)
VALUES (415, 108, 75, 0.5, null);

-- 15/09/2023 operação de colheita de abóbora manteiga, 8000 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (416, TO_DATE('15/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (416, 108, 1, null, 8000);

-- 25/09/2023 operação de colheita de abóbora manteiga, 5000 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (417, TO_DATE('25/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (417, 108, 1, null, 5000);

-- 18/09/2023 operação de colheita de cenouras Danvers Half Long, 900 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (418, TO_DATE('18/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (418, 108, 15, null, 900);

-- 22/09/2023 operação de colheita de cenouras Danvers Half Long, 1500 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (419, TO_DATE('22/09/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (419, 108, 15, null, 1500);

-- 05/10/2023 operação de colheita de cenouras Danvers Half Long, 1200 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (420, TO_DATE('05/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Colheita(operacao_id, parcela_id, produto_id, metodo_execucao_id, quantidade)
values (420, 108, 15, null, 1200);

-- 10/10/2023 operação de mobilização do solo, 1.1 ha
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (421, TO_DATE('10/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Mobilizacao_Solo(operacao_id, parcela_id, area)
VALUES (421, 108, 1.1);

-- 12/10/2023 operação de semeadura de Tremoço Amarelo, 1.1 ha, 32 kg
INSERT INTO Operacao_Agricola(id, data, validade)
VALUES (422, TO_DATE('12/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
VALUES (422, 108, 80, 32, 1.1, null);


-------------------------------------------------------------------------------------------------------------------

-- INSERTS REGAS:

-- 17/06/2023 operação de rega, setor 10, 30 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (450, to_date('17/06/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (450, 10, 30, '05:00');

-- 17/07/2023 operação de rega, setor 10, 30 min, 05:00
insert into OPERACAO_AGRICOLA(id, data, instante_registo, validade)
VALUES (451, to_date('17/07/2023', 'dd/mm/yyyy'), null, 1);

insert into REGA(operacao_id, setor_id, duracao, hora)
VALUES (450, 10, 30, '05:00');

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

INSERT INTO METODO_EXECUCAO(ID, NOME)
VALUES (1, 'Manual');
INSERT INTO METODO_EXECUCAO(ID, NOME)
VALUES (2, 'Mecânica');INSERT INTO METODO_EXECUCAO(ID, NOME)
VALUES (2, 'Mecânica');

commit;