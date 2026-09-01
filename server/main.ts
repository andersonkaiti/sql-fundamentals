import { client } from './db/client'
import { startTransaction } from './db/start-tx'

await startTransaction(async (tx, createSavepoint) => {
  await tx.query(
    `
      INSERT INTO
        customers
      (first_name, last_name)
        VALUES
      ($1, $2)
    `,
    ['Anderson', 'Kaiti'],
  )

  await createSavepoint('sp_01', async () => {
    await tx.query(`
      UPDATE
        bank_accounts
      SET
        balance = balance - 2000
      WHERE
        user_id = 1;  
    `)

    await tx.query(`
      UPDATE
        bank_accounts
      SET
        balance = balance - 2000
      WHERE
        user_id = 2;  
    `)
  })
})

client.end()
