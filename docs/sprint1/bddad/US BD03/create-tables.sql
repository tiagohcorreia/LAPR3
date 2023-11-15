CREATE TABLE Aplicacao_FP (operacao_id number(10) NOT NULL, fator_producao_id number(10) NOT NULL, PRIMARY KEY (operacao_id));
CREATE TABLE Colheita (operacao_id number(10) NOT NULL, previsao_colheita_id number(10) NOT NULL, produto_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Composto_Quimico (id number(10) NOT NULL, nome nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Cultura (id number(10) NOT NULL, nome_comum nvarchar2(255), nome_cientifico nvarchar2(255), tipo_consumo_id number(10), PRIMARY KEY (id));
CREATE TABLE Desfolha (operacao_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Edificio (id number(10) NOT NULL, nome nvarchar2(255), dimensao number(10), exploracao_agricola_id number(10) NOT NULL, tipo_edificio_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Exploracao_Agricola (id number(10) NOT NULL, nome nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Fator_Producao (id number(10) NOT NULL, nome nvarchar2(255), tipo_id number(10) NOT NULL, formulacao_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Ficha_Tecnica (fator_producao_id number(10) NOT NULL, composto_quimico_id number(10) NOT NULL, quantidade float(10), PRIMARY KEY (fator_producao_id, composto_quimico_id));
CREATE TABLE Formulacao_FP (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE FP_Metodo_Aplicacao (fator_producao_id number(10) NOT NULL, metodo_aplicacao_id number(10) NOT NULL, PRIMARY KEY (fator_producao_id, metodo_aplicacao_id));
CREATE TABLE Metodo_Aplicacao (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Metodo_Dispensasao (id number(10) GENERATED AS IDENTITY, nome number(10), PRIMARY KEY (id));
CREATE TABLE Monda (operacao_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Op_Plantacao (operacao_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Operacao (id number(10) NOT NULL, plantacao_id number(10) NOT NULL, data date, PRIMARY KEY (id));
CREATE TABLE Parcela (id number(10) NOT NULL, nome nvarchar2(255), area float(10), exploracao_agricola_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Planta_Permanente (id number(10) NOT NULL, data_plantacao date, plantacao_permanente_id number(10) NOT NULL, variedade_permanente_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Plantacao (id number(10) NOT NULL, parcela_id number(10) NOT NULL, setor_rega_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Plantacao_Permanente (plantacao_id number(10) NOT NULL, PRIMARY KEY (plantacao_id));
CREATE TABLE Plantacao_Temporaria (plantacao_id number(10) NOT NULL, variedade_temporaria_id number(10) NOT NULL, quantidade float(10), data_início date, data_fim date, PRIMARY KEY (plantacao_id));
CREATE TABLE Previsao_Colheita (id number(10) NOT NULL, data_inicio date, semana number(10), quantidade number(10), produto_id number(10) NOT NULL, plantacao_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Produto (id number(10) GENERATED AS IDENTITY, nome number(10), tipo_consumo number(10), cultura_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Registro_Sensor (operacao_id number(10) NOT NULL, sensor_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Sementeira (operacao_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Sensor (id number(10) GENERATED AS IDENTITY, parcela_id number(10), tipo_sensor_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Setor_Rega (id number(10) GENERATED AS IDENTITY, localizaçao number(10), area number(10), debito_maximo number(10), metodo_dispensasao_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Tipo_Edificio (id number(10) NOT NULL, tipo nvarchar2(255), unidade nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Tipo_FP (id number(10) NOT NULL, tipo nvarchar2(255), PRIMARY KEY (id));
CREATE TABLE Tipo_Sensor (id number(10) GENERATED AS IDENTITY, nome number(10), unidade number(10), PRIMARY KEY (id));
CREATE TABLE Tutoracao (operacao_id number(10) NOT NULL, quantidade number(10), PRIMARY KEY (operacao_id));
CREATE TABLE Variedade_Permanente (id number(10) NOT NULL, nome nvarchar2(255), fase_poda number(10), fase_floracao number(10), fase_colheita number(10), cultura_id number(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Variedade_Temporaria (id number(10) GENERATED AS IDENTITY, nome number(10), fase_sementeira number(10), fase_poda number(10), cultura_id number(10) NOT NULL, PRIMARY KEY (id));
ALTER TABLE Edificio ADD CONSTRAINT FKEdificio580456 FOREIGN KEY (exploracao_agricola_id) REFERENCES Exploracao_Agricola (id);
ALTER TABLE Edificio ADD CONSTRAINT FKEdificio633992 FOREIGN KEY (tipo_edificio_id) REFERENCES Tipo_Edificio (id);
ALTER TABLE Parcela ADD CONSTRAINT FKParcela742203 FOREIGN KEY (exploracao_agricola_id) REFERENCES Exploracao_Agricola (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao800350 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Fator_Producao ADD CONSTRAINT FKFator_Prod464638 FOREIGN KEY (tipo_id) REFERENCES Tipo_FP (id);
ALTER TABLE Fator_Producao ADD CONSTRAINT FKFator_Prod882534 FOREIGN KEY (formulacao_id) REFERENCES Formulacao_FP (id);
ALTER TABLE Previsao_Colheita ADD CONSTRAINT FKPrevisao_C37654 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Aplicacao_FP ADD CONSTRAINT FKAplicacao_767975 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita123488 FOREIGN KEY (previsao_colheita_id) REFERENCES Previsao_Colheita (id);
ALTER TABLE Variedade_Permanente ADD CONSTRAINT FKVariedade_848161 FOREIGN KEY (cultura_id) REFERENCES Cultura (id);
ALTER TABLE Planta_Permanente ADD CONSTRAINT FKPlanta_Per915301 FOREIGN KEY (variedade_permanente_id) REFERENCES Variedade_Permanente (id);
ALTER TABLE FP_Metodo_Aplicacao ADD CONSTRAINT FKFP_Metodo_165080 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE FP_Metodo_Aplicacao ADD CONSTRAINT FKFP_Metodo_683093 FOREIGN KEY (metodo_aplicacao_id) REFERENCES Metodo_Aplicacao (id);
ALTER TABLE Plantacao_Permanente ADD CONSTRAINT FKPlantacao_614284 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Plantacao_Temporaria ADD CONSTRAINT FKPlantacao_628676 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Operacao ADD CONSTRAINT FKOperacao454745 FOREIGN KEY (plantacao_id) REFERENCES Plantacao (id);
ALTER TABLE Aplicacao_FP ADD CONSTRAINT FKAplicacao_401044 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Ficha_Tecnica ADD CONSTRAINT FKFicha_Tecn282238 FOREIGN KEY (fator_producao_id) REFERENCES Fator_Producao (id);
ALTER TABLE Ficha_Tecnica ADD CONSTRAINT FKFicha_Tecn211506 FOREIGN KEY (composto_quimico_id) REFERENCES Composto_Quimico (id);
ALTER TABLE Planta_Permanente ADD CONSTRAINT FKPlanta_Per314858 FOREIGN KEY (plantacao_permanente_id) REFERENCES Plantacao_Permanente (plantacao_id);
ALTER TABLE Plantacao_Temporaria ADD CONSTRAINT FKPlantacao_900998 FOREIGN KEY (variedade_temporaria_id) REFERENCES Variedade_Temporaria (id);
ALTER TABLE Variedade_Temporaria ADD CONSTRAINT FKVariedade_394799 FOREIGN KEY (cultura_id) REFERENCES Cultura (id);
ALTER TABLE Sementeira ADD CONSTRAINT FKSementeira432211 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Desfolha ADD CONSTRAINT FKDesfolha226908 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Tutoracao ADD CONSTRAINT FKTutoracao940759 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Op_Plantacao ADD CONSTRAINT FKOp_Plantac365924 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Registro_Sensor ADD CONSTRAINT FKRegistro_S164971 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Monda ADD CONSTRAINT FKMonda789751 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Produto ADD CONSTRAINT FKProduto356827 FOREIGN KEY (cultura_id) REFERENCES Cultura (id);
ALTER TABLE Previsao_Colheita ADD CONSTRAINT FKPrevisao_C326819 FOREIGN KEY (produto_id) REFERENCES Produto (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita340301 FOREIGN KEY (operacao_id) REFERENCES Operacao (id);
ALTER TABLE Colheita ADD CONSTRAINT FKColheita249376 FOREIGN KEY (produto_id) REFERENCES Produto (id);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor735474 FOREIGN KEY (parcela_id) REFERENCES Parcela (id);
ALTER TABLE Plantacao ADD CONSTRAINT FKPlantacao982868 FOREIGN KEY (setor_rega_id) REFERENCES Setor_Rega (id);
ALTER TABLE Setor_Rega ADD CONSTRAINT FKSetor_Rega1754 FOREIGN KEY (metodo_dispensasao_id) REFERENCES Metodo_Dispensasao (id);
ALTER TABLE Sensor ADD CONSTRAINT FKSensor444441 FOREIGN KEY (tipo_sensor_id) REFERENCES Tipo_Sensor (id);
ALTER TABLE Registro_Sensor ADD CONSTRAINT FKRegistro_S64594 FOREIGN KEY (sensor_id) REFERENCES Sensor (id);
