import { Client } from 'pg'

const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/sql_fundamentals',
})

await client.connect()

const res = await client.query(`
  SELECT
    cus.*,
    NO_EMPTY_OBJECT_ARRAY(
      COUNT(ord.id),
      JSON_AGG(
        JSON_STRIP_NULLS(
          JSON_BUILD_OBJECT(
            'id', ord.id,
            'amount', ord.amount
          )
        )
      )
    ) orders
  FROM
    customers AS cus LEFT JOIN orders AS ord
  ON
    cus.id = ord.customer_id
  WHERE
    cus.id = 9
  GROUP BY
    cus.id
`)

console.log(res.rows[0])
