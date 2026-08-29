\c sql_fundamentals

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
  -- first_name = 'Customer-10'
  id = 10
;
