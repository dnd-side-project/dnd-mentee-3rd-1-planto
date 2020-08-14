import * as express from "express";
import * as passport from "passport";
import { createConnection } from "typeorm";
import passportStrategy from "../config/passport";
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

    // setup express app here
    // ...

    // start express server
    app.listen(3000);

    console.log(
      "Express server has started on port 3000. Open http://localhost:3000/users to see results"
    );
  })
  .catch((error) => console.log(error));
