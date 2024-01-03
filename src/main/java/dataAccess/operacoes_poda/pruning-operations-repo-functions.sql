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
        DBMS_OUTPUT.put_line('Variedade não existe na parcela especificada.');
        return returnValue; -- 0 Não Sucesso
    END IF;

    -- Verificar se area maior que area da parcela
    IF CHECK_IF_AREA_IS_GREATER_THEN_PARCEL(parcelaId, area_v) = 1 THEN
        DBMS_OUTPUT.put_line('Area especificada maior que area da parcela.');
        RETURN returnValue;
    end if;

    --Verificar se quantidade maior
    IF CHECK_IF_QUANTITY_IS_BIGGER(parcelaId, variedadeId, quantidade_v) = 1 THEN
        DBMS_OUTPUT.put_line('Quantidade inválida');
        RETURN returnValue;
    end if;

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