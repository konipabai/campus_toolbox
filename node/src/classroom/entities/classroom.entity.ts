import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class Classroom {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({type:'varchar', length:255, nullable: false})
    classroom_building: string; // 教室在哪栋楼

    @Column({type:'int', nullable: false})
    building_floors: number;    // 教室所在那栋楼的总层数

    @Column({type:'int', nullable: false})
    classroom_floor: number;    // 教室在第几层楼

    @Column({type:'varchar', length:255, nullable: false})
    classroom_number: string;     // 教室号
}
