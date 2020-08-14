import { NextFunction, Request, Response, Router } from "express";
import * as jwt from "jsonwebtoken";
import * as passport from "passport";

const router = Router();

router.post(
  "/",
  passport.authenticate("local", { session: false }),
  async (req: Request, res: Response, next: NextFunction) => {
    const token = jwt.sign(await req.user.toJson(), "test");

    return res.json({ token });
  }
);

router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  async (req: Request, res: Response) => {
    return res.send(req.user);
  }
);

export default router;
