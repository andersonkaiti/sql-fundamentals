\c sql_fundamentals

DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE IF NOT EXISTS bank_accounts (
  id SERIAL PRIMARY KEY,
  user_id INT,
  balance NUMERIC(10, 2) CHECK (balance >= 0),
  updated_by INT
);

-- audit table: one row per balance change (new + previous balance)
DROP TABLE IF EXISTS bank_accounts_tx_logs;

CREATE TABLE IF NOT EXISTS bank_accounts_tx_logs (
  id SERIAL PRIMARY KEY,
  bank_account_id INT,
  updated_by INT,
  current_balance NUMERIC(10, 2) CHECK(current_balance >= 0),
  previous_balance NUMERIC(10, 2) CHECK(previous_balance >= 0),

  FOREIGN KEY(bank_account_id) REFERENCES bank_accounts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TRIGGER IF EXISTS bank_accounts_tx_logs_trigger ON bank_accounts;

DROP FUNCTION IF EXISTS log_bank_account_tx_trigger;

-- writes an audit row using NEW (after the change) and OLD (before it)
CREATE OR REPLACE FUNCTION log_bank_account_tx_trigger()
  RETURNS TRIGGER AS
    $$
      BEGIN
        INSERT INTO bank_accounts_tx_logs(
          bank_account_id,
          updated_by,
          current_balance,
          previous_balance
        ) VALUES (
          NEW.id,
          NEW.updated_by,
          NEW.balance,
          OLD.balance
        );

        RETURN NEW;
      END;
    $$
LANGUAGE plpgsql;

CREATE TRIGGER bank_accounts_tx_logs_trigger
AFTER UPDATE OR INSERT ON bank_accounts
FOR EACH ROW EXECUTE FUNCTION log_bank_account_tx_trigger();

INSERT INTO
  bank_accounts (user_id, balance)
VALUES
  (1, 1000),
  (2, 2000);

-- transfer 100 from account 1 to account 2; each update fires the trigger
UPDATE
  bank_accounts
SET
  balance = balance - 100
WHERE
  user_id = 1;

UPDATE
  bank_accounts
SET
  balance = balance + 100
WHERE
  user_id = 2;

SELECT * FROM bank_accounts_tx_logs;
