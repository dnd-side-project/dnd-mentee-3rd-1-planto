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

@Entity()
export class UserPlant extends BaseEntity {
  @PrimaryGeneratedColumn("uuid")
  id: string;

  // STUB User Relation
  // @ManyToOne()
  // user: User;

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
