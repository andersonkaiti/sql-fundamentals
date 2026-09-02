\c sql_fundamentals

-- INSERT INTO orders (customer_id, amount)
-- VALUES (1, 300);

-- -- select the client data and the total spent
-- SELECT
--   cus.*,
--   SUM(ord.amount) total_spent
-- FROM
--   customers cus LEFT JOIN orders ord
-- ON
--   ord.customer_id = cus.id
-- GROUP BY
--   cus.id
-- ORDER BY
--   id
-- ;

-- the average order amount, used below as the threshold to compare against.
SELECT AVG(amount) FROM orders;

-- select the customers whose total spent is above the average order amount.
SELECT
  cus.*,
  SUM(ord.amount) total_spent,
  -- a subquery (a.k.a. inner query) is a query nested inside another one.
  -- this is a correlated subquery: it references cus.id from the outer query,
  -- so it runs once per customer to fetch that customer's largest order.
  (
    SELECT
      MAX(ord.amount)
    FROM
      orders
    WHERE
      id = cus.id
  ) max_value
FROM
  customers cus LEFT JOIN orders ord
ON
  ord.customer_id = cus.id
GROUP BY
  cus.id
-- HAVING filters the grouped rows (WHERE can't be used here because the filter
-- depends on the SUM aggregate). the subquery computes the average once and the
-- outer query keeps only customers whose total is greater than it.
HAVING
  SUM(ord.amount) > (
    SELECT
      AVG(amount)
    FROM
      orders
  )
ORDER BY
  id
;