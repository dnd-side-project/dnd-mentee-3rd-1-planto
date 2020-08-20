import * as express from "express";
import * as fs from "fs";
import * as http from "http";
import * as https from "https";
import * as passport from "passport";
import "reflect-metadata";
import { createConnection } from "typeorm";
import passportStrategy from "../config/passport";
import authRouter from "./routes/auth";
import plantsRouter from "./routes/plants";
import userPlantsRouter from "./routes/userPlants";
import usersRouter from "./routes/users";

createConnection()
  .then(() => {
    // create express app
    const app = express();
    app.use(express.json());
    app.use(express.urlencoded({ extended: false }));
    app.use(passport.initialize());
    passportStrategy();

    // register express routes
    app.use("/users", usersRouter);
    app.use("/plants", plantsRouter);
    app.use("/user-plants", userPlantsRouter);
    app.use("/auth", authRouter);

    // setup express app here
    const option =
      process.env.NODE_ENV === "production"
        ? {
            ca: fs.readFileSync(
              "/etc/letsencrypt/live/pers0n4.dev/fullchain.pem"
            ),
            cert: fs.readFileSync("/etc/letsencrypt/live/pers0n4.dev/cert.pem"),
            key: fs.readFileSync(
              "/etc/letsencrypt/live/pers0n4.dev/privkey.pem"
            ),
          }
        : undefined;

    // start express server
    if (option) {
      https.createServer(option, app).listen(443, () => {
        console.log("Express server has started on port 443 on production");
      });
    }
    http.createServer(app).listen(3000, () => {
      console.log("Express server has started on port 3000 on development");
    });
  })
  .catch((error) => console.log(error));
