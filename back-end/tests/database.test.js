const moment = require("moment");
const mariadb = require("../models");

describe("database test", () => {
  let connectcion;

  beforeAll(async () => {
    connectcion = await mariadb.getConnection();
  });

  afterAll(async () => {
    await connectcion.end();
  });

  test("create a connection", async () => {
    expect(connectcion).toBeDefined();
  });

  test("test select query", async () => {
    const rows = await connectcion.query("SELECT 1");
    expect(rows[0]["1"]).toBe(1);
  });
});
