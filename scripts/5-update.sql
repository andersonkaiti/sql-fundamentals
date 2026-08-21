\c sql_fundamentals

UPDATE customers
SET
    first_name = 'Anderson',
    last_name = 'Kaiti',
    email = 'anderkaiti@gmail.com'
-- WHERE id BETWEEN 4 AND 8
WHERE id = 1
RETURNING *
;
