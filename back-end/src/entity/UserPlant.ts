import {
  BaseEntity,
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from "typeorm";
import { Plant } from "./Plant";
import { User } from "./User";

@Entity()
export class UserPlant extends BaseEntity {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  @Column()
  name: string;

  @ManyToOne((type) => User)
  @JoinColumn({ name: "user_id" })
  user: User;

  @ManyToOne((type) => Plant)
  @JoinColumn({ name: "plant_id" })
  plant: Plant;

  @Column()
  water: string;

  @CreateDateColumn()
  created: Date;

  @UpdateDateColumn()
  updated: Date;
}
