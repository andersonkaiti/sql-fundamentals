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
  -- the customer_id cannot be used here without a GROUP BY or an aggregate
  -- function, because the aggregation combines all values into one value, so
  -- how can the query know the customer_id if the final value is from all
  -- aggregated customers?
  customer_id,
  SUM(amount) total_revenue,
  COUNT(id) total_orders,
  MAX(amount) max_order,
  MIN(amount) min_order,
  ROUND(AVG(amount), 2) average_ticket
FROM orders
-- the WHERE needs to come before the GROUP BY
WHERE customer_id > 10
GROUP BY customer_id
-- the HAVING clause is a filter, but it can be used after the aggregation
HAVING SUM(amount) BETWEEN 500 AND 1000
ORDER BY average_ticket
;
