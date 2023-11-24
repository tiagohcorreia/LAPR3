CREATE OR REPLACE FUNCTION fncMetodosExecucao
RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
BEGIN
OPEN v_cursor FOR
SELECT * FROM Metodo_Execucao
ORDER BY id;
RETURN v_cursor;
END fncMetodosExecucao;
/


