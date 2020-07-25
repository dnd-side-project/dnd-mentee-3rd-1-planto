const mariadb = require("mariadb");
require("dotenv").config();

const getConnection = async () => {
  try {
    const conn = await mariadb.createConnection({
      user: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
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
      user: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      host: process.env.DB_HOST,
      port: process.env.DB_PORT,
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
