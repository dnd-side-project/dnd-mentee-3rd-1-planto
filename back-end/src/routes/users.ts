import { Request, Response, Router } from "express";
import { User } from "../entity/User";

const router = Router();

router.post("/", async (request: Request, response: Response) => {
  const user = new User();

  // user.email = request.body.email;
  // user.username = request.body.username;
  // user.password = request.body.password;

  response.status(201).json(user);
});

export default router;
