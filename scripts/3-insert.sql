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

INSERT INTO customers (first_name, last_name, email)
VALUES ('Daniel', 'Silva', 'daniel@gmail.com')
RETURNING *;
