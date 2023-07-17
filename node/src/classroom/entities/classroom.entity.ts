import { Entity, Column, PrimaryGeneratedColumn } from "typeorm"

@Entity()
export class Classroom {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ type: 'varchar', length: 255, nullable: false })
    account: string;            // 账号

    @Column({ type: 'varchar', length: 255, nullable: false })
    name: string;               // 用户名

    @Column({ type: 'varchar', length: 255, nullable: false })
    reason: string;             // 申请理由

    @Column({ type: 'varchar', length: 255, nullable: false })
    date: string;               // 申请的日期

    @Column({ type: 'varchar', length: 255, nullable: false })
    time: string;               // 申请的时间

    @Column({ type: 'varchar', length: 255, nullable: false })
    classroomNumber: string;   // 申请的教室号

    @Column({ type: 'varchar', length: 255, nullable: false })
    state: string;              // 是否申请成功
}