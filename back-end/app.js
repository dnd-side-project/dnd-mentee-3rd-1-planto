const express = require("express");
const path = require("path");
const cookieParser = require("cookie-parser");
const morgan = require("morgan");
const { stream } = require("./config/logger");

const indexRouter = require("./routes/index");
const usersRouter = require("./routes/users");

const morganFormat = process.env.NODE_ENV === "production" ? "combined" : "dev";

const app = express();

app.use(morgan(morganFormat, { stream }));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/users", usersRouter);

module.exports = app;
