\c sql_fundamentals

-- setup: recreate the table from scratch so the script is repeatable.
DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE IF NOT EXISTS bank_accounts (
  id SERIAL PRIMARY KEY,
  user_id INT,
  -- balance can never go below zero; this constraint is what makes the
  -- transaction below atomic in practice (see the debit statement).
  balance NUMERIC(10, 2) CHECK (balance >= 0)
);

-- seed two accounts to transfer money between.
INSERT INTO
  bank_accounts (user_id, balance)
VALUES
  (1, 500),
  (2, 100)
;

-- BEGIN opens a transaction: every statement that follows is grouped into a
-- single atomic unit of work, so either all of them take effect or none do.
BEGIN;

-- credit 200 to user 1's account.
UPDATE
  bank_accounts
SET
  balance = balance + 200
WHERE
  user_id = 1;

-- debit 200 from user 2's account. the CHECK (balance >= 0) constraint would
-- abort this statement if it left the balance negative, rolling back the whole
-- transaction and preventing the credit above from being applied on its own.
UPDATE
  bank_accounts
SET
  balance = balance - 200
WHERE
  user_id = 2;

-- COMMIT persists every change made since BEGIN as a single atomic step. if any
-- statement had failed the transaction would be rolled back instead, leaving the
-- balances exactly as they were before BEGIN (use ROLLBACK to discard manually).
COMMIT;

-- verify the result: user 1 should have 700 and user 2 should have -100... but
-- the CHECK constraint blocks that, so the transaction fails and both balances
-- stay at their seeded values (500 and 100).
SELECT * FROM bank_accounts;
