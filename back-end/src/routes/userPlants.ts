import { Router, Request, Response } from "express";
import { Plant } from "../entity/Plant";
import { UserPlant } from "../entity/UserPlant";

const router = Router();

router.get("/", async (request: Request, response: Response) => {
  const userPlants = await UserPlant.find();
  response.status(200).json(userPlants);
});

router.post("/", async (request: Request, response: Response) => {
  const userPlant = new UserPlant();
  const plant = await Plant.findOne(request.body.plant);
  userPlant.plant = plant;
  userPlant.name = plant.name;
  userPlant.water = plant.water;
  await userPlant.save();
  response.status(201).json(userPlant);
});

router.get("/:id", async (request: Request, response: Response) => {
  const userPlant = await UserPlant.findOne(request.params.id);
  if (!userPlant) {
    response.sendStatus(404);
  }
  response.status(200).json(userPlant);
});

export default router;
