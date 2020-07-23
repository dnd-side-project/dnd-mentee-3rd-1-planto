const mariadb = require("mariadb");

const getConnection = async () => {
  try {
    const conn = await mariadb.createConnection({
      user: "user",
      password: "user",
      host: "localhost",
      connectTimeout: 1000,
    });

    return conn;
  } catch (error) {
    console.error(error);
  }
};

const getPool = () => {
  try {
    const pool = mariadb.createPool({
      user: "user",
      password: "user",
      host: "localhost",
      connectTimeout: 1000,
      connectionLimit: 3,
    });

    return pool;
  } catch (error) {
    console.error(error);
  }
};

module.exports = {
  getConnection,
  getPool,
};
