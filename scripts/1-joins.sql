\c sql_fundamentals

INSERT INTO orders (customer_id, amount)
VALUES (10, 199.95);

-- a JOIN combines rows from two or more tables.
-- to write one, you need two things:
SELECT * FROM
  -- 1. the tables you want to join together
  customers AS cus JOIN orders AS ord
ON
  -- 2. the condition that relates the tables to each other.
  --    the order of the comparison doesn't matter.
  --    since both tables have an id column, ambiguous columns must be
  --    qualified with the table name (e.g. customers.id).
  cus.id = ord.customer_id
WHERE cus.id = 10;
