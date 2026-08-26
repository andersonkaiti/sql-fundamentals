\c sql_fundamentals

-- primary keys are used to define which column (or set of columns) uniquely
-- identifies each row
ALTER TABLE customers
ADD PRIMARY KEY(id);

INSERT INTO customers (id, email)
VALUES (1, 'johndoe@gmail.com');

SELECT * FROM customers;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
