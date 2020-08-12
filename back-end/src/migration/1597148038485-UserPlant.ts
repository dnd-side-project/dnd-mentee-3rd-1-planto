import {MigrationInterface, QueryRunner} from "typeorm";

export class UserPlant1597148038485 implements MigrationInterface {
    name = 'UserPlant1597148038485'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE `user_plant` ADD `name` varchar(255) NOT NULL");
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query("ALTER TABLE `user_plant` DROP COLUMN `name`");
    }

}
