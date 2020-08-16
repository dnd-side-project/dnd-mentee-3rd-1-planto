import { Request } from "express";

declare module "express" {
  interface Request {
    user?: import("../src/entity/User").User;
  }
}

export interface AuthRequest extends Request {
  user?: import("../src/entity/User").User;
}
