\c sql_fundamentals

-- SELECT id, first_name AS "firstName", last_name AS "lastName"
-- FROM customers;

-- SELECT * FROM customers;
-- SELECT * FROM orders;

SELECT * FROM customers
ORDER BY id ASC
-- offset is an index, so it starts at 0
OFFSET 10
LIMIT 10
;
