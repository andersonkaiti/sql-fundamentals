\c sql_fundamentals

-- INSERT INTO orders (customer_id, amount)
-- VALUES (123123, 1000);

-- a FOREIGN KEY links a column's value in one table to a key (usually the
-- PRIMARY KEY) in another table, enforcing referential integrity between them
ALTER TABLE orders
ADD FOREIGN KEY(customer_id) REFERENCES customers(id);

ALTER TABLE orders
DROP CONSTRAINT orders_customer_id_fkey;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
