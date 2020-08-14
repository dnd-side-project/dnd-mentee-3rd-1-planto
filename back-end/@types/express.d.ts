import {} from "express";

declare module "express" {
  interface Request {
    user?: import("../src/entity/User").User;
  }
}
