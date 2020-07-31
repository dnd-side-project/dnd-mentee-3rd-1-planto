import * as express from "express";
import { Request, Response } from "express";
import { createConnection } from "typeorm";
import { User } from "./entity/User";

createConnection()
  .then((connection) => {
    const userRepository = connection.getRepository(User);

    // create express app
    const app = express();
    app.use(express.json());
    app.use(express.urlencoded({ extended: false }));

    // register express routes
    app.get("/users", async (req: Request, res: Response) => {
      const users = await userRepository.find();
      res.json(users);
    });

    app.get("/users/:id", async (req: Request, res: Response) => {
      const user = await userRepository.findOne(req.params.id);
      res.send(user);
    });

    app.post("/users", async (req: Request, res: Response) => {
      const user = await userRepository.create(req.body);
      const result = await userRepository.save(user);
      res.send(result);
    });

    app.delete("/users/:id", async (req: Request, res: Response) => {
      const result = await userRepository.delete(req.params.id);
      res.send(result);
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
