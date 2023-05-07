import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class Classroom {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    reason: string;             // 申请理由

    @Column({ type: 'varchar', length: 255, nullable: false })
    time_frame: string;         // 申请的时间范围

    @Column({ type: 'varchar', length: 255, nullable: false })
    classroom_number: string;   // 申请的教室号
}