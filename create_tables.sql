CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(100),
    base_salary NUMBER
);

CREATE TABLE attendance (
    emp_id NUMBER,
    month DATE,
    days_present NUMBER,
    PRIMARY KEY (emp_id, month),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE salary_slips (
    slip_id NUMBER PRIMARY KEY,
    emp_id NUMBER,
    month DATE,
    base_salary NUMBER,
    bonus NUMBER,
    tax_deducted NUMBER,
    net_salary NUMBER,
    generated_on DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE SEQUENCE slip_seq START WITH 1001 INCREMENT BY 1;