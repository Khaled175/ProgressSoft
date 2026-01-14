-- 1. Create Lookup Tables
CREATE TABLE MyDepartment (
    Dept_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE MyGender (
    Gender_ID SERIAL PRIMARY KEY,
    Name VARCHAR(20) NOT NULL
);

CREATE TABLE MyUniversity (
    ID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- 2. Create MyEmployee Table (Q1)
CREATE TABLE MyEmployee (
    ID SERIAL PRIMARY KEY,
    LAST_NAME VARCHAR(50) NOT NULL,
    FIRST_NAME VARCHAR(50) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    USERID INT UNIQUE,
    SALARY NUMERIC(10,2) CHECK (SALARY > 0),
    DEPT_ID INT REFERENCES MyDepartment(Dept_ID),
    Gender_ID INT REFERENCES MyGender(Gender_ID),
    University_ID INT REFERENCES MyUniversity(ID),
    EMP_IMAGE BYTEA -- (Postgres equivalent of BLOB)
);

-- Q5: Oracle/Postgres Function to find employees hired after SCOTT
CREATE OR REPLACE FUNCTION F_HR_QUERY(ref_name VARCHAR) 
RETURNS TABLE(emp_name TEXT, hire_dt DATE) AS $$
BEGIN
    RETURN QUERY 
    SELECT (FIRST_NAME || ' ' || LAST_NAME)::TEXT, HIRE_DATE 
    FROM MyEmployee 
    WHERE HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = ref_name LIMIT 1);
END;
$$ LANGUAGE plpgsql;

-- Q6: Procedure to copy data (P_COPY_EMPLOYEE)
CREATE TABLE MyEmployee_update AS SELECT * FROM MyEmployee WITH NO DATA;

CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE()
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO MyEmployee_update SELECT * FROM MyEmployee;
END;
$$;
