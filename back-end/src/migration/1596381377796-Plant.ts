import { MigrationInterface, QueryRunner } from "typeorm";

export class Plant1596381377796 implements MigrationInterface {
  name = "Plant1596381377796";

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "CREATE TABLE `plant` (`id` varchar(36) NOT NULL, `name` varchar(255) NOT NULL, `water` varchar(255) NOT NULL, `created` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), `updated` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), PRIMARY KEY (`id`)) ENGINE=InnoDB"
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query("DROP TABLE `plant`");
  }
}
