\c sql_fundamentals;

-- -- the keyword "AS" can be omitted
-- SELECT id, CONCAT(first_name, ' ', last_name) "fullName"
-- FROM customers;

-- a row without email:
INSERT INTO customers (first_name) VALUES ('Anderson');

-- how many rows have in the table
SELECT COUNT(*) total_of_customers
FROM customers;

-- how many rows have the email column
SELECT COUNT(email) total_of_customers
FROM customers;
