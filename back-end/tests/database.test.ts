import { Connection, createConnection } from "typeorm";

describe("database", () => {
  let connection: Connection;

  beforeAll(async () => {
    connection = await createConnection();
  });

  afterAll(async () => {
    await connection.close();
  });

  test("connect database server", async () => {
    expect(connection).toBeDefined();
    expect(connection).toBeInstanceOf(Connection);
  });
});
