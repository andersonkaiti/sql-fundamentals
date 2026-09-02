\c sql_fundamentals

ALTER TABLE customers
ADD COLUMN updated_at
TIMESTAMP DEFAULT NOW();

-- trigger function: sets updated_at to the current timestamp on the row
-- being modified. NEW holds the row's new values; returning it applies them.
CREATE OR REPLACE FUNCTION set_updated_at_trigger()
  RETURNS TRIGGER AS
    $$
      BEGIN
        NEW.updated_at = NOW();
        RETURN NEW;
      END;
    $$
LANGUAGE plpgsql;

-- fire the function before every row update on customers, so updated_at is
-- refreshed automatically without the application having to set it.
CREATE TRIGGER customers_update_updated_at
BEFORE UPDATE ON customers
FOR EACH ROW EXECUTE FUNCTION set_updated_at_trigger();

UPDATE
  customers
SET
  last_name = 'Silva'
WHERE
  id = 1;

SELECT * FROM
  customers
WHERE
  id = 1;
