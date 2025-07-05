CREATE OR REPLACE PROCEDURE generate_salary_slip(p_month IN DATE) AS
    v_bonus NUMBER := 0;
    v_tax NUMBER := 0;
    v_net NUMBER := 0;
BEGIN
    FOR emp IN (
        SELECT e.emp_id, e.base_salary, a.days_present
        FROM employees e
        JOIN attendance a ON e.emp_id = a.emp_id
        WHERE a.month = p_month
    ) LOOP
        v_bonus := CASE WHEN emp.days_present > 25 THEN 2000 ELSE 0 END;
        v_tax := emp.base_salary * 0.10;
        v_net := emp.base_salary + v_bonus - v_tax;

        INSERT INTO salary_slips (
            slip_id, emp_id, month, base_salary, bonus, tax_deducted, net_salary, generated_on
        ) VALUES (
            slip_seq.NEXTVAL, emp.emp_id, p_month, emp.base_salary, v_bonus, v_tax, v_net, SYSDATE
        );
    END LOOP;
END;
/