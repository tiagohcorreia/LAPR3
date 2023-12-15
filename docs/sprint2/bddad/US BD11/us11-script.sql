CREATE OR REPLACE FUNCTION checkIfSementeiraExists(id sementeira.operacao_id%TYPE)
    RETURN NUMBER
    IS
    otherId sementeira.operacao_id%TYPE;
    CURSOR c1 IS SELECT operacao_id FROM SEMENTEIRA;
BEGIN
    OPEN c1;

    loop
        fetch c1 INTO otherID;
        IF (id = otherId) THEN
            close c1;
            return 1;
        end if;
        exit when c1%notfound;
    end loop;
    close c1;
    return 0;
end;

CREATE OR REPLACE FUNCTION registar_Sementeira(
    parcelaId Parcela.id%TYPE,
    variedadeId Variedade.id%TYPE,
    data_v Operacao_Agricola.data%TYPE,
    quantidade_v Sementeira.quantidade%TYPE,
    area_v Sementeira.area%TYPE,
    metodo_execucao_id Metodo_Execucao.id%TYPE
)
    RETURN NUMBER
    IS
    returnValue NUMBER := 0;
    id Operacao_Agricola.id% TYPE := 0;

BEGIN

    SELECT MAX(id) + 1 INTO id FROM Operacao_Agricola;

-----------------------------------------------------------------------------------------------------------------------

    -- Verificar se parcela existe
    IF CHECKIFPARCELEXISTS(parcelaId) = 0 THEN
        DBMS_OUTPUT.put_line('Parcela especificada não existe na base de dados');
        RETURN returnValue;
    END IF;

    -- Verificar se variedade existe
    IF CHECKIFVARIETYEXISTS(variedadeId) = 0 THEN
        DBMS_OUTPUT.put_line('Variedade especificada não existe na base de dados.');
        RETURN returnValue;
    END IF;

    -- Verificar se Variedade esta dentro de parcela
    IF CHECKIFVARIETYISINPARCEL(parcelaId, variedadeId) = 0 THEN
        return returnValue; -- 0 Não Sucesso
    end if;

    -- Verificar se metodo de execução existe
    IF CHECKIFMETODOEXECUCAOEXISTS(metodo_execucao_id) = 0 THEN
        DBMS_OUTPUT.put_line('Método de Execução especificado não existe na base de dados');
        RETURN returnValue;
    END IF;

-----------------------------------------------------------------------------------------------------------------------

    -- Insert into Operacao_Agricola
    SAVEPOINT savePoint1;

    INSERT INTO Operacao_Agricola(id, data) VALUES (id, TO_DATE(data_v, 'YYYY-MM-DD'));

    -- Insert into Sementeira
    INSERT INTO Sementeira(operacao_id, parcela_id, variedade_id, quantidade, area, metodo_execucao_id)
    VALUES (id, parcelaId, variedadeId, quantidade_v, area_v, metodo_execucao_id);

-----------------------------------------------------------------------------------------------------------------------

    IF (CHECKIFOPERATIONIDEXISTS(id) = 1 OR checkIfSementeiraExists(id) = 1) THEN
    COMMIT;
    returnValue := 1;
    ELSE
        ROLLBACK TO savePoint1;
    END IF;

    RETURN returnValue;
END;

-----------------------------------------------------------------------------------------------------------------------

--Registar uma operação de semeadura na Horta Nova, em 20/09/2023, de Nabo greleiro Senhora Conceição, 0.5 ha, 1.2 kg de semente

DECLARE
    operationSuccess NUMBER;
BEGIN

    operationSuccess := registarSementeira(106, 93, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 1.2, 0.5, NULL);

    IF (operationSuccess = 1) THEN
        DBMS_OUTPUT.put_line('Sementeira registrada com sucesso.');
    ELSE
        DBMS_OUTPUT.put_line('Não foi possível registar sementeira');
    END IF;
END;

-----------------------------------------------------------------------------------------------------------------------

--Registar uma operação de semeadura no Campo Novo, em 19/09/2023, de Nabo greleiro Senhora Conceição, 0.75 ha, 1.8 kg de semente

DECLARE
    operationSuccess NUMBER;
BEGIN

    operationSuccess := registarSementeira(108, 93, TO_DATE('2023-09-19', 'YYYY-MM-DD'), 1.8, 0.75, NULL);

    IF (operationSuccess = 1) THEN
        DBMS_OUTPUT.put_line('Sementeira registrada com sucesso.');
    ELSE
        DBMS_OUTPUT.put_line('Não foi possível registar sementeira');
    END IF;
END;

----------------------------------------------------------------------------------------------------------------------

