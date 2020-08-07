import { Request, Response, Router } from "express";
import { Like } from "typeorm";
import { Plant } from "../entity/Plant";

const router = Router();

router.get("/", async (request: Request, response: Response) => {
  let search = request.query.name || "";
  const plants = await Plant.find({ where: { name: Like(`%${search}%`) } });
  response.status(200).json(plants);
});

export default router;
