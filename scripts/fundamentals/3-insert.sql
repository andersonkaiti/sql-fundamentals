\c sql_fundamentals

-- INSERT INTO customers
-- VALUES (DEFAULT, 'Anderson', 'Kaiti', DEFAULT, 'anderkaiti@gmail.com');

-- INSERT INTO customers (first_name, last_name, email)
-- VALUES ('José', 'Silva', 'jose@gmail.com');

-- batch insert
-- INSERT INTO customers (first_name, last_name, email)
-- VALUES
--   ('Rose', 'Silva', 'rose@gmail.com'),
--   ('Eduardo', 'Silva', 'eduardo@gmail.com')
-- ;

-- INSERT INTO customers (first_name, last_name, email)
-- VALUES ('Daniel', 'Silva', 'daniel@gmail.com')
-- RETURNING *;

DO $$
DECLARE
  i INT := 1;
  customer_id INT;
  created_customers INT := 0;
BEGIN
  WHILE i <= 20 LOOP
    INSERT INTO customers(first_name, last_name, email)
    VALUES ('Customer-' || i, 'Doe-' || i, 'customer.' || i || '@email.com')
    RETURNING id INTO customer_id;

    INSERT INTO orders(amount, customer_id)
    VALUES (RANDOM() * 1000, customer_id);

    i := i + 1;
    created_customers := created_customers + 1;
  END LOOP;

  RAISE NOTICE '% customers succesfully created', created_customers;
END $$
