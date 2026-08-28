import { Client } from 'pg'

const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/sql_fundamentals',
})

await client.connect()

const res = await client.query(`
  SELECT
    cus.*,
    JSON_AGG(ord) orders
  FROM
    customers AS cus LEFT JOIN orders AS ord
  ON
    cus.id = ord.customer_id
  WHERE
    cus.id = 10
  GROUP BY
    cus.id
`)

console.log(res.rows[0])
