\c sql_fundamentals

-- SELECT id, first_name AS "firstName", last_name AS "lastName"
-- FROM customers;

-- SELECT * FROM customers;
-- SELECT * FROM orders;

-- SELECT * FROM customers
-- ORDER BY id ASC
-- -- offset is an index, so it starts at 0
-- OFFSET 10
-- LIMIT 10
-- ;

-- SELECT * FROM customers
-- WHERE (id >= 20 OR last_name = 'Doe-1') OR first_name = 'Customer-2'
-- ;

-- SELECT * FROM customers
-- WHERE
--   -- id IN(1, 2, 3)
--   -- id BETWEEN 12 AND 16
--   -- id NOT BETWEEN 12 AND 16
--   -- id NOT IN(1, 2, 3)
--   -- email IS NULL
--   -- first_name LIKE '%2%'
--   first_name ILIKE '%customer%'
--   -- iLIKE means 'Insensitive LIKE'
-- ;

SELECT * FROM customers
ORDER BY id;
