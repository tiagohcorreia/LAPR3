
SET SERVEROUTPUT ON;


BEGIN
    registrarColheita(
            p_id => 1,
            parcelaId => 1,
            produtoId => 1,
            data => TO_DATE('2024-02-22', 'YYYY-MM-DD'),
            quantidade => 15,
            metodoExecucaoId => 1,
            current_date_in => SYSDATE
        );
    DBMS_OUTPUT.put_line('Operação de colheita registrada com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line('Erro ao registrar a operação de colheita: ' || SQLERRM);
END;
/
