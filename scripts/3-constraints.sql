\c sql_fundamentals

-- INSERT INTO customers (first_name)
-- VALUES ('Zezinho');

-- SELECT * FROM customers;

-- UPDATE customers
-- SET email = 'zezinho@gmail.com'
-- WHERE id = 21;

-- -- -- constraints -> limitations
-- ALTER TABLE customers
-- ALTER COLUMN email
-- -- whenever i register a new customer, their email must not be null
-- SET NOT NULL;

ALTER TABLE customers
-- this constraint grants that the email never will be null neither duplicated
ADD UNIQUE(email);

INSERT INTO customers (first_name, email)
VALUES ('Zé', null);

ALTER TABLE customers
DROP CONSTRAINT customers_email_key;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
