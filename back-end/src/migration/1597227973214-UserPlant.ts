import { MigrationInterface, QueryRunner } from "typeorm";

export class UserPlant1597227973214 implements MigrationInterface {
  name = "UserPlant1597227973214";

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "ALTER TABLE `user_plant` ADD `user_id` varchar(36) NULL"
    );
    await queryRunner.query(
      "ALTER TABLE `user_plant` ADD CONSTRAINT `FK_c9bd3f2baf8decd753f5044fae0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION"
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "ALTER TABLE `user_plant` DROP FOREIGN KEY `FK_c9bd3f2baf8decd753f5044fae0`"
    );
    await queryRunner.query("ALTER TABLE `user_plant` DROP COLUMN `user_id`");
  }
}
