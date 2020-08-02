import { Connection, createConnection, Repository } from "typeorm";
import { Plant } from "./../src/entity/Plant";

describe("Database", () => {
  let connection: Connection;

  beforeAll(async () => {
    connection = await createConnection("test");
  });

  afterAll(async () => {
    await connection.close();
  });

  test("connect test database", async () => {
    expect(connection).toBeDefined();
    expect(connection).toBeInstanceOf(Connection);
  });

  describe("Plant", () => {
    let plantRepository: Repository<Plant>;

    beforeAll(() => {
      plantRepository = connection.getRepository(Plant);
    });

    test("create a plant", async () => {
      const plant = new Plant();
      plant.name = "스투키";
      plant.water = "한 달에 한 번";

      await plantRepository.save(plant);
      expect(plant).toBeInstanceOf(Plant);
    });

    test("find a plant", async () => {
      const plant = await plantRepository.findOne({ name: "스투키" });

      expect(plant).toBeInstanceOf(Plant);
      expect(plant.name).toEqual("스투키");
      expect(plant.water).toEqual("한 달에 한 번");
    });

    test("delete a plant", async () => {
      const response = await plantRepository.delete({ name: "스투키" });

      expect(response.affected).toBe(1);
    });
  });
});
