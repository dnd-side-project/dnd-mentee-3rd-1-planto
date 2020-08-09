const express = require("express");
const router = express.Router();

const db = require("../models");

/* GET home page. */
router.get("/", function (req, res, next) {
  res.render("index", { title: "Express" });
});

router.get("/db", async (req, res) => {
  let conn;
  try {
    conn = await db.getConnection();
    const result = await conn.query("SELECT now()");
    res.send(result);
  } catch (error) {
    // console.error(error);
    res.status(500).send("Database connection error");
  } finally {
    if (conn) {
      conn.end();
    }
  }
});

module.exports = router;
