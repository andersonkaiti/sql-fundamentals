import { client } from './db/client'
import { startTransaction } from './db/start-tx'

await startTransaction(async (tx) => {
  // pessimistic locking: FOR UPDATE locks the row until the transaction ends,
  // preventing other transactions from reading/updating the stock in parallel and
  // avoiding a race condition (e.g. two simultaneous purchases of the last product).
  const {
    rows: [row],
  } = await tx.query(`
    SELECT
      quantity
    FROM
      products
    WHERE
      id = 1
    FOR UPDATE
  `)

  if (row.quantity < 1) {
    throw new Error('Not enough products')
  }

  await tx.query(`
    UPDATE
      products
    SET
      quantity = quantity - 1
    WHERE
      id = 1
  `)
})

client.end()
