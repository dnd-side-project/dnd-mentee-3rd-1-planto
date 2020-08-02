import { Connection, createConnection } from "typeorm";

describe("Database", () => {
  let connection: Connection;

  beforeAll(async () => {
    connection = await createConnection("test");
  });

  afterAll(async () => {
    await connection.close();
  });

  test("connect test database", async () => {
    expect(connection).toBeDefined();
    expect(connection).toBeInstanceOf(Connection);
  });
});
