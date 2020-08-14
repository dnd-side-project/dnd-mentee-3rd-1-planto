import { NextFunction, Request, Response, Router } from "express";
import * as jwt from "jsonwebtoken";
import * as passport from "passport";
import { AuthRequest } from "../../@types/express";

const router = Router();

router.post(
  "/",
  passport.authenticate("local", { session: false }),
  async (req: AuthRequest, res: Response, next: NextFunction) => {
    const user = req.user.getObject();
    const token = jwt.sign({ ...user }, "secret", { expiresIn: "4h" });

    return res.status(200).json({ token });
  }
);

router.get(
  "/",
  passport.authenticate("jwt", { session: false }),
  async (req: Request, res: Response) => {
    return res.status(200).send(req.user);
  }
);

export default router;
