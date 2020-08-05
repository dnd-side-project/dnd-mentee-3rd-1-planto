import { Router, Request, Response } from "express";
import { Plant } from "../entity/Plant";

const router = Router();

router.get("/", async (request: Request, response: Response) => {
  const plants = await Plant.find();
  response.status(200).json(plants);
});

export default router;
