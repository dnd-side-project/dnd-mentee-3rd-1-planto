import { MigrationInterface, QueryRunner } from "typeorm";

export class PlantMigration1596373829960 implements MigrationInterface {
  name = "PlantMigration1596373829960";

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "ALTER TABLE `plant` ADD `created` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)"
    );
    await queryRunner.query(
      "ALTER TABLE `plant` ADD `updated` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)"
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query("ALTER TABLE `plant` DROP COLUMN `updated`");
    await queryRunner.query("ALTER TABLE `plant` DROP COLUMN `created`");
  }
}
