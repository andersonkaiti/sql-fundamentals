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

-- ALTER TABLE customers
-- -- when two values are inputted, this will be a composite unique constraint and
-- -- even if, for example, the email is the same for another row, if the
-- -- combination of id and email is unique, then this is allowed
-- ADD UNIQUE(email, id);

-- INSERT INTO customers (first_name, email)
-- VALUES ('Zé', null);

-- ALTER TABLE customers
-- DROP CONSTRAINT customers_email_key;

ALTER TABLE orders
-- this ensures the amount's value is equal to or greater than 0, so this
-- query will fail
ADD CHECK(amount >= 0);

INSERT INTO orders (customer_id, amount)
VALUES
  (10, 10)
  -- (10, -100)
;

UPDATE orders
SET amount = -10
WHERE id = 1;

ALTER TABLE orders
DROP CONSTRAINT orders_amount_check;

SELECT * FROM orders
ORDER BY id DESC;

SELECT constraint_name, constraint_type, table_name
FROM information_schema.table_constraints
WHERE table_schema = 'public';
