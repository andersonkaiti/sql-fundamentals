\c sql_fundamentals

-- one-off seed block: inserts ~50k customers (and one order each) so the
-- table is large enough to make the difference between a seq scan and an
-- index scan visible in EXPLAIN. run it once, then keep it commented out.
-- DO $$
-- DECLARE
--   i INT := 21;
--   customer_id INT;
--   created_customers INT := 0;
-- BEGIN
--   WHILE i <= 50000 LOOP
--     INSERT INTO customers(first_name, last_name, email)
--     VALUES ('Customer-' || i, 'Doe-' || i, 'customer.' || i || '@email.com')
--     RETURNING id INTO customer_id;

--     INSERT INTO orders(amount, customer_id)
--     VALUES (RANDOM() * 1000, customer_id);

--     i := i + 1;
--     created_customers := created_customers + 1;
--   END LOOP;

--   RAISE NOTICE '% customers succesfully created', created_customers;
-- END $$;

-- drop the index first so this script can be re-run from a clean state
DROP INDEX customers_first_name_index;

-- create an index on "first_name" so lookups on that column can use an
-- index scan instead of reading the whole table
CREATE INDEX IF NOT EXISTS
  customers_first_name_index
ON
  customers(first_name);

-- EXPLAIN ANALYSE VERBOSE:
--   runs the query and reports its execution plan, with detailed
--   timing and row statistics.
--
-- the plan depends on whether the filtered column is indexed:
--
--   seq scan (sequential scan)
--     no index (e.g. "first_name") -> the database reads every row,
--     one by one, to find matches.
--
--   index scan
--     indexed column (e.g. "id", the primary key) -> the planner jumps
--     straight to the matching rows instead of scanning the whole table.
--     an index works like the index at the back of a book: instead of
--     reading every page, it points straight to the row you're looking for.
EXPLAIN ANALYSE VERBOSE
SELECT * FROM
  customers
WHERE
  -- "first_name" is now indexed, so this lookup uses an index scan
  first_name = 'Customer-10'
  -- alternative filter (commented out): postgres automatically creates an index
  -- whenever a column is declared PRIMARY KEY or UNIQUE, so "id" and "email"
  -- are already indexed and can use an index scan too.
  -- email = 'customer.10@example.com' AND id = 10
;

-- total size of the "customers" table in bytes, including its indexes and data
SELECT pg_total_relation_size('customers');

-- list every index defined on the "customers" table
SELECT * FROM
  pg_indexes
WHERE
  tablename = 'customers'
;
