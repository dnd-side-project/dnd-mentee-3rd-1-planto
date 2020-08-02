import { getConnection, MigrationInterface, QueryRunner } from "typeorm";
import { Plant } from "../entity/Plant";

export class PlantSeed1596382214094 implements MigrationInterface {
  private readonly plants: Array<Object> = [
    { name: "마리모", water: "일주일에 한 번씩 갈아주세요." },
    { name: "틸란드시아", water: "2~3일에 한 번씩 분무기로 뿌려주세요." },
    { name: "스투키", water: "겉 흙이 말랐을 때 듬뿍 주세요." },
    { name: "행운목", water: "물이 마르지 않도록 채워주세요." },
    { name: "고무나무", water: "흙을 만졌을 때 마른 느낌이 나면 주세요." },
    {
      name: "이오난사",
      water: "일주일에 한 번 분무기로 촉촉하게 뿌려주세요.",
    },
    { name: "몬스터라", water: "흙을 촉촉하게 유지할 정도로 주세요." },
    {
      name: "필레아 페페",
      water: "여름에는 7~10일에 한 번, 겨울에는 보름에 한 번 정도 주세요.",
    },
  ];

  public async up(queryRunner: QueryRunner): Promise<void> {
    await getConnection()
      .createQueryBuilder()
      .insert()
      .into(Plant)
      .values(this.plants)
      .execute();
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await getConnection()
      .createQueryBuilder()
      .delete()
      .from(Plant)
      .where("name = :name", this.plants)
      .execute();
  }
}
