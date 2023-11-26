SELECT
    p.id AS parcela_id,
    EXTRACT(MONTH FROM TO_DATE(o.data, 'DD-MM-YYYY')) AS month,
    EXTRACT(YEAR FROM TO_DATE(o.data, 'DD-MM-YYYY')) AS year,
    SUM(r.duracao) AS total_rega
FROM
    Parcela p
        JOIN
    Rega r ON p.id = r.parcela_id
        JOIN
    Operacao_Agricola o ON r.operacao_id = o.id
WHERE
    TO_DATE(o.data, 'DD-MM-YYYY') BETWEEN TO_DATE('start_date', 'DD-MM-YYYY') AND TO_DATE('end_date', 'DD-MM-YYYY')
GROUP BY
    p.id, EXTRACT(MONTH FROM TO_DATE(o.data, 'DD-MM-YYYY')), EXTRACT(YEAR FROM TO_DATE(o.data, 'DD-MM-YYYY'))
ORDER BY
    p.id, EXTRACT(YEAR FROM TO_DATE(o.data, 'DD-MM-YYYY')), EXTRACT(MONTH FROM TO_DATE(o.data, 'DD-MM-YYYY'));