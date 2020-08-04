import { MigrationInterface, QueryRunner } from "typeorm";

export class UserPlant1596545341073 implements MigrationInterface {
  name = "UserPlant1596545341073";

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "CREATE TABLE `user_plant` (`id` varchar(36) NOT NULL, `water` varchar(255) NOT NULL, `created` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), `updated` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), `plantId` varchar(36) NULL, PRIMARY KEY (`id`)) ENGINE=InnoDB"
    );
    await queryRunner.query(
      "ALTER TABLE `user_plant` ADD CONSTRAINT `FK_151940ee2ac06468115635ee4da` FOREIGN KEY (`plantId`) REFERENCES `plant`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION"
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      "ALTER TABLE `user_plant` DROP FOREIGN KEY `FK_151940ee2ac06468115635ee4da`"
    );
    await queryRunner.query("DROP TABLE `user_plant`");
  }
}
