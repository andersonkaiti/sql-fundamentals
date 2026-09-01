import { Client } from 'pg'

export const client = new Client({
  connectionString: 'postgres://root:root@localhost:5432/sql_fundamentals',
})

await client.connect()
