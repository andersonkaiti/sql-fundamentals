\c sql_fundamentals

-- -- primary keys are used to define which column (or set of columns) uniquely
-- -- identifies each row
-- ALTER TABLE customers
-- ADD PRIMARY KEY(id);

-- INSERT INTO customers (id, email)
-- VALUES (1, 'johndoe@gmail.com');

-- SELECT * FROM customers;

-- differences between UNIQUE and PRIMARY KEY:
--   * a table can have only one primary key, but many unique constraints
--   * primary key columns cannot be null, while unique columns can
INSERT INTO customers (email) VALUES (null);
INSERT INTO customers (id, email) VALUES (null, 'anderkaiti@gmail.com');

-- SELECT constraint_name, constraint_type, table_name
-- FROM information_schema.table_constraints
-- WHERE table_schema = 'public';
