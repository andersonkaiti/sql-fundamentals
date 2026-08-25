\c sql_fundamentals

-- DROP VIEW IF EXISTS customers_summary;

-- Views (a.k.a. virtual tables) are named, stored queries you can select from like a table
CREATE OR REPLACE VIEW customers_summary AS 
  SELECT
    customer_id,
    SUM(amount) total_revenue,
    COUNT(id) total_orders,
    MAX(amount) max_order,
    MIN(amount) min_order,
    ROUND(AVG(amount), 2) average_ticket
  FROM orders
  GROUP BY customer_id
  ORDER BY total_orders;

ALTER VIEW customers_summary
RENAME COLUMN
total_revenue TO "totalRevenue";

SELECT * FROM customers_summary
WHERE total_revenue BETWEEN 500 AND 1000
-- ORDER BY total_revenue DESC
;

SELECT * FROM pg_views
WHERE viewname = 'customers_summary';
