\c sql_fundamentals

-- INSERT INTO orders (customer_id, amount)
-- VALUES (123123, 1000);

-- -- a FOREIGN KEY links a column's value in one table to a key (usually the
-- -- PRIMARY KEY) in another table, enforcing referential integrity between them
ALTER TABLE orders
ADD FOREIGN KEY(customer_id) REFERENCES customers(id)
-- what happens to the orders when the referenced customer's id changes or the
-- customer is deleted? the ON UPDATE / ON DELETE clauses define these
-- referential actions:
--   RESTRICT / NO ACTION -> block the change while references still exist
--                           (this is the default behavior)
--   CASCADE              -> propagate the change: on UPDATE the new id is
--                           copied into the referencing rows; on DELETE the
--                           referencing rows are deleted as well
--   SET NULL / SET DEFAULT -> set the referencing column to NULL or its default
ON UPDATE CASCADE
ON DELETE SET NULL;

-- ALTER TABLE orders
-- DROP CONSTRAINT orders_customer_id_fkey;

-- UPDATE customers
-- SET id = 999
-- WHERE id = 5;

DELETE FROM customers
WHERE id = 15;

SELECT * FROM orders
WHERE id = 15;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
