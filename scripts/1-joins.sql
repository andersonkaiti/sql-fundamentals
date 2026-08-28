\c sql_fundamentals

-- INSERT INTO orders (customer_id, amount)
-- VALUES (10, 199.95);

-- DELETE FROM orders
-- WHERE customer_id = 9;

-- -- a JOIN combines rows from two or more tables.
-- -- to write one, you need two things:
-- SELECT * FROM
--   -- 1. the tables you want to join together
--   customers AS cus JOIN orders AS ord
-- ON
--   -- 2. the condition that relates the tables to each other.
--   --    the order of the comparison doesn't matter.
--   --    since both tables have an id column, ambiguous columns must be
--   --    qualified with the table name (e.g. customers.id).
--   cus.id = ord.customer_id
-- WHERE cus.id = 9;

INSERT INTO orders (amount)
VALUES (99);

SELECT * FROM
  -- the type of JOIN decides which rows are kept when there's no match:
  --
  --   INNER JOIN  -> only rows that match on both sides (the intersection)
  --   LEFT JOIN   -> all rows from the left table (customers), NULLs on the right
  --   RIGHT JOIN  -> all rows from the right table (orders), NULLs on the left
  --   FULL JOIN   -> all rows from both tables, NULLs wherever there's no match
  --
  customers AS cus LEFT JOIN orders AS ord
ON
  cus.id = ord.customer_id;
