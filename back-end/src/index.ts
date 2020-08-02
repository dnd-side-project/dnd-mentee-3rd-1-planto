import * as express from "express";
import { Request, Response } from "express";
import { createConnection } from "typeorm";
import { Plant } from "./entity/Plant";

createConnection()
  .then((connection) => {
    // create express app
    const app = express();
    app.use(express.json());
    app.use(express.urlencoded({ extended: false }));

    // register express routes
    app.get("/plants", async (req: Request, res: Response) => {
      const plants = await Plant.find();
      res.json(plants);
    });

    // setup express app here
    // ...

    // start express server
    app.listen(3000);

    console.log(
      "Express server has started on port 3000. Open http://localhost:3000/users to see results"
    );
  })
  .catch((error) => console.log(error));
