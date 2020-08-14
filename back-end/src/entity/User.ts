import {
  BaseEntity,
  Column,
  CreateDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";
import { UserPlant } from "./UserPlant";

@Entity()
export class User extends BaseEntity {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column()
  email: string;

  @Column()
  username: string;

  @Column()
  password: string;

  @OneToMany((type) => UserPlant, (userPlant) => userPlant.plant)
  userPlants: UserPlant[];

  @CreateDateColumn()
  created: Date;

  @UpdateDateColumn()
  updated: Date;

  async toJson() {
    const user = await User.findOne(this.id);
    delete user.password;
    return JSON.stringify(user);
  }
}
