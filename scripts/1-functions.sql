\c sql_fundamentals;

-- the keyword "AS" can be omitted
SELECT id, CONCAT(first_name, ' ', last_name) "fullName"
FROM customers;
