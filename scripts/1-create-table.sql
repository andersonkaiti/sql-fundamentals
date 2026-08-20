-- to connect into the database:
\c sql_fundamentals

DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers (
  -- serial: auto increment
  id SERIAL,
  -- char (CHARACTER)
  -- varchar (VARIABLE CHARACTER)
  first_name VARCHAR(20),
  last_name VARCHAR(60),
  created_at TIMESTAMP DEFAULT NOW()
);
