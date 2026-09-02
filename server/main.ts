import { client } from './db/client'
import { startTransaction } from './db/start-tx'

await startTransaction(async (tx) => {
  const {
    rows: [row],
  } = await tx.query(`
    SELECT
      quantity
    FROM
      products
    WHERE
      id = 1
  `)

  if (row.quantity < 1) {
    throw new Error('Not enough products')
  }

  // Decrement the stock by one, but only if the quantity still matches the
  // value we just read. This optimistic-concurrency check ensures the update
  // is skipped when another transaction changed the row in the meantime,
  // preventing a lost update / race condition.
  await tx.query(
    `
      UPDATE
        products
      SET
        quantity = quantity - 1
      WHERE
        id = 1 AND quantity = $1
    `,
    [row.quantity],
  )
})

client.end()
