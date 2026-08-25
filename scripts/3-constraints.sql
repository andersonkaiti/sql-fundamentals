\c sql_fundamentals

INSERT INTO customers (first_name)
VALUES ('Zezinho');

SELECT * FROM customers;

-- UPDATE customers
-- SET email = 'zezinho@gmail.com'
-- WHERE id = 21;

-- -- constraints -> limitations
ALTER TABLE customers
ALTER COLUMN email
-- whenever i register a new customer, their email must not be null
SET NOT NULL;
