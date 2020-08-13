import * as bcrypt from "bcrypt";
import { Request, Response, Router } from "express";
import { User } from "../entity/User";

const router = Router();

const saltRounds = 10;

router.post("/", async (request: Request, response: Response) => {
  const user = new User();

  user.email = request.body.email;
  user.username = request.body.username;
  user.password = await bcrypt.hash(request.body.password, saltRounds);
  await user.save();

  response.status(201).json(user);
});

router.get("/", async (request: Request, response: Response) => {
  const users = await User.find();

  response.status(200).json(users);
});

export default router;
