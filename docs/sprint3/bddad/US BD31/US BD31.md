# US BD24

## 1. Engenharia de Requsitos

### 1.1 Descrição da User Story

> Como Gestor Agrícola, pretendo que não seja possível alterar ou apagar os logs.

### 1.2. Especificações e Clarificações

Clarificações do Cliente:

*

Clarificações dos Professores:

*

### 1.3. Critérios de Aceitação

* N/A

### 1.4. Dependedências

* Tem que exister logs registados na tabela "Log_Operacao"


### 1.7 Outros Pontos Importantes

* N/A

## 2. Analise

### 2.1. Excerto Modelo Domínio



### 2.2. Outros Pontos

* N/A

# 3. Implementação

### register_moment.sql

```sql
-- Criação da tabela para armazenar receitas de fertirrigação
CREATE TABLE RECEITA_FERTIRRIGACAO (
                                       id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
                                       nome VARCHAR2(50) NOT NULL,
                                       descricao VARCHAR2(200),
                                       nutrientes VARCHAR2(200),
                                       instrucoes VARCHAR2(500),
                                       data_registro DATE DEFAULT SYSDATE
);

-- Função para registrar uma receita de fertirrigação
CREATE OR REPLACE FUNCTION registrar_receita_fertirrigacao(
    p_nome VARCHAR2,
    p_descricao VARCHAR2,
    p_nutrientes VARCHAR2,
    p_instrucoes VARCHAR2
) RETURN NUMBER IS
    v_id NUMBER;
BEGIN
    -- Insere os dados na tabela usando a cláusula RETURNING
    INSERT INTO RECEITA_FERTIRRIGACAO (nome, descricao, nutrientes, instrucoes)
    VALUES (p_nome, p_descricao, p_nutrientes, p_instrucoes)
    RETURNING id INTO v_id;

    COMMIT;

    -- Retorna o ID da receita registrada
    RETURN v_id;
END;
/

```