\c sql_fundamentals

-- Views (a.k.a. virtual tables) are named, stored queries you can select from like a table
CREATE VIEW  customers_summary AS 
  SELECT
    customer_id,
    SUM(amount) total_revenue,
    COUNT(id) total_orders,
    MAX(amount) max_order,
    MIN(amount) min_order,
    ROUND(AVG(amount), 2) average_ticket
  FROM orders
  GROUP BY customer_id
  ORDER BY customer_id;

SELECT * FROM customers_summary
WHERE total_revenue BETWEEN 500 AND 1000
ORDER BY total_revenue DESC;
