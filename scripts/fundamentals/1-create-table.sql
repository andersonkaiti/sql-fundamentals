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
  email VARCHAR(256),
  created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS orders;

-- postgresql has a table to controls the id's sequency: tablename_colname_seq
-- `colname SERIAL` is equivalent to `colname integer NOT NULL DEFAULT nextval('tablename_colname_seq')`

CREATE TABLE IF NOT EXISTS orders (
  id SERIAL,
  customer_id INT,
  amount NUMERIC(7, 2)
);
