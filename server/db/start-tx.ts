import type { Client } from 'pg'
import { client } from './client'

type SavepointCallbackFn = () => Promise<void>

type SavepointFn = (
  savepointName: string,
  savepointCallback: SavepointCallbackFn,
) => Promise<void>

type StartTransactionCallback = (
  client: Client,
  savepointCallback: SavepointFn,
) => Promise<void>

export async function startTransaction(callback: StartTransactionCallback) {
  async function createSavepoint(
    savepointName: string,
    savepointCallback: SavepointCallbackFn,
  ) {
    try {
      await client.query(`SAVEPOINT ${savepointName}`)

      await savepointCallback()
    } catch {
      await client.query(`ROLLBACK TO SAVEPOINT ${savepointName}`)
    }
  }

  try {
    await client.query('BEGIN')

    await callback(client, createSavepoint)

    await client.query('COMMIT')
  } catch {
    await client.query('ROLLBACK')
  }
}
