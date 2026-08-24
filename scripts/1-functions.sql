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

-- aggregate functions: aggregate data
-- so, the functions will combine all values into one value.
-- with the GROUP BY, the data is grouped per customer
SELECT
  customer_id,
  SUM(amount) total_revenue,
  COUNT(id) total_orders,
  MAX(amount) max_order,
  MIN(amount) min_order,
  ROUND(AVG(amount), 2) average_ticket
FROM orders
GROUP BY customer_id
;
