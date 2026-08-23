\c sql_fundamentals;

-- -- the keyword "AS" can be omitted
-- SELECT id, CONCAT(first_name, ' ', last_name) "fullName"
-- FROM customers;

-- a row with an email:
-- INSERT INTO customers (first_name, email) VALUES ('Anderson', 'customer.1@email.com');

-- -- how many rows are in the table
-- SELECT COUNT(*) total_of_customers
-- FROM customers;

-- how many rows have the email column
-- SELECT
--   COUNT(
--     -- the DISTINCT keyword returns unique values from the column
--     DISTINCT email
--   ) total_of_customers
-- FROM customers;

-- INSERT INTO orders (customer_id, amount) VALUES (1, 1002);

SELECT
  SUM(amount) "totalRevenue",
  COUNT(id) "totalOrders"
FROM orders;
