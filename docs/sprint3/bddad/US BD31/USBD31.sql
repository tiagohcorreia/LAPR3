create or replace type dados_fp_receita as object
(
    fp_id     number,
    proporcao float,
    unidade   nvarchar2(225)
);

create or replace type dados_receita is table of dados_fp_receita;



create or replace function existe_receita_com_id(v_receita_id RECEITA_FERTIRREGA.id%type)
    return boolean
    is
    tmp number;
begin
    select count(*)
    into tmp
    from RECEITA_FERTIRREGA
    where ID = v_receita_id;

    if tmp > 0 then
        return true;
    end if;

    return false;
end;



create or replace function fp_registado_em_receita(v_receita_id RECEITA_FERTIRREGA.id%type,
                                                   v_fp_id FATOR_PRODUCAO.id%type)
    return boolean
    is
    tmp number;
begin
    select count(*)
    into tmp
    from RECEITA_FP
    where RECEITA_FP.RECEITA_ID = v_receita_id
      and RECEITA_FP.FP_ID = v_fp_id;

    if tmp > 0 then
        return true;
    end if;

    return false;
end;



-- Função para registrar uma receita de fertirrigação
CREATE OR REPLACE FUNCTION registrar_receita_fertirrega(v_nome RECEITA_FERTIRREGA.nome%type,
                                                        v_dados_receita dados_receita)
    RETURN boolean
    IS
    v_receita_id RECEITA_FERTIRREGA.id%type;
    v_fp_id      FATOR_PRODUCAO.id%type;
    v_proporcao  RECEITA_FP.proporcao%type;
    v_unidade    RECEITA_FP.unidade%type;
BEGIN
    savepoint sp;

    select max(id) + 1
    into v_receita_id
    from RECEITA_FERTIRREGA;

    --v_count:=v_dados_receita.count;
    for i in 1..v_dados_receita.count
        loop

            v_fp_id := v_dados_receita(i).fp_id;
            v_proporcao := v_dados_receita(i).proporcao;
            v_unidade := v_dados_receita(i).unidade;

            if CHECKIFFPEXISTS(v_fp_id) = 0 then
                DBMS_OUTPUT.PUT_LINE('ERRO: O id ' || v_fp_id || ' não existe na tabela FATOR_PRODUÇÃO');
                return false;
            end if;

            if not i > 1 then

                INSERT INTO RECEITA_FERTIRREGA (id, nome)
                VALUES (v_receita_id, v_nome);

                if not existe_receita_com_id(v_receita_id) then
                    rollback to sp;
                    DBMS_OUTPUT.PUT_LINE('ERRO: Não foi possível fazer a inserção na tabela RECEITA_FERTIRREGA');
                    return false;
                end if;

            end if;

            insert into RECEITA_FP(receita_id, fp_id, proporcao, unidade)
            VALUES (v_receita_id, v_fp_id, v_proporcao, v_unidade);

            if not fp_registado_em_receita(v_receita_id, v_fp_id) then
                rollback to sp;
                DBMS_OUTPUT.PUT_LINE('ERRO: Não foi possível fazer a inserção na tabela RECEITA_FP');
                return false;
            end if;

        end loop;

    commit;
    return true;
END;


/*
CASO SUCESSO:

Inserir Receita 22
Tecniferti MOL, Tecniferti, 60 l/ha
Kiplant AllGrip, Asfertglobal, 2 l/ha
soluSOP 52, K+S, 2.5 kg/ha

Fazer pesquisa para mostrar que a receita ficou registada, incluindo os 3 componentes.

 */
declare
    v_nome          RECEITA_FERTIRREGA.nome%type := 'Receita 22';

    --Tecniferti MOL, Tecniferti, 60 l/ha
    dados_fp_1      dados_fp_receita             := dados_fp_receita(14, 60, 'l/ha');
    --Kiplant AllGrip, Asfertglobal, 2 l/ha
    dados_fp_2      dados_fp_receita             := dados_fp_receita(17, 2, 'l/ha');
    --soluSOP 52, K+S, 2.5 kg/ha
    dados_fp_3      dados_fp_receita             := dados_fp_receita(15, 2.5, 'kg/ha');
    v_dados_receita dados_receita                := dados_receita(dados_fp_1, dados_fp_2, dados_fp_3);
begin
    if registrar_receita_fertirrega(v_nome, v_dados_receita) then
        DBMS_OUTPUT.PUT_LINE('SUCESSO');
    else
        DBMS_OUTPUT.PUT_LINE('INSUCESSO');
    end if;
end;

select *
from RECEITA_FERTIRREGA
order by ID desc;

select distinct RECEITA_FERTIRREGA.nome as receita, FATOR_PRODUCAO.nome as fator_producao
from RECEITA_FERTIRREGA,
     FATOR_PRODUCAO,
     RECEITA_FP
where RECEITA_FERTIRREGA.ID = ?
  and RECEITA_FERTIRREGA.ID = RECEITA_FP.RECEITA_ID
  and RECEITA_FP.FP_ID = FATOR_PRODUCAO.ID;


/*
CASO INSUCESSO

Inserir Receita 23
Tecniferti MOL, Tecniferti, 60 l/ha
Kiplant AllFit Plus, Asfertglobal, 2.5 l/ha

Deve dar erro por não existir um dos componentes registado no sistema.
 */
declare
    v_nome          RECEITA_FERTIRREGA.nome%type := 'Receita 23';

    --Tecniferti MOL, Tecniferti, 60 l/ha
    dados_fp_1      dados_fp_receita             := dados_fp_receita(14, 60, 'l/ha');
    --Kiplant AllFit Plus, Asfertglobal, 2.5 l/ha
    dados_fp_2      dados_fp_receita             := dados_fp_receita(-1, 2.5, 'l/ha');
    v_dados_receita dados_receita                := dados_receita(dados_fp_1, dados_fp_2);
begin
    if registrar_receita_fertirrega(v_nome, v_dados_receita) then
        DBMS_OUTPUT.PUT_LINE('SUCESSO');
    else
        DBMS_OUTPUT.PUT_LINE('INSUCESSO');
    end if;
end;

select *
from RECEITA_FERTIRREGA
order by ID desc;
