import { Client } from 'pg'

const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/sql_fundamentals',
})

await client.connect()

const res = await client.query(`
  SELECT * FROM customers_summary
  -- ORDER BY total_revenue DESC
`)

console.log(res.rows[0].totalRevenue)
