import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class resultClassroom {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    reason: string;             // 申请理由

    @Column({ type: 'date', nullable: false })
    date: Date;               // 申请的日期

    @Column({ type: 'varchar', length: 255, nullable: false })
    time: string;               // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    location: string;           // 申请的地点

    @Column({ type: 'varchar', length: 255, nullable: false })
    floor: string;           // 申请的地点

    @Column({ type: 'varchar', length: 255, nullable: false })
    classroomNumber: string;   // 申请的教室号

    @Column({ type: 'varchar', length: 255, nullable: false })
    state: string;              // 是否申请成功
}