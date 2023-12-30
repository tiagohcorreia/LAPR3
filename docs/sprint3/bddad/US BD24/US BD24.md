# US BD24

## 1. Engenharia de Requsitos

### 1.1 Descrição da User Story

> Como Gestor Agrícola, pretendo que todos os registos relacionados com operações tenham registado o instante em que foram criados, gerado pelo SGBD

### 1.2. Especificações e Clarificações

Clarificações do Cliente:

* 

Clarificações dos Professores:

* 
    
### 1.3. Critérios de Aceitação

* N/A

### 1.4. Dependedências

* N/A


### 1.7 Outros Pontos Importantes 

* N/A

## 2. Analise

### 2.1. Excerto Modelo Domínio

![US BD24-MD](/png/DM.png)

### 2.2. Outros Pontos

* N/A

# 3. Implementação

### register_moment.sql

```sql

CREATE OR REPLACE TRIGGER register_moment
BEFORE INSERT ON Operacao_Agricola
FOR EACH ROW

BEGIN
    :NEW.instante_registo := CURRENT_TIMESTAMP;
END;
/
```